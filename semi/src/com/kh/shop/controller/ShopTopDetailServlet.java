package com.kh.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.board.model.vo.Attachment;

import com.kh.shop.model.service.ShopService;
import com.kh.shop.model.vo.Shop;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detailTop.sh")
public class ShopTopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopTopDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		
		
		Shop s = new ShopService().selectshop(sNo);
		ArrayList<Attachment> fileList =new ShopService().selectShAttachment(sNo);
		
		if(s != null) {
			
			// 조회수 증가시키는 서비스 요청
			System.out.println("너나오니 샵?");
			System.out.println(s);
			
			for(int i=0; i< fileList.size(); i++) {
			System.out.println("Filelist:"+fileList);
			System.out.println(i);}
			
			
			request.setAttribute("s", s);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/shop/shopTopDetailView.jsp").forward(request, response);
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
