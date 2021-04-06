package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.report.model.service.ReportService;

/**
 * Servlet implementation class GetBoardServlet
 */
@WebServlet("/getBoard")
public class GetBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno=Integer.parseInt(request.getParameter("bno"));
		
		Board b = new ReportService().selectBoard(bno);
		Attachment at = new ReportService().selectAttachment(bno);
		
		if(b != null) {
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/report/boardDetail.jsp").forward(request, response);
		}else {
			
			request.setAttribute("msg", "게시판 상세조회 실패");
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
