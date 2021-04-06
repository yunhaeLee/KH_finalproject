package com.kh.spring.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.email.model.vo.Email;
import com.kh.spring.email.model.vo.EmailInfo;
import com.kh.spring.employee.model.vo.Employee;

@Repository("emailDao")
public class EmailDao {
	
	
	public ArrayList<EmailInfo> selectMainEmail(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmailMapper.selectUser",emp);
	}
	
	
	
	///////////////////////
	public int selectListCount(SqlSessionTemplate sqlSession) {/////////////////ㅅ 정
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectListCount");
	}
	public int selectListCountIm(SqlSessionTemplate sqlSession) {/////////////////ㅅ 정
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectListCountIm");
	}

	public ArrayList<Email> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi, Employee emp) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectList", emp, rowBounds); 
	}
	
	public ArrayList<Email> selectListCountIm(SqlSessionTemplate sqlSession, PageInfo pi, Employee emp) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectListIm", emp, rowBounds); 
	}
	
	
	
	
	
	
//////////////////////////////////////
	
	
	
	
	public ArrayList<EmailInfo> selectUser(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("emailMapper.selectUser",emp);
	}

	
	/////////////////////////
	
	public Email selectUserEmail(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectUser",empNo);
	}
	
	public EmailInfo selectUserEmailInfo(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectUser",empNo);
	}

	public EmailInfo selectUserInfo2(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectUserInfo",emp);
	}

	public Email selectUser2(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectUser",emp);
	}

	public int insertemail(SqlSessionTemplate sqlSession, Email email) {
		// TODO Auto-generated method stub
		return sqlSession.insert("emailMapper.insertEmail",email);
	}



	public Email selectEmailDetail(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectEmailDetail",eno);
	}



	public int deleteEmail(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.update("emailMapper.deleteEmail",eno);
	}



	/*
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("emailMapper.selectListCount");
	}

	public ArrayList<Email> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("emailMapper.selectList", null, rowBounds);
	}
	*/

}
