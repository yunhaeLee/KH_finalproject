package com.kh.spring.survey.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.survey.model.vo.Survey;


@Repository("surveyDao")
public class SurveyDao {

	public int selectLictCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("surveyMapper.selectListCount");
	}

	public ArrayList<Survey> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("surveyMapper.selectList", null, rowBounds);
	}

	
	
}
