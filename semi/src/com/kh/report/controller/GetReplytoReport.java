package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.board.model.vo.Reply;
import com.kh.report.model.service.ReportService;

/**
 * Servlet implementation class GetReplytoReport
 */
@WebServlet("/getReply")
public class GetReplytoReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReplytoReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno=Integer.parseInt(request.getParameter("rno"));
		
		Reply r=new ReportService().getReply(rno);
		
		if(r!=null) {
			
			response.setContentType("application/json; charset=utf-8");
			
			Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(r,response.getWriter());
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
