package com.kh.spring.survey.model.service;

import java.util.ArrayList;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.survey.model.vo.Survey;

public interface SurveyService {
	
	int selectLictCount();

	ArrayList<Survey> selectList(PageInfo pi);

}
 