package com.kh.spring.work.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Work {
	public int workNo;
	public Date workStart;
	public Date workEnd;
	public int workStack;
	public int workExceed;
	public int workRemain;
	public Date workDate;
	public String status;
	public String empNo;
	public int workSum;//사이
	public String workDayReset;//사이
	public String workDay;
	public int workRemainTotal;
	public int workStartMin;
	public int workEndMin;

	
}
