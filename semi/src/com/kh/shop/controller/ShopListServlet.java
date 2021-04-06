package com.kh.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.shop.model.service.ShopService;
import com.kh.shop.model.vo.Shop;


/**
 * Servlet implementation class ShopListServlet
 */
@WebServlet("/list.sh")
public class ShopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		
		double lat=loginUser.getLat();
		
		double lon=loginUser.getLon();
		
		
		ArrayList<Shop> list= new ShopService().selectShList(lat,lon);
		System.out.println(list);
		request.setAttribute("list",list );
		request.getRequestDispatcher("views/shop/shopListview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
