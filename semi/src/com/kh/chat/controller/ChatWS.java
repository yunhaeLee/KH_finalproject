package com.kh.chat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;
import com.kh.chat.model.vo.ChatRoom;


//WebSocket의 호스트 주소 설정
@ServerEndpoint(value="/chat",encoders= { ChatEncoder.class})
public class ChatWS {

	
		
		private static Map<Integer,Session> getSession= Collections.synchronizedMap(new HashMap<>()); //mno,session
		private static Map<Session,Integer> getMno=Collections.synchronizedMap(new HashMap<>());

		private static Map<Integer,Integer> getCrno=Collections.synchronizedMap(new HashMap<>()); //mno,crno
	 	ChatService cs=new ChatService();
	 	ChatListWS clWS=new ChatListWS();
	 	
		// WebSocket으로 브라우저가 접속하면 요청되는 함수
		@OnOpen
		public void handleOpen() {
		// 콘솔에 접속 로그를 출력한다.
		System.out.println("ChatWS : client is now connected...");
		}
		
		// WebSocket으로 메시지가 오면 요청되는 함수
		@OnMessage
		public void handleMessage(String message,Session userSession) {
				
			if(message.equals("delete")) { //채팅방 나가기버튼 눌렀을 때
				if(getMno.containsKey(userSession)) { //맵에 저장되어있는지 확인
					
					int mno=getMno.get(userSession);
					
					getMno.remove(userSession);
					
					if(getSession.containsKey(mno)) {
						getSession.remove(mno);
						

					}
					if(getCrno.containsKey(mno)) {
						getCrno.remove(mno);
						System.out.println("deleted from Map!!");
						for(int i : getCrno.keySet()) {
							System.out.println(i+" = "+getCrno.get(i));
						}
					}
					
				}
			}else {
			
			Gson gson=new GsonBuilder().create();
			Chat chat=gson.fromJson(message, Chat.class);
			System.out.println(chat);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yy/MM/dd HH:mm");
			
			if(chat.getChatContent()==null) { //메세지 값이 없으면 ->처음 채팅방 접속 
				
				int crno=cs.getChatRoom(chat.getChatSender(),chat.getChatReceiver());  //이미 있는 채팅방인지 확인
					System.out.println("채팅방번호 : "+crno);
				if(crno!=0) { //있는 채팅방이면 
					getMno.put(userSession, chat.getChatSender()); //보낸사람 정보 맵에 저장 
					getSession.put(chat.getChatSender(), userSession);
					getCrno.put(chat.getChatSender(), crno); //지금 접속한 채팅방 번호 저장 
					
					//db 메세지 읽음 처리 
					
					cs.readMyMessage(crno,chat.getChatSender());
					
					for(int i : getCrno.keySet()) {
						System.out.println(i+" = "+getCrno.get(i));
					}
					
					if(getCrno.containsKey(chat.getChatReceiver())) { //받는 사람도 접속중이면 
							if(getCrno.get(chat.getChatReceiver())==crno) { //같은 채팅방에 
									try {
										System.out.println("메세지 보냄");
										getSession.get(chat.getChatReceiver()).getBasicRemote().sendObject(new Chat(chat.getChatSender(),chat.getChatReceiver()));
										//상대방에게 빈 메세지 보내기 --> 채팅방에 1 없애기
									
									} catch (IOException | EncodeException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								 
							}
						
					}
				
				}
					
				
			}else { //메세지값이 있으면 
				
				String dateStr=sdf.format(new Date());
				chat.setChatDate(dateStr); //채팅 시간 설정
				
				ChatRoom cr=new ChatRoom(); //업데이트할 채팅방 정보 
				
				
				if(getCrno.containsKey(chat.getChatSender())) { //보낸사람에게 저장된 채팅방이 있으면 
					
					cr.setExistRoom("Y"); //채팅방 객체에 존재하던 채팅방이라는걸 표시 
					cr.setcRNO(getCrno.get(chat.getChatSender())); // 채팅방객체에 채팅방번호 설정 
					cr.setLastChat(chat.getChatContent()); //채팅방 객체에 마지막 채팅 설정
					
					
					chat.setCrno(getCrno.get(chat.getChatSender())); //채팅객체 채팅방 설정 
					chat.setReadStatus("N"); //채팅객체 안읽음 표시
					
					
					if(getCrno.containsKey(chat.getChatReceiver())) {  //메세지 받는 상대방도 채팅방 접속중이면 
						if(getCrno.get(chat.getChatReceiver())==getCrno.get(chat.getChatSender())) { 
							// 보낸사람과 받는 사람이 같은 채팅방에 지금 접속중이면 
							
							
							chat.setReadStatus("Y"); //채팅 읽음으로 바꿈
							
							
							
							try {
								getSession.get(chat.getChatReceiver()).getBasicRemote().sendObject(chat); //채팅 받는 사람에게 메세지 보내기
							} catch (IOException | EncodeException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							cr.setUnreadCount(0); // 안읽은 채팅 갯수 0으로 설정 
							clWS.sendChatRoomMessage(chat.getChatReceiver(),cr);
							
							
							
						}else { //접속중이지만 다른채팅방 일 때 
							
							
							cr.setUnreadCount(1); // 안읽은 채팅 갯수 1으로 설정 
							clWS.sendChatRoomMessage(chat.getChatReceiver(),cr); // 채팅방 없데이트 메세지 보내기
						
						
						}
						
						
					}else { //메세지 받는 상대방이 채팅방 접속중 아닐때 
						
						if(clWS.isLogin(chat.getChatReceiver())) { //로그인중이면
							
							cr.setUnreadCount(1); // 안읽은 채팅 갯수 1으로 설정 
							clWS.sendChatRoomMessage(chat.getChatReceiver(),cr);
							
						}
					
					
					}
					
					try {
						getSession.get(chat.getChatSender()).getBasicRemote().sendObject(chat);
						//채팅 보낸 사람에게 메세지 보내기
					} catch (IOException | EncodeException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
					cs.insertChat(chat); //db에 채팅 저장 
					
					cr.setUnreadCount(0); // 안읽은 채팅 갯수 0으로 설정 
					clWS.sendChatRoomMessage(chat.getChatSender(),cr);
			
				
				
				
				
				}else { // 저장된 채팅방이 없으면 (새로 만들어야할 채팅방)
					int crno=cs.createChatRoom(chat.getChatSender(),chat.getChatReceiver());
					
					if(crno!=0) { //만들기 실패한게 아니면
						
						System.out.println("만들어진 채팅방 : "+crno);
						
						getMno.put(userSession, chat.getChatSender()); //보낸사람 정보 맵에 저장 
						getSession.put(chat.getChatSender(), userSession);
						getCrno.put(chat.getChatSender(), crno); //지금 접속한 채팅방 번호 저장 
						
						for(int i : getCrno.keySet()) {
							System.out.println(i+" = "+getCrno.get(i));
						}
						
						cr.setcRNO(crno); //채팅보낸사람에게 갈 메세지 
						cr.setMno1(chat.getChatSender());
						cr.setMno2(chat.getChatReceiver());
						cr.setLastChat(chat.getChatContent());
						cr.setUnreadCount(0);
						cr.setExistRoom("N");
						cs.setName(cr);
						System.out.println(cr);
						
						clWS.sendChatRoomMessage(chat.getChatSender(), cr);
						
						if(clWS.isLogin(chat.getChatReceiver())) { //로그인중이면
						
							ChatRoom cr2 =new ChatRoom();
							
							cr2.setcRNO(crno); //채팅받는사람에게 갈 메세지 
							cr2.setMno1(chat.getChatReceiver());
							cr2.setMno2(chat.getChatSender());
							cr2.setLastChat(chat.getChatContent());
							cr2.setUnreadCount(1);
							cr2.setExistRoom("N");
							cs.setName(cr2);
							
							
							clWS.sendChatRoomMessage(chat.getChatReceiver(), cr2);
							System.out.println(cr2);
						}
						
						chat.setCrno(crno);
						chat.setReadStatus("N");
						
						try {
							getSession.get(chat.getChatSender()).getBasicRemote().sendObject(chat);
						} catch (IOException | EncodeException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						cs.insertChat(chat);
						
					}
					
					
				}
				
				
			} //메세지 값이 있으면 
			} //delete가 아니면 
	
		
		
		}
		
		// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
		@OnClose
		public void handleClose(Session userSession) {
		// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("ChatWS : client is now disconnected...");

		}
		
		// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
		@OnError
		public void handleError(Throwable t) {
		// 콘솔에 에러를 표시한다.
		t.printStackTrace();
		}


		
	}


