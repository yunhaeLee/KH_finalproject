package com.kh.spring.mainCalendar.controller;

import org.springframework.beans.factory.annotation.Autowired;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mainCalendar.model.service.CalendarService;
import com.kh.spring.mainCalendar.model.vo.Calendar;


@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
 
	/* 메인 캘린더 */
	@RequestMapping("cmain.ca")
	public String mainView(Calendar ca, Model model, HttpSession session) throws Exception {
		Employee emp = (Employee)session.getAttribute("loginUser");

		ArrayList<Calendar> list = calendarService.listCalendar(ca);

		//System.out.println("DB에 있는 캘린더 : " + list);
		//System.out.println("로그인 : " + emp);
		
		model.addAttribute("list", list);
		
		System.out.println("캘린더 화면 캘린더 : " + list);
		
		return "mainCalendar/fullCalendar";
	}
	
	/* 일정 상세 보기 모달 확인용 */
	@RequestMapping("selectCalendar")
	@ResponseBody
	public Object selectEmployee(String calNo) {
		
		//System.out.println("넘어옴 : " + calNo);
		
		Calendar ca = calendarService.selectCalendar(calNo);
		//System.out.println(ca.toString());
		
		return ca;
	}
	
	/* 일정 추가 */
	@RequestMapping("cinsert.ca")
	public String insertCalendar(Calendar ca, Model model) {
		//System.out.println("거쳐감");
		
		//ca.setCalSDates(java.sql.Date.valueOf(ca.getCalSDate())); 
		//ca.setCalEDates();
		
		int result = calendarService.insertCalendar(ca);
		//System.out.println("일정 등록 : " + ca);

		return "redirect:cmain.ca";
	}
	
	/* 일정 수정 */
	@RequestMapping("cupdate.ca")
	public String updateCalendar(Calendar ca, Model model) {
		
		//System.out.print("수정된 일정 넘어옴 : " + ca);
		
		int result = calendarService.updateCalendar(ca);
		
		model.addAttribute(ca);
		
		return "redirect:cmain.ca";
	}
	
	/* 일정 삭제 */
	@RequestMapping("cdelete.ca")
	public String deleteCalendar(int calNo, HttpServletRequest request, Model model) {
		
		int result = calendarService.deleteCalendar(calNo);
		//System.out.println("삭제된 일정 넘어옴 : " + calNo);
		
		return "redirect:cmain.ca";	
	}
	
	/* 메인 */
	@ResponseBody
	@RequestMapping(value="calendarmain.ca", produces ="application/json;charset=UTF-8")
	public void MainCalendar(Calendar ca, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		ArrayList<Calendar> calList = calendarService.mainList(ca);
		System.out.println("캘린더 메인 : " + calList);
		  
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(calList,response.getWriter());
	}
	
}
