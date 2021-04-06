package com.kh.spring.survey.controller;

import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;


import com.kh.spring.address.model.service.AddressService;
import com.kh.spring.board.common.Pagination;
import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.notice.model.service.NoticeService;
import com.kh.spring.mainCalendar.model.service.CalendarService;
import com.kh.spring.survey.model.service.SurveyService;
import com.kh.spring.survey.model.vo.Survey;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyService surveyService;
	
	@RequestMapping("slist.so")
	public String surveyList() {
		
		return "survey/surveyListView";
		  
	}
	
	@RequestMapping("sdetail.so")
	public String surveyDetailView() {
		
		return "survey/surveyDetailView";
		  
	}
	
	@RequestMapping("sinsertForm.so")
	public String surveyInsertForm() {
		
		return "survey/surveyInsertForm";
		  
	}
	@RequestMapping("sinsert.so")
	public String insertSurvey(Survey sur,String[] qOption) {
		for(int i  =0; i<qOption.length;i++) {
			System.out.println(qOption[i]);
		}
		System.out.println(sur.toString());
		return "redirect:slist.so";
		  
	}
}
