package com.kh.spring.work.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.address.model.vo.Address;
import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.work.model.vo.Work;

public interface WorkService {


	int selectListCount();

	ArrayList<Work> selectListCount(PageInfo pi,Employee emp);///

	Work selectWork(String eno);

	int insertWork(Work work);// insert 하기


	Work updateSumWork(String eno);

	int updateWork1(Work w);//String empNo Work w
	int updateWork2(Work w);//String empNo Work w
	int updateWork3(Work w);//String empNo Work w
	int updateWork4(Work w);//String empNo Work w

	Work selectTimes(String empNo);//String empNo Work w

	ArrayList<Work> selectUser(String empNo);

	int insertwork2(String empNo);
	
	int updatework3(Work work);//start last수정

	int updateMin(String empNo);

	int updateWorkDay(Work times);



}
