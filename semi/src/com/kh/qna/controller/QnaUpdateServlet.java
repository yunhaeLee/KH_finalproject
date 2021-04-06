package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/update.qo")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	
	int qno = Integer.parseInt(request.getParameter("qno"));
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Qna q = new Qna();
	q.setQnaTitie(title);
	q.setQnaContent(content);
	q.setQnaNo(qno);
	
	int result = new QnaService().updateQna(q);
	
	if(result > 0) {
		request.getSession().setAttribute("msg", "공지사항 수정 성공!");
		response.sendRedirect("detail.qo?qno=" + qno);
	}else {
		request.setAttribute("msg", "공지사항 수정 실패!!");
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
