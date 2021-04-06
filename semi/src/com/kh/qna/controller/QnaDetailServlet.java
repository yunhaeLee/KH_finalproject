package com.kh.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/detail.qo")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		Qna qna = new QnaService().selectQna(qno);
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			RequestDispatcher view = request.getRequestDispatcher("views/qna/QnaDetailView.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "게시판 상세조회 실패!!");
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
