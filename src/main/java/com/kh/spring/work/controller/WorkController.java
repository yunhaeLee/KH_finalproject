package com.kh.spring.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.employee.model.vo.Employee;
//import com.kh.spring.todo.controller.aTodo;
import com.kh.spring.todo.model.vo.Todo;
import com.kh.spring.work.model.service.WorkService;
import com.kh.spring.work.model.vo.Work;



@Controller
public class WorkController {
	
	@Autowired
	private WorkService workService;

	
	
	
	/*
	
	@RequestMapping(value="WorkMainView.work",produces ="application/json;charset=UTF-8")
	public void MainlistWork(String empNo,Model model, HttpSession session,HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		
		Employee emp= (Employee) session.getAttribute("loginUser");
		ArrayList<Work> workUser =workService.selectUser(emp);
		System.out.println("메인에 던지는 유저의 최신 근태::"+workUser);
		response.setContentType("application/json;charset=utf-8");
		new GsonBuilder().setDateFormat("yyyy-MM-dd-HH-mm").create().toJson(workUser,response.getWriter());
		//model.addAttribute("workUser",workUser);
		
		
	}
	*/
	
	

	
	
	
	@RequestMapping("view.work")
	public String selectList(@RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {

			
			Employee emp= (Employee) session.getAttribute("loginUser");
			System.out.println("work emp ddd"+emp);
			int listCount = workService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage,10,10);
			
			ArrayList<Work> list = workService.selectListCount(pi,emp);
			System.out.println("근태 list 세션 "+list);
			
			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
	
		
		return "work/workTest";
	}
	
	
	
	
	
	/*
	@RequestMapping("view.workMain")
	public String viewWorkMain() {
		
		return "work/workMain";
	}
	*/
	
	@RequestMapping("view.workMain2")
	public String viewWorkMain2(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("workmain 시작");
		Employee emp= (Employee) session.getAttribute("loginUser");
		//ArrayList<Work> workUser = workService.selectUser(emp);
		System.out.println("emp 임시"+emp);
		//System.out.println("work컨트롤러의 workUser 한줄"+workUser);
		//model.addAttribute("workUser",workUser);
		return "work/workMain2";
	}
	
	/*
	@RequestMapping(value="view.workMain",produces ="application/json;charset=UTF-8")
	public ArrayList<Work> viewWorkMain(String empNo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("work메인 시작   ");
		
		//Employee emp= (Employee) session.getAttribute("loginUser");
		ArrayList<Work> workUser = workService.selectUser(empNo);
		response.setContentType("application/json;charset=utf-8");
		System.out.println("work컨트롤러의 workUser 한줄 메인으로 던지기"+workUser);
		new Gson().toJson(workUser,response.getWriter());
		
		return workUser;
	}
	*/
	@RequestMapping(value="view.workMain",produces ="application/json;charset=UTF-8")
	public void viewWorkMain(String empNo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("work메인 시작   ");
		
		//Employee emp= (Employee) session.getAttribute("loginUser");
		ArrayList<Work> workUser = workService.selectUser(empNo);
		response.setContentType("application/json;charset=utf-8");
		System.out.println("work컨트롤러의 workUser 한줄 메인으로 던지기"+workUser);
		new Gson().toJson(workUser,response.getWriter());

	}

	
	////////////////////////////////////////////////////////////////시작
	
	
	@RequestMapping(value="start.work",method=RequestMethod.POST)//원래 eno timeNow // Work work //@RequestParam("empNo") String empNo
	public String workStart(Work Times,@RequestParam("empNo") String empNo, HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		
		
		//System.out.println(timeNow);//2021-03-27 03:41:43
		//System.out.println(timeNow.getClass().getName());//java.lang.String
		//System.out.println(eno);//951220103
		// 찍어보기


		Work preWork = workService.selectTimes(empNo);
		//System.out.println("preWork :: "+preWork.toString());

		System.out.println("사원근태 최신 로우!! : "+preWork);
		
		if(preWork==null){
			System.out.println("경유지 1");
			
		}else {
			Times.setWorkStack(preWork.getWorkStack());//전꺼
			Times.setWorkExceed(preWork.getWorkExceed());
			Times.setWorkRemain(preWork.getWorkRemain());
		}
		
		System.out.println("경유지 2");
		
		/////////////////////////////

		//model.addAttribute("Times", Times);
		
		
		int result= workService.insertWork(Times);//최초 출근 시작!!!!!!!!!!
		System.out.println("경유지 3");

		//Times.setWorkDay(preWork.getWorkDay());
		
		if(preWork==null) {
			System.out.println("최초출근자이다.");
		}else {
			Times.setWorkDay(preWork.getWorkDay());
			int result3= workService.updateWorkDay(Times);//주간리셋 
		}
		
		
		if(preWork==null){
			System.out.println("경유지 4");
			int result5 =workService.insertwork2(empNo);
		}else {
		
		int result4 =workService.insertwork2(empNo);//시작( 마지막 2속성 분)넣기
		}
		//model.addAttribute("loginUser", loginUser);
		///////////////////////////////
		System.out.println("경유지 5");
		Employee emp= (Employee) session.getAttribute("loginUser");
		ArrayList<Work> workUser = workService.selectUser(empNo);
		model.addAttribute("workUser",workUser);
		
		//int result = workService.insertWork(work);
		
		
		
		
		
		return "redirect:/";
		/*
		if (result4>0) {
			return "work/workMain2";
		}else {
			return "location.reload";
		}
		*/
	}
	
