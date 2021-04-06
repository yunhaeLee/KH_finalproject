package com.kh.spring.mainCalendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.mainCalendar.model.dao.CalendarDao;
import com.kh.spring.mainCalendar.model.vo.Calendar;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired	
	   private SqlSessionTemplate sqlSession;
	   
	   @Autowired
	   private CalendarDao calendarDao;

	@Override
	public int insertCalendar(Calendar ca) {
		return calendarDao.insertCalendar(sqlSession,ca);
	}

	@Override
	public ArrayList<Calendar> listCalendar(Calendar ca) {
		return calendarDao.listCalendar(sqlSession, ca);
	}

	@Override
	public Calendar selectCalendar(String calNo) {
		return calendarDao.selectCalendar(sqlSession, calNo);
	}

	@Override
	public int updateCalendar(Calendar ca) {
		return calendarDao.updateCalendar(sqlSession, ca);
	}

	@Override
	public int deleteCalendar(int calNo) {
		return calendarDao.deleteCalendar(sqlSession, calNo);
	}

	@Override
	public ArrayList<Calendar> mainList(Calendar ca) {
		return calendarDao.mainList(sqlSession, ca);
	}

 
	 
}
