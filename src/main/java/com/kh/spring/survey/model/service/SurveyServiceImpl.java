package com.kh.spring.survey.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.survey.model.dao.SurveyDao;
import com.kh.spring.survey.model.vo.Survey;


@Service("surveyService")
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private SurveyDao surveyDao;

	@Override
	public int selectLictCount() {
		return surveyDao.selectLictCount(sqlSession);
	}

	@Override
	public ArrayList<Survey> selectList(PageInfo pi) {
		return surveyDao.selectList(sqlSession, pi);
	}

	
	 
}
