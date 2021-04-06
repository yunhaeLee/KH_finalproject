package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;

/**
 * Servlet implementation class ChatListServlet
 */
@WebServlet("/getChatList")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mno=Integer.parseInt(request.getParameter("mno"));
		int mno2=Integer.parseInt(request.getParameter("mno2"));
		
		ArrayList<Chat> list=new ChatService().getChatList(mno,mno2);
		
		if(list!=null) {
			
			Gson gson=new GsonBuilder().create();
			
			response.setContentType("application/json; charset=utf-8");
			gson.toJson(list,response.getWriter());
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
