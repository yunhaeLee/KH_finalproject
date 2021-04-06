package com.kh.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Reply;

/**
 * Servlet implementation class QnaReplyInsertServlet
 */
@WebServlet("/qinsert.qo")
public class QnaReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int qId= Integer.parseInt(request.getParameter("qId"));
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getM_no();

		Reply r = new Reply();
		
		r.setReplyContent(content);
		r.setRefQnaId(qId);
		r.setReplyWriter(String.valueOf(writer));
		
		int result = new QnaService().insertReply(r);
		PrintWriter out = response.getWriter();
		
		if(result > 0 ) {
			out.print("success");
		}else {
			out.print("fail");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
