package com.kh.spring.board.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.community.model.dao.CommunityDao;
import com.kh.spring.board.community.model.vo.Community;
import com.kh.spring.board.community.model.vo.Likes;
import com.kh.spring.board.notice.model.dao.NoticeDao;
import com.kh.spring.board.notice.model.vo.Notice;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CommunityDao communityDao;
	
	@Override
	public int selectLictCount() {
		return communityDao.selectLictCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		return communityDao.selectList(sqlSession, pi);
	}

	@Override
	public int updateIncreaseCount(int cno) {
		return communityDao.updateIncreaseCount(sqlSession, cno);
	}

	@Override
	public Community selectBoard(int cno) {
		return communityDao.selectBoard(sqlSession, cno);
	}

	@Override
	public int insertCommunity(Community cb) {
		return communityDao.insertCommunity(sqlSession, cb);
	}

	@Override
	public int insertReply(Reply r) {
		return communityDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int cno) {
		return communityDao.selectReplyList(sqlSession, cno);
	}

	@Override
	public int recommend(int cno) {
		return communityDao.recommend(sqlSession, cno);
	}
	
	@Override
	public int deleteCommunity(int cno) {
		return communityDao.deleteCommunity(sqlSession, cno);
	}

	@Override
	public int updateCommunity(Community cb) {
		return communityDao.updateCommunity(sqlSession, cb);
	}

	@Override
	public String selectLikes(Likes likevo) {
		return communityDao.selectLikes(sqlSession, likevo);
	}

	@Override
	public int insertLikes(Likes likevo) {
		return communityDao.insertLikes(sqlSession, likevo);
		
	}

}