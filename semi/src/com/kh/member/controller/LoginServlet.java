package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	

	

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		String originPwd =(String) request.getAttribute("originPwd");
	
		
		Member loginUser = new MemberService().loginMember(userId,userPwd);
		
		
		
		System.out.println("loginUser : " + loginUser);
		
		if(loginUser !=null) {//로그인 성공했을경우
			
				if(loginUser.getBlacklist().equals("Y")) {
					request.setAttribute("msg", "블랙리스트 로그인 불가");
					
					RequestDispatcher view =request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
					
				}else {
			
			
				HttpSession session = request.getSession();
				session.setAttribute("loginUser",loginUser);
				session.setAttribute("userPwd", userPwd);
				
				session.setAttribute("originPwd", originPwd);
				
				System.out.println("originPwd: 로그인 서블릿     "+originPwd);
				
				response.sendRedirect(request.getContextPath());
				
				System.out.println("로그인성공");
				}
				
			
		}else { //실패했을 경우
			
			request.setAttribute("msg", "로그인에 실패하였습니다.");
			
			RequestDispatcher view =request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
			System.out.println("로그인실패!");
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
