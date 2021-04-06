package com.kh.chat.model.vo;

public class ChatRoom {

	
	private int cRNO;
	private int mno1;
	private int mno2;
	private String mName;
	private String lastChat;
	private int unreadCount;
	private String existRoom;
	
	public ChatRoom() {
		
	}


	public ChatRoom(int cRNO, int mno1, int mno2, String mName, String lastChat, int unreadCount, String existRoom) {
		
		this.cRNO = cRNO;
		this.mno1 = mno1;
		this.mno2 = mno2;
		this.mName = mName;
		this.lastChat = lastChat;
		this.unreadCount = unreadCount;
		this.existRoom = existRoom;
	}






	public String getExistRoom() {
		return existRoom;
	}






	public void setExistRoom(String existRoom) {
		this.existRoom = existRoom;
	}






	public int getcRNO() {
		return cRNO;
	}

	public void setcRNO(int cRNO) {
		this.cRNO = cRNO;
	}

	public int getMno1() {
		return mno1;
	}

	public void setMno1(int mno1) {
		this.mno1 = mno1;
	}

	public int getMno2() {
		return mno2;
	}

	public void setMno2(int mno2) {
		this.mno2 = mno2;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}



	public String getLastChat() {
		return lastChat;
	}



	public void setLastChat(String lastChat) {
		this.lastChat = lastChat;
	}



	public int getUnreadCount() {
		return unreadCount;
	}



	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}






	@Override
	public String toString() {
		return "ChatRoom [cRNO=" + cRNO + ", mno1=" + mno1 + ", mno2=" + mno2 + ", mName=" + mName + ", lastChat="
				+ lastChat + ", unreadCount=" + unreadCount + ", existRoom=" + existRoom + "]";
	}




	
	
	
	
}
