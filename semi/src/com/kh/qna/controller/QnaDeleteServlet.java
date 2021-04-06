package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;

/**
 * Servlet implementation class QnaDeleteServlet
 */
@WebServlet("/deleteQ.qo")
public class QnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		int result = new QnaService().deleteQna(qno);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "Q&A 삭제 성공!!");
			response.sendRedirect("list.qo");
		}else {
			request.setAttribute("msg", "Q&A 삭제에 실패했습니다.");
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
