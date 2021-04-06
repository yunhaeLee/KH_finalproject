package com.kh.spring.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.message.model.vo.Message;


@Repository("messageDao")
public class MessageDao {
	
	public ArrayList<Employee> msgEmpList(SqlSessionTemplate sqlSession, Employee empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.msgEmpList", empNo);
		
	}

	public Message selectMsg(SqlSessionTemplate sqlSession, String msgNo) {
		return sqlSession.selectOne("messageMapper.selectMsg", msgNo);
	}
	
	
	public int insertMsg(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("messageMapper.insertMsg", msg);
	}

	public ArrayList<Message> selectMsgList(SqlSessionTemplate sqlSession, String chatNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.selectMsgList", chatNo);
	}

}
