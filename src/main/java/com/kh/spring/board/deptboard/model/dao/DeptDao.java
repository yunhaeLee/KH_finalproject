package com.kh.spring.board.deptboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.deptboard.model.vo.DeptBoard;

@Repository("deptDao")
public class DeptDao {

	public int selectLictCount(SqlSessionTemplate sqlSession, String deptCode) {
		return sqlSession.selectOne("deptboardMapper.selectDListCount", deptCode);
	}

	public ArrayList<DeptBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String deptCode) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("deptboardMapper.selectDList", deptCode, rowBounds);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.update("deptboardMapper.updateIncreaseCount", dno);
	}

	public DeptBoard selectBoard(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("deptboardMapper.selectDboard", dno);
	}

	public int insertDeptBoard(SqlSessionTemplate sqlSession, DeptBoard db) {
		return sqlSession.insert("deptboardMapper.insertDboard", db);
	}
	
	public int deleteDeptBoard(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("deptboardMapper.deleteDboard", cno);
	}

	public int updateDeptBoard(SqlSessionTemplate sqlSession, DeptBoard db) {
		return sqlSession.update("deptboardMapper.updateDboard", db);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("deptboardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int dno) {
		return (ArrayList)sqlSession.selectList("deptboardMapper.selectReplyList", dno);
	}

	
}
