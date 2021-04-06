package com.kh.spring.work.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.work.model.vo.Work;

@Repository("workDao")
public class WorkDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("workMapper.selectListCount");
	}

	public ArrayList<Work> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi, Employee emp) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("workMapper.selectList", emp, rowBounds); 
	}

	
	public Work selectWork(SqlSessionTemplate sqlSession, String eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("workMapper.selectWork"); 
	}
	

	
	public int startWork(SqlSessionTemplate sqlSession,Work work) {
		// TODO Auto-generated method stub
		return sqlSession.insert("workMapper.startWork", work); 
	}
	
	public int startWork2(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.startWorkMin", empNo); 
	}
	public int startWork3(SqlSessionTemplate sqlSession, Work work) {
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.startWorkLast", work);
	}
	
	public Work updateSumWork(SqlSessionTemplate sqlSession, String eno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateWork1(SqlSessionTemplate sqlSession, Work w) {//String empNo Work w
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.endWork1",w); 
	}
	public int updateWork2(SqlSessionTemplate sqlSession, Work w) {//String empNo Work w
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.endWork2",w); 
	}
	public int updateWork3(SqlSessionTemplate sqlSession, Work w) {//String empNo Work w
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.endWork3",w); 
	}
	public int updateWork4(SqlSessionTemplate sqlSession, Work w) {//String empNo Work w
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.endWork4",w); 
	}

	
	
	public Work selectTimes(SqlSessionTemplate sqlSession, String empNo) {//String empNo Work w
		// TODO Auto-generated method stub
		return sqlSession.selectOne("workMapper.selectWork",empNo); 
	}
////////////////////////

	public ArrayList<Work> selectUser(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("workMapper.selectUser",empNo); 
	}

	public int updateMin(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.endWorkMin", empNo); 
	}

	public int updateWorkDay(SqlSessionTemplate sqlSession, Work times) {
		// TODO Auto-generated method stub
		return sqlSession.update("workMapper.updateWorkDay", times); 
	}


	

}
