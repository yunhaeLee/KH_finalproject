package com.kh.chat.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;
import com.kh.chat.model.vo.ChatRoom;
public class ChatService {

	public ArrayList<ChatRoom> getChatRoomList(int mno) {
		
		Connection conn=getConnection();
		
		ArrayList<ChatRoom> list=new ChatDao().getChatRoomList(conn,mno);
		
		if(!list.isEmpty()) {
			
			
			for(ChatRoom cr:list) {
				
				new ChatDao().setLastChat(conn,cr);
				new ChatDao().setUnreadCount(conn, cr);
				
				
				
			}
			
			
			
		}
		
		close(conn);
		
		
		
		return list;
	}

	public ArrayList<Chat> getChatList(int mno, int mno2) {
		Connection conn=getConnection();
		
		ArrayList<Chat> list=new ChatDao().getChatList(conn,mno,mno2);
		close(conn);
		return list;
	}

	public int getChatRoom(int sender, int receiver) {
		Connection conn=getConnection();
		int crno=new ChatDao().getChatRoom(conn, sender,receiver);
		
		
		close(conn);
		return crno;
	}

	public void readMyMessage(int crno, int chatSender) {
		
		Connection conn=getConnection();
		
		new ChatDao().readMyMessage(conn,crno,chatSender);
		
		commit(conn);
		
		close(conn);
	}

	public void insertChat(Chat chat) {
		
		Connection conn=getConnection();
		
		int result=new ChatDao().insertChat(conn,chat);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	public int createChatRoom(int sender, int receiver) {
		
		Connection conn=getConnection();
		
		int result=new ChatDao().insertChatRoom(conn,sender,receiver);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
			close(conn);
			return 0;
		}
		
		int crno=new ChatDao().getChatRoom(conn, sender, receiver);
		close(conn);
		
		return crno;
	}

	public void setName(ChatRoom cr) {
		Connection conn=getConnection();
		
		new ChatDao().setName( conn ,cr);
		
		close(conn);
		
	}

}
