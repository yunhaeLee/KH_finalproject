package com.kh.spring.common.interceptor;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.spring.employee.model.vo.Employee;



public class dlistinterceptor extends HandlerInterceptorAdapter {
	private Logger log = LoggerFactory.getLogger(dlistinterceptor.class); // 로그 선언

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session =request.getSession();
		Employee loginUser=(Employee) session.getAttribute("loginUser");



		if (loginUser == null) {
			log.info("비로그인 상태에서 [" + request.getRequestURI() + "] 접근하려고 합니다");
			request.setAttribute("msg", "로그인후 이용하세요 ");
			request.getRequestDispatcher("/WEB-INF/views/common/login.jsp").forward(request, response);
			return false;
		} else {
			return super.preHandle(request, response, handler);
		}

	}
}
