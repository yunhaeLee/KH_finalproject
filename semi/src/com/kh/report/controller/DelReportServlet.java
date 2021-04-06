package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.report.model.service.ReportService;

/**
 * Servlet implementation class DelReportServlet
 */
@WebServlet("/delReport")
public class DelReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page=Integer.parseInt(request.getParameter("page"));
		
		int rno=Integer.parseInt(request.getParameter("rno"));
		
		int result=new ReportService().deleteReport(rno);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "신고 삭제 성공");
			response.sendRedirect(request.getContextPath()+"/list.re?page="+page);
			
		}else {
			request.setAttribute("msg", "신고 삭제 실패");
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
