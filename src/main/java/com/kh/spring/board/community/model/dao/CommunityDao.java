package com.kh.spring.board.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.community.model.vo.Community;
import com.kh.spring.board.community.model.vo.Likes;
import com.kh.spring.board.notice.model.vo.Notice;

@Repository("communityDao")
public class CommunityDao {

	public int selectLictCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("communityMapper.selectCListCount");
	}

	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectCList", null, rowBounds);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("communityMapper.updateIncreaseCount", cno);
	}

	public Community selectBoard(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("communityMapper.selectComm", cno);
	}

	public int insertCommunity(SqlSessionTemplate sqlSession, Community cb) {
		return sqlSession.insert("communityMapper.insertComm", cb);
	}
	
	public int deleteCommunity(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("communityMapper.deleteComm", cno);
	}

	public int updateCommunity(SqlSessionTemplate sqlSession, Community cb) {
		return sqlSession.update("communityMapper.updateComm", cb);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("communityMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectReplyList", cno);
	}

	public int recommend(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("communityMapper.recommend", cno);
	}

	public String selectLikes(SqlSessionTemplate sqlSession, Likes likevo) {
		return sqlSession.selectOne("communityMapper.selectLikes", likevo);
	}

	public int insertLikes(SqlSessionTemplate sqlSession, Likes likevo) {
		return sqlSession.insert("communityMapper.insertLikes", likevo);
	}
	
	
}
