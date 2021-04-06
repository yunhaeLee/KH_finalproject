package com.kh.spring.board.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

	public int selectLictCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.updateIncreaseCount", nno);
	}

	public Notice selectBoard(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int nno) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", nno);
	}

	public ArrayList<Notice> selectMainNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}

	
}
