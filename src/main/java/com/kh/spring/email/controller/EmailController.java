package com.kh.spring.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.kh.spring.email.model.service.EmailService;
import com.kh.spring.email.model.vo.Email;
import com.kh.spring.email.model.vo.EmailInfo;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.todo.model.vo.Todo;
import com.kh.spring.work.model.vo.Work;



@Controller
public class EmailController {
	

	@Autowired
	private EmailService emailService;
	
	/*
	@RequestMapping(value="EmailMainView.do",produces ="application/json;charset=UTF-8")
	public void MainlistTodo(String empNo,Model m, HttpSession session,HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		Employee emp= (Employee) session.getAttribute("loginUser");
		 
		ArrayList<EmailInfo> emailInfo =emailService.selectMainEmail(emp);
		
		System.out.println("todolist main::"+emailInfo);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(emailInfo,response.getWriter());
	}
	*/
	
	
	@RequestMapping("view.email")//value="view.email",method=RequestMethod.POST
	public String selectList(@RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		Employee emp= (Employee) session.getAttribute("loginUser");
		
		int listCount = emailService.selectListCount();//////////
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage,10,10);//?????? 10   5?????????
		
		ArrayList<Email> list = emailService.selectListCount(pi,emp);
		
		System.out.println("list????????????  "+list);
		
		//////////////////////////
		EmailInfo emailInfo2 =  emailService.selectUserInfo2(emp);
		System.out.println("emp????????????  "+emp);
		//Email email =  emailService.selectUser2(emp);//1????????????
		//System.out.println("?????????????????? ?????????????????? ??? emp2"+emp);
		//System.out.println("?????????????????? ?????????????????? emailInfo2"+emailInfo2);
		//System.out.println("?????????????????? ?????????????????? list"+list);
		//setAttribute("emailInfo", emailInfo);
		session.setAttribute("emailInfo2", emailInfo2);
		//session.setAttribute("email", email);
		/////////////////
		
		model.addAttribute("emailInfo2",emailInfo2);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		

		return "email/emailTest";
		
	}
	
	
	@RequestMapping("view.emailImportant")//value="view.email",method=RequestMethod.POST
	public String selectListImportant(@RequestParam(value="currentPage",required=false, defaultValue="1") int currentPage, Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		Employee emp= (Employee) session.getAttribute("loginUser");
		
		int listCount = emailService.selectListCountIm();//////////
		
		//System.out.println("????????? ??????"+listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage,10,10);//?????? 10   5?????????
		
		ArrayList<Email> listIm = emailService.selectListCountIm(pi,emp);
		

		EmailInfo emailInfo2 =  emailService.selectUserInfo2(emp);

		session.setAttribute("emailInfo2", emailInfo2);
		model.addAttribute("emailInfo2",emailInfo2);
		
		model.addAttribute("listIm",listIm);
		model.addAttribute("pi",pi);
		

		return "email/emailImportant";
		
	}

	@RequestMapping(value="send.emailgo",method=RequestMethod.POST)
	public String sendEmailGo(HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		
		//Email list = (Email) session.getAttribute("email");
		//EmailInfo emailInfo = (EmailInfo) session.getAttribute("emailInfo2");
		//Employee emp= (Employee) session.getAttribute("loginUser");
		//System.out.println("?????????????????? ?????????????????? ??? emp1"+emp);
		//System.out.println("?????????????????? ?????????????????? ??? emp2222333332"+emp);
		
		//ArrayList<EmailInfo> emailInfo = emailService.selectUser(emp);
		
		//System.out.println("?????????????????? ?????????????????? ??? emp2222"+emp);
		//System.out.println("?????????????????? ??????????????????1111"+emailInfo);
		//model.addAttribute("emailInfo",emailInfo);
		
		
		//EmailInfo emailInfo2 =  emailService.selectUser2(emp);
		//session.setAttribute("emailInfo2", emailInfo2);
		
		return "email/emailSend";
	}
	
	
	
	//??????
	@RequestMapping("detail.email")
	public ModelAndView detailEmail(int eno, ModelAndView mv) {
		
		Email e = emailService.selectEmailDetail(eno);
		mv.addObject("e",e).setViewName("email/emailDetail");
		return mv;
	}
	
	@RequestMapping("delete.email")
	public String deleteEmail(@RequestParam("emailNo") int eno ,HttpServletRequest request, Model model)  {
		
		System.out.println("eno ????????? ???????????? delete"+eno);
		int result = emailService.deleteEmail(eno);
		System.out.println(result);
		
		return "redirect:view.email";
	}
	
	
	
	
	
	@RequestMapping("send.email")
	public String sendEmail(HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response,
			//@RequestParam("emailReceive")String emailReceive,
			//@RequestParam("emailSendEmail")String emailSendEmail,
			@ModelAttribute Email email,@ModelAttribute EmailInfo Info) throws Exception {
		
		//email = (Email) session.getAttribute("email");
		Info = (EmailInfo) session.getAttribute("emailInfo2");
		//Email Em = emailService.selectUserEmail(empNo);
		//EmailInfo In = emailService.selectUserEmailInfo(empNo);
		
		//String host = emailInfo.getEmailHost();
		//final String username = emailInfo.getEmailId();
		//final String password = emailInfo.getEmailPwd();
		///////////////////
				
		System.out.println("Info ??????   "+Info);
		String host = Info.getEmailHost();   //smtp.naver.com
		
		final String username = Info.getEmailId();//  dudgus22342
		final String password = Info.getEmailPwd();// ???????????????
		
		
		String port=Info.getEmailPort();// 465,  587 ????????????
		
		String addressYou =  email.getEmailSendEmail();   ///????????? ?????????    ffffff@naver.com 
		
		String addressMe =  email.getEmailReceiveEmail();  //????????????     zon2429@naver.com
		
		String title =  email.getEmailTitle();  //?????????????????????
		
		String content =  email.getEmailContent();// ????????????
		
		
		System.out.println("---------------------------------");
		//smtp.naver.com    dudgus22342              ????????????             465
		//ffffff@naver.com            zon2429@naver.com  wwwwwwwwwwww   zzzzzzzzzzzz
		System.out.println("send?????? ?????????"+"     "+host+"     "+username+"     "+password+"     "+port+"   ");
		System.out.println("email?????? ?????????       "+     addressYou +"     "+addressMe+"     "+title+"     "+content);
		
		int result = emailService.insertemail(email);
		//System.out.println("address???????????? insert ?????????  "+result);
		//System.out.println("email?????? ?????????3"+"     "+emailReceive+"     "+"     "+emailSendEmail);
		
		//????????????
		
		
		String recipient =addressYou; //?????????
		String subject =title;
		String body = content;
		
		Properties props = System.getProperties();
		
		
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",port);
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.ssl.enable","true");
		props.put("mail.smtp.ssl.trust",host);
				
		
		Session Mailsession = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
			String un= username;
			String pw = password;
			
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un,pw);
			}
		});
		
		Mailsession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(Mailsession);
		
		mimeMessage.setFrom(new InternetAddress(addressMe));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
				
				//EmailInfo info= (EmailInfo) session.getAttribute("emailInfo");//?????? emailinfo ??????
		
		return "redirect:view.email";
		
	}
	
	@RequestMapping("resend.emailgo")
	public ModelAndView resendEmail(@RequestParam("emailNo")int emailNo, ModelAndView mv) {
		
		Email e = emailService.selectEmailDetail(emailNo);
		mv.addObject("e",e).setViewName("email/emailResend");
		return mv;
	}
	
	////////////////??????
}