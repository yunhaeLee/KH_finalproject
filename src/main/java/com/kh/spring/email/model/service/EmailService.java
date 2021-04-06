package com.kh.spring.email.model.service;

import java.util.ArrayList;

import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.email.model.vo.Email;
import com.kh.spring.email.model.vo.EmailInfo;
import com.kh.spring.employee.model.vo.Employee;

public interface EmailService {
	
	int selectListCount();
	int selectListCountIm();
	ArrayList<Email> selectListCount(PageInfo pi,Employee emp);//////
	ArrayList<Email> selectListCountIm(PageInfo pi, Employee emp);
	
	ArrayList<EmailInfo> selectUser(Employee emp);
	ArrayList<EmailInfo> selectMainEmail(Employee emp);

	Email selectUserEmail(String empNo);////////////
	
	
	
	EmailInfo selectUserEmailInfo(String empNo);
	
	
	
	EmailInfo selectUserInfo2(Employee emp);
	Email selectUser2(Employee emp);////////
	int insertemail(Email email);
	
	Email selectEmailDetail(int eno);
	int deleteEmail(int eno);
	

	
}
