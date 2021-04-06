package com.kh.spring.board.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.notice.model.dao.NoticeDao;
import com.kh.spring.board.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int selectLictCount() {
		return noticeDao.selectLictCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public int updateIncreaseCount(int nno) {
		return noticeDao.updateIncreaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectBoard(int nno) {
		return noticeDao.selectBoard(sqlSession, nno);
	}

	@Override
	public int insertReply(Reply r) {
		return noticeDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int nno) {
		return noticeDao.selectReplyList(sqlSession, nno);
	}

	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int nno) {
		return noticeDao.deleteNotice(sqlSession, nno);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	public ArrayList<Notice> selectMainNotice() {
		return noticeDao.selectMainNotice(sqlSession);
	}

	 
}
