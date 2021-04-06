package com.kh.spring.work.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.work.model.dao.WorkDao;
import com.kh.spring.work.model.vo.Work;

@Service("workService")
public class WorkServiceImpl implements WorkService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkDao workDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return workDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Work> selectListCount(PageInfo pi, Employee emp) {//Employee emp
		// TODO Auto-generated method stub
		return workDao.selectListCount(sqlSession,pi,emp);
	}
	
	@Override
	public Work selectWork(String eno) {
		return workDao.selectWork(sqlSession,eno);
	}
	
	
	/////////////////////////////////////
	
	
	
	@Override
	public int insertWork(Work work) {
		// TODO Auto-generated method stub
		return workDao.startWork(sqlSession,work);
	}
	
	@Override
	public int insertwork2(String empNo) {
		// TODO Auto-generated method stub
		return workDao.startWork2(sqlSession,empNo);
	}
	@Override
	public int updatework3(Work work) {
		// TODO Auto-generated method stub
		return workDao.startWork3(sqlSession,work);
	}
	

	@Override
	public Work updateSumWork(String eno) {
		// TODO Auto-generated method stub
		return workDao.updateSumWork(sqlSession,eno);
	}

	@Override
	public int updateWork1(Work w) {////String empNo Work w
		// TODO Auto-generated method stub
		return workDao.updateWork1(sqlSession,w);
	}
	@Override
	public int updateWork2(Work w) {////String empNo Work w
		// TODO Auto-generated method stub
		return workDao.updateWork2(sqlSession,w);
	}
	@Override
	public int updateWork3(Work w) {////String empNo Work w
		// TODO Auto-generated method stub
		return workDao.updateWork3(sqlSession,w);
	}
	@Override
	public int updateWork4(Work w) {////String empNo Work w
		// TODO Auto-generated method stub
		return workDao.updateWork4(sqlSession,w);
	}

	@Override
	public Work selectTimes(String empNo) {//String empNo Work w
		// TODO Auto-generated method stub
		return workDao.selectTimes(sqlSession,empNo);
	}

	////////////////////사람찾기
	@Override
	public ArrayList<Work> selectUser(String empNo) {
		// TODO Auto-generated method stub
		return workDao.selectUser(sqlSession,empNo);
	}

	@Override
	public int updateMin(String empNo) {
		// TODO Auto-generated method stub
		return workDao.updateMin(sqlSession,empNo);
	}

	@Override
	public int updateWorkDay(Work times) {
		// TODO Auto-generated method stub
		return workDao.updateWorkDay(sqlSession,times);
	}





	
	
	
}
