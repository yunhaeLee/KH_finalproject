package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/insert.qo")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getM_no();System.out.println(content);
		
		Qna q = new Qna();
		
		q.setQnaTitie(title);
		q.setQnaContent(content);
		q.setQnaWriter(String.valueOf(userNo));
		
		int result = new QnaService().insertQna(q);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "공지사항이 성공적으로 등록되었습니다.");
			response.sendRedirect("list.qo");
		} else { 
			request.setAttribute("msg", "공지사항 등록 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

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
