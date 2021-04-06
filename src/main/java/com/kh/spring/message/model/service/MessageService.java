package com.kh.spring.message.model.service;

import java.util.ArrayList;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.message.model.vo.Message;

public interface MessageService {
	
	

	ArrayList<Employee> msgEmpList(Employee empNo);

	int insertMsg(Message msg);

	Message selectMsg(String msgNo);

	ArrayList<Message> selectMsgList(String chatNo);

	
}
 