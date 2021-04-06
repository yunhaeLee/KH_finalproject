package com.kh.spring.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.message.model.dao.MessageDao;
import com.kh.spring.message.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private MessageDao messageDao;
    
	@Override
	public ArrayList<Employee> msgEmpList(Employee empNo) {
		return messageDao.msgEmpList(sqlSession, empNo);
		
	}

	@Override
	public int insertMsg(Message msg) {
		return messageDao.insertMsg(sqlSession, msg);
	}

	@Override
	public Message selectMsg(String msgNo) {
		return messageDao.selectMsg(sqlSession, msgNo);
	}

	@Override
	public ArrayList<Message> selectMsgList(String chatNo) {
		return messageDao.selectMsgList(sqlSession, chatNo);
	}	 
	 
}
