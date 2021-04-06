package com.kh.spring.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mainCalendar.model.vo.Calendar;
import com.kh.spring.todo.model.service.TodoService;
import com.kh.spring.todo.model.vo.Todo;

@Controller
public class TodoCotroller {

	@Autowired
	private TodoService todoService;


	@RequestMapping("todoListView.do")
	public String listTodo(String empNo,Model m, HttpSession session) throws Exception {
		Employee emp= (Employee) session.getAttribute("loginUser");
		 
		 
		 System.out.println("접속자:"+emp);
			
		ArrayList<Todo> todolist = todoService.selectTodo(emp);
		
		
		m.addAttribute("todolist", todolist);
		
		System.out.println("todolist"+todolist);
		return "todo/todoView";
	}
	
   
	@RequestMapping(value="todoMainListView.do",produces ="application/json;charset=UTF-8")
	public void MainlistTodo(String empNo,Model m, HttpSession session,HttpServletRequest request, HttpServletResponse response ) throws Exception {
		Employee emp= (Employee) session.getAttribute("loginUser");
		 
		ArrayList<Todo> todolist =todoService.selectMainTodo(emp);

		System.out.println("todolist main::"+todolist);
		response.setContentType("application/json;charset=utf-8");
		new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH시mm").create().toJson(todolist,response.getWriter());
		
		
	}
	


	@RequestMapping("insertTodo.do")
	public String insertTodo(Todo t, HttpServletRequest request, Model model) {
		System.out.println("inserttodo:::" + t);

		int result = todoService.insertTodo(t);

		return "redirect:todoListView.do";

	}

	@RequestMapping("doingTodo.do")
	public String modifyTodo(int tno, Model m, HttpServletRequest request) {
		int result = todoService.updateDoing(tno);

		return "redirect:todoListView.do";
	}

	@RequestMapping("doneTodo.do")
	public String modifyTodo2(int tno, Model m, HttpServletRequest request) {
		int result = todoService.updateDone(tno);

		return "redirect:todoListView.do";
	}

	@RequestMapping("deleteTodo.do")
	public String deleteTodo(int tno, Model model, HttpServletRequest request) {
		int result = todoService.deleteTodo(tno);

		return "redirect:todoListView.do";
	}
	
	/*  상세 보기 모달 확인용 */
	@RequestMapping("selectTodo.do")
	@ResponseBody
	public Object selectTodo(String todoNo) {
		
	
		
		Todo t = todoService.selectTodo(todoNo);
		System.out.println("넘어옴 : " + t);
		
		return t;
		
		
	}
	
	
	


@RequestMapping("updateTodo.do")
public String updateCalendar(Todo t, Model model) {
	
	System.out.print("수정된 일정 넘어옴 : " + t);
	
	 int result = todoService.updateTodo(t);
	
	
	model.addAttribute(t);
	
	return "redirect:todoListView.do";
	
}
}