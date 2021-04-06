package com.kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.report.model.service.ReportService;
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class ReportDetailServlet
 */
@WebServlet("/detail.re")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno=Integer.parseInt(request.getParameter("rno"));
		String page=request.getParameter("page");
		Report r=new ReportService().getReport(rno);
		
		if(r!=null) {
			request.setAttribute("report", r);
			request.setAttribute("page", page);
			request.getRequestDispatcher("views/report/reportDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "신고 조회 실패");
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
