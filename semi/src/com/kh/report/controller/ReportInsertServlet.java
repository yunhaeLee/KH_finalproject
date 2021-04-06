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
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/insert.re")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Report report=new Report();
		report.setReportContent(request.getParameter("content"));
		report.setReportObjNo(Integer.parseInt(request.getParameter("objNo")));
		report.setMemNo(request.getParameter("mno"));
		report.setReportCategory(request.getParameter("category"));
		report.setReportType(Integer.parseInt(request.getParameter("type")));
		
		new ReportService().insertReport(report);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
