package com.kh.spring.message.controller;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.GsonBuilder;

import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.message.model.service.MessageService;
import com.kh.spring.message.model.vo.Message;



@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired 
	private EmployeeService employeeService;
	
 
	/* 메세지를 보낼 수 있는 사원 리스트 (본인 제외) */
	@RequestMapping("msgView.ma")
	public String selectEmpList(Model model, HttpSession session) throws Exception {
		
		Employee empNo = (Employee)session.getAttribute("loginUser");

		ArrayList<Employee> list = messageService.msgEmpList(empNo);
		
		System.out.println("메신저 로그인 : " + empNo);
		model.addAttribute("list", list);
		
		return "message/messageMainView";
	}
	
	/* 메세지 채팅창 */
	@RequestMapping("selectMsg")
	@ResponseBody
	public Object selectMsg(String empNo, HttpSession session) {
		Employee loginNo = (Employee)session.getAttribute("loginUser");
		
		Employee emp = employeeService.selectEmployee(empNo);

		String mem1 = emp.getEmpNo().substring(6,9);
		String mem2 = loginNo.getEmpNo().substring(6,9);
		
		int meme1 = Integer.parseInt(mem1);
		int meme2 = Integer.parseInt(mem2);
		
		if(meme1 > meme2) {
			String chatNo = mem2 + mem1;
			emp.setChatNo(chatNo);
		}else {
			String chatNo = mem1 + mem2;
			emp.setChatNo(chatNo);
		}
		
		return emp;
	}
	
	/* 메세지 보냄 */
	@ResponseBody
	@RequestMapping("minsert.ma")
	public String insertMsg(Message msg) {

		int result = messageService.insertMsg(msg);
		
		return String.valueOf(result);
	}
	
	/* 메세지 불러옴 */
	@RequestMapping(value="mlist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectmList(String chatNo) {
		ArrayList<Message> msgList = messageService.selectMsgList(chatNo);
		
		return new GsonBuilder().setDateFormat("yy년 M월 d일 HH시 mm분").create().toJson(msgList);
	}
	
}
