package com.kh.chat.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.chat.model.vo.ChatRoom;
//WebSocket의 호스트 주소 설정
@ServerEndpoint(value="/chatList" , encoders= { ChatRoomEncoder.class})
public class ChatListWS {
	
	private static Map<Integer,Session> getSession= Collections.synchronizedMap(new HashMap<>());
	private static Map<Session,Integer> getMno=Collections.synchronizedMap(new HashMap<>());
 	
	// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen() {
	// 콘솔에 접속 로그를 출력한다.
	System.out.println("ChatListWS : client is now connected...");
	}
	
	// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(int mno,Session userSession) {
	
		System.out.println("ChatListWS : "+mno+" is connected");
		getSession.put(mno,userSession);
		getMno.put(userSession, mno);
		
		
		
	}
	
	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
	// 콘솔에 접속 끊김 로그를 출력한다.
	System.out.println("ChatListWS : client is now disconnected...");
		if(getMno.containsKey(userSession)) {
			int mno=getMno.get(userSession);
			
			getMno.remove(userSession);
			
			if(getSession.containsKey(mno)) {
				getSession.remove(mno);
			}
		}

	
	}
	
	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	@OnError
	public void handleError(Throwable t) {
	// 콘솔에 에러를 표시한다.
	t.printStackTrace();
	}

	public boolean isLogin(int chatReceiver) {
		
		if(getSession.containsKey(chatReceiver)) {
			return true;
		}
		
		return false;
	}

	public void sendChatRoomMessage(int mno, ChatRoom cr) {
		try {
			getSession.get(mno).getBasicRemote().sendObject(cr);
		} catch (IOException | EncodeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	
}
