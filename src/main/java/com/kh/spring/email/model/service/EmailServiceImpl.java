package com.kh.spring.email.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.email.model.dao.EmailDao;
import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.email.model.vo.Email;
import com.kh.spring.email.model.vo.EmailInfo;
import com.kh.spring.employee.model.vo.Employee;


@Service("emailService")
public class EmailServiceImpl implements EmailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmailDao emailDao;
	
	
	@Override
	public ArrayList<EmailInfo> selectMainEmail(Employee emp) {
		// TODO Auto-generated method stub
		return emailDao.selectMainEmail(sqlSession,emp);
	}
	
	@Override
	public int selectListCount() {//////////////////////////
		// TODO Auto-generated method stub
		return emailDao.selectListCount(sqlSession);
	}
	@Override
	public int selectListCountIm() {//////////////////////////
		// TODO Auto-generated method stub
		return emailDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<Email> selectListCount(PageInfo pi,Employee emp) {
		// TODO Auto-generated method stub
		return emailDao.selectListCount(sqlSession,pi,emp);
	}
	@Override
	public ArrayList<Email> selectListCountIm(PageInfo pi,Employee emp) {
		// TODO Auto-generated method stub
		return emailDao.selectListCountIm(sqlSession,pi,emp);
	}

	@Override
	public ArrayList<EmailInfo> selectUser(Employee emp) {
		// TODO Auto-generated method stub
		return emailDao.selectUser(sqlSession,emp);
	}

	
	
	
	
	@Override
	public Email selectUserEmail(String empNo) {
		// TODO Auto-generated method stub
		return emailDao.selectUserEmail(sqlSession,empNo);
	}
	
	@Override
	public EmailInfo selectUserEmailInfo(String empNo) {
		// TODO Auto-generated method stub
		return emailDao.selectUserEmailInfo(sqlSession,empNo);
	}

	@Override
	public EmailInfo selectUserInfo2(Employee emp) {/////////////////////////
		// TODO Auto-generated method stub
		return emailDao.selectUserInfo2(sqlSession,emp);
	}

	@Override
	public Email selectUser2(Employee emp) {
		// TODO Auto-generated method stub
		return emailDao.selectUser2(sqlSession,emp);
	}

	@Override
	public int insertemail(Email email) {
		// TODO Auto-generated method stub
		return emailDao.insertemail(sqlSession,email);
	}

	@Override
	public Email selectEmailDetail(int eno) {
		// TODO Auto-generated method stub
		return emailDao.selectEmailDetail(sqlSession,eno);
	}

	@Override
	public int deleteEmail(int eno) {
		// TODO Auto-generated method stub
		return emailDao.deleteEmail(sqlSession,eno);
	}


	

}
