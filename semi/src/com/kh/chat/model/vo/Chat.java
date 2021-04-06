package com.kh.chat.model.vo;

import java.util.Date;

public class Chat {

	private String chatContent;
	private String chatDate;
	private int crno;
	private int chatReceiver;
	private int chatSender;
	private String readStatus;
	
	public Chat() {
		
	}
	public Chat(int sender,int receiver) {
		this.chatSender=sender;
		this.chatReceiver=receiver;
		this.chatContent=null;
		this.chatDate=null;
		this.crno=0;
		readStatus=null;
		
	}
	

	public Chat(String chatContent, String chatDate, int crno, int chatReceiver, int chatSender, String readStatus) {
		
		this.chatContent = chatContent;
		this.chatDate = chatDate;
		this.crno = crno;
		this.chatReceiver = chatReceiver;
		this.chatSender = chatSender;
		this.readStatus = readStatus;
	}

	

	public String getChatDate() {
		return chatDate;
	}



	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}



	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}



	public int getCrno() {
		return crno;
	}

	public void setCrno(int crno) {
		this.crno = crno;
	}

	public int getChatReceiver() {
		return chatReceiver;
	}

	public void setChatReceiver(int chatReceiver) {
		this.chatReceiver = chatReceiver;
	}

	public int getChatSender() {
		return chatSender;
	}

	public void setChatSender(int chatSender) {
		this.chatSender = chatSender;
	}

	public String getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}

	@Override
	public String toString() {
		return "Chat [chatContent=" + chatContent + ", chatDate=" + chatDate + ", crno=" + crno + ", chatReceiver="
				+ chatReceiver + ", chatSender=" + chatSender + ", readStatus=" + readStatus + "]";
	}
	
	
	
}
