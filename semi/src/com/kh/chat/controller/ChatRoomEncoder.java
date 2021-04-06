package com.kh.chat.controller;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.chat.model.vo.ChatRoom;

public class ChatRoomEncoder implements Encoder.Text<ChatRoom>{

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(EndpointConfig arg0) {
	
	}

	@Override
	public String encode(ChatRoom cr) throws EncodeException {
		
		Gson gson=new GsonBuilder().create();
		String json=gson.toJson(cr);
        
		
		return json;
	}

}
