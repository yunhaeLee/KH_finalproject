package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class memberJoinServlet
 */
@WebServlet("/insert.me")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String m_name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lon = Double.parseDouble(request.getParameter("lon"));
		String region1 =request.getParameter("region1");
		String region2 =request.getParameter("region2");
		
		
		

		
		Member m = new Member(m_name,id,pwd,phone,email,lat,lon,region1,region2);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0 ) {
			request.getSession().setAttribute("msg", "회원가입성공");
			
			response.sendRedirect(request.getContextPath()); //초기화면으로 돌아가기
			
			System.out.println("회원가입 성공!-서블릿-");
			
		}else {
			
			request.setAttribute("msg", "회원가입실패");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response); 
			System.out.println("회원가입 실패!-서블릿-");
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
