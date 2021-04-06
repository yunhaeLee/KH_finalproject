package com.kh.spring.board.deptboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.deptboard.model.dao.DeptDao;
import com.kh.spring.board.deptboard.model.vo.DeptBoard;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DeptDao deptDao;
	
	@Override
	public ArrayList<DeptBoard> selectList(PageInfo pi, String deptCode) {
		return deptDao.selectList(sqlSession, pi, deptCode);
	}
	
	@Override
	public int selectLictCount(String deptCode) {
		return deptDao.selectLictCount(sqlSession, deptCode);
	}

	@Override
	public int updateIncreaseCount(int dno) {
		return deptDao.updateIncreaseCount(sqlSession, dno);
	}

	@Override
	public DeptBoard selectBoard(int dno) {
		return deptDao.selectBoard(sqlSession, dno);
	}

	@Override
	public int insertDeptBoard(DeptBoard db) {
		return deptDao.insertDeptBoard(sqlSession, db);
	}

	@Override
	public int insertReply(Reply r) {
		return deptDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int dno) {
		return deptDao.selectReplyList(sqlSession, dno);
	}

	
	@Override
	public int deleteDeptBoard(int dno) {
		return deptDao.deleteDeptBoard(sqlSession, dno);
	}

	@Override
	public int updateDeptBoard(DeptBoard db) {
		return deptDao.updateDeptBoard(sqlSession, db);
	}


}