package com.kh.spring.address.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;


import com.kh.spring.address.model.service.AddressService;
import com.kh.spring.address.model.vo.Address;
import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.employee.model.vo.Employee;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;

	@RequestMapping("view.add2")//전체사원
	public String selectList2(@RequestParam(value="currentPage",required=false, defaultValue="1")  int currentPage ,Model model) {
		int listCount = addressService.selectListCount2();
		//System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage,100,10);
		
		ArrayList<Employee> list = addressService.selectListCount2(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		

		return "address/addressView2";
		
	}
	
	
	@RequestMapping("view.add")//개인 주소록   String eno
	public String selectList(@RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		
		//a.setEmpNum(eno);//eno

		Employee eno = (Employee)session.getAttribute("loginUser");
		//System.out.println(loginUser.toString());
		//int listCount = addressService.selectListCount(loginUser.getEmpNo());
		//System.out.println("로긴유저 문자열"+loginUser.toString());//원래 String eno
		//System.out.println("번호클릭 경유지1"+eno);
		int listCount = addressService.selectListCount(eno);
		//System.out.println("번호클릭 경유지2"+eno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage,100,10);
		//System.out.println("번호클릭 경유지3"+eno);
		ArrayList<Address> list = addressService.selectList(pi,eno);
		//System.out.println("번호클릭 경유지4"+eno);
		//ArrayList<Address> list = addressService.selectList(pi,loginUser.getEmpNo());
	    //ArrayList<Address> list = deptService.selectListCount(pi,loginUser.getDeptCode());


		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		

		

		return "address/addressView3";
		
	}
	
	
	
	@RequestMapping("detail.add")
	public ModelAndView selectAddress(int ano, ModelAndView mv){
		
		Address a = addressService.selectAddress(ano);
		//System.out.println("address컨트롤러 detail ano  "+ano);
		mv.addObject("a",a).setViewName("address/addressDetail");
		return mv;
		
	}
	
	
	@RequestMapping("delete.add")
	public String deleteAddress(@RequestParam("ano") int ano ,HttpServletRequest request, Model model){
		
		int result =addressService.deleteAddress(ano);

		System.out.println("delete.add 리설트  "+result);
		return "redirect:view.add2";
		
		
	}
	
	@RequestMapping("goupdate.add")
	public ModelAndView updateForm(@RequestParam("ano") int ano, ModelAndView mv, HttpServletRequest request){
		
		
		Address a = addressService.selectAddress(ano);
		
		//System.out.println("address컨트롤러 goupdate ano asdkasjkldasdjlkasd::  "+ano);
		mv.addObject("a",a).setViewName("address/addressUpdate");
		return mv;
		
	}
	
	@RequestMapping("update.add")
	public String updateAddress(@ModelAttribute Address a,HttpServletRequest request, Model model) {
		
		int result =addressService.updateAddress(a);
		System.out.println("delete.add result :: "+result);
		System.out.println("delete.add result ano:: "+a);
				
		return "redirect:view.add2";
		
		
	}
	
	
	
	@RequestMapping("goinsert.add")
	public String goviewInsert(){
		
		
		return "address/addressInsert";
		
	}
	@RequestMapping("insert.add")
	public String viewinsert(@ModelAttribute Address a,HttpServletRequest request){
		
		int result = addressService.insertAddress(a);
		System.out.println("address컨트롤러 insert 리설트  "+result);

		
			if(result>0) {
				return "redirect:view.add2";
				
			}else {
				return "redirect:view.add2";
			}

		
	}
	
	
	/////////////////시작
}



