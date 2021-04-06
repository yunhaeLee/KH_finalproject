package com.kh.spring.mainCalendar.model.service;

import java.util.ArrayList;

import com.kh.spring.mainCalendar.model.vo.Calendar;

public interface CalendarService {

	int insertCalendar(Calendar ca);

	ArrayList<Calendar> listCalendar(Calendar ca);

	Calendar selectCalendar(String calNo);

	int updateCalendar(Calendar ca);

	int deleteCalendar(int calNo);

	ArrayList<Calendar> mainList(Calendar ca);
	
}
 