	@RequestMapping("end.work1")//@RequestParam("empNo") String empNo Work w
	public String workEnd(@ModelAttribute Work w,@RequestParam("empNo") String empNo, HttpServletRequest request, HttpServletResponse response, Model model,HttpSession session) {
		
		//SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date timeNow = transFormat.parse(time);
		
		
		
		//Work work = workService.selectWork(empNo);

		
		//int result = workService.updateWork1(empNo);
		//int result2 = workService.updateWork2(empNo);
		//int result3 = workService.updateWork3(empNo);
		
		
		//w.setWorkStack(preWork.getWorkStack());
		//w.setWorkExceed(preWork.getWorkExceed());
		//w.setWorkRemain(preWork.getWorkRemain());

		//System.out.println("preWork22 :: "+preWork.toString());
		


		
		
		
		
		
		System.out.println("WWWW1 :: "+w.toString());
		
		
		int result = workService.updateWork1(w);
		System.out.println("WWWW2 :: "+w.toString());
		int result2 = workService.updateWork2(w);
		System.out.println("WWWW3 :: "+w.toString());
		int result3 = workService.updateWork3(w);
		
		
		
		
		Work preWork = workService.selectTimes(empNo);
		w.setWorkStack(preWork.getWorkStack());
		w.setWorkExceed(preWork.getWorkExceed());
		w.setWorkRemain(preWork.getWorkRemain());
		w.setWorkSum(preWork.getWorkSum());
		w.setWorkRemainTotal(preWork.getWorkRemainTotal());//?? 왜안되
		w.setWorkDay(preWork.getWorkDay());//이건왜됨
		w.setWorkDayReset(preWork.getWorkDayReset());
		
		//w.setWorkRemain(preWork.getWorkRemainTotal());
		
		System.out.println("WWWW4 :: "+w.toString());
		int result4 = workService.updateWork4(w);
		System.out.println("WWWWE :: "+w.toString());

		
		int result5 =workService.updateMin(empNo);//시작(분)넣기
		
		
		//Employee emp= (Employee) session.getAttribute("loginUser");
		ArrayList<Work> workUser = workService.selectUser(empNo);/////
		model.addAttribute("workUser",workUser);
		
		if (result4>0) {//4
			return "redirect:/";//"work/workMain2"
		}else {
			return "redirect:/";
		}
		
	}
	
	/*
	@RequestMapping(value="workmainList.work",produces ="application/json;charset=UTF-8")
	public void MainlistTodo(String empNo,Model m, HttpSession session,HttpServletRequest request, HttpServletResponse response ) throws Exception {
		Employee emp= (Employee) session.getAttribute("loginUser");
		 
		ArrayList<Work> todolist =workService.selectMainTodo(emp);
		
		System.out.println("todolist main::"+todolist);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(todolist,response.getWriter());//
		
	}
	*/
	
	/*
	@RequestMapping("end.work2")//@RequestParam("empNo") String empNo Work w
	public String workEnd2(@ModelAttribute Work w,@RequestParam("empNo") String empNo, HttpServletRequest request) {
		
		
		Work preWork = workService.selectTimes(empNo);
		w.setWorkStack(preWork.getWorkStack());
		w.setWorkExceed(preWork.getWorkExceed());
		w.setWorkRemain(preWork.getWorkRemain());
		w.setWorkSum(preWork.getWorkSum());
		w.setWorkRemainTotal(preWork.getWorkRemainTotal());//?? 왜안되
		w.setWorkDay(preWork.getWorkDay());//이건왜됨
		
		//w.setWorkRemain(preWork.getWorkRemainTotal());
		System.out.println("WWWW4 :: "+w.toString());
		int result4 = workService.updateWork4(w);
		System.out.println("WWWWE :: "+w.toString());
		
		return "work/workMain2";
	
	}
	*/
	////////////////시작
}