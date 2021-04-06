package com.kh.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageDto;
import com.kh.report.model.service.ReportService;
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/list.re")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int curPage=Integer.parseInt(request.getParameter("page"));
		
		int total=new ReportService().getTotalCount();
		
		
		PageDto pageDto=new PageDto(total,curPage);
		ArrayList<Report> list=new ReportService().getReportList(pageDto);
		

		
		
		if(list!=null) {
			request.setAttribute("list", list);
			
			request.setAttribute("pageDto", pageDto);
			request.getRequestDispatcher("views/report/reportList.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "신고 리스트 조회 실패");
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
