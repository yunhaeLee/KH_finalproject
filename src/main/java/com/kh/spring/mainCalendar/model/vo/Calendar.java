package com.kh.spring.mainCalendar.model.vo;

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
public class Calendar {

	private String calNo;
	private String empNo; //사번으로 들어감
	private String calCate;
	private String calCateName;
	private String calTitle;
	private String calContent;
	private String calSDates;
	private String calEDates;
	private String status;
	private String calColor;
	private String deptCode;
}