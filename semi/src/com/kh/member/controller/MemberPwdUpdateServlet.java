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
 * Servlet implementation class MemberPwdUpdateServlet
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();		
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		Member updateMem = new MemberService().updatePwd(userId,userPwd,newPwd);
		
		RequestDispatcher view = request.getRequestDispatcher("views/member/myPage.jsp");
		if(updateMem !=null) {

			request.setAttribute("alarm", "비밀번호 변경 성공!");
			request.getSession().setAttribute("loginUser", updateMem);
			
			
			
		}else {
			request.setAttribute("alarm", "비밀번호 변경 실패! 현재비밀번호를 확인하세요");
		
			System.out.println("비밀번호 변경 실패");
		}

		
		view.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
