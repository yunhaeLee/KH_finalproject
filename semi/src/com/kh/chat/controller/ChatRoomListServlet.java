package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.ChatRoom;

/**
 * Servlet implementation class ChatRoomListServlet
 */
@WebServlet("/getChatRoomList")
public class ChatRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatRoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int mno=Integer.parseInt(request.getParameter("mno"));
		
		
		ArrayList<ChatRoom> list=new ChatService().getChatRoomList(mno);
		
		if(list!=null) {

			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(list,response.getWriter());
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
