package com.kh.spring.meetingroom.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Reservation {
	
	
	private String resNo;
	private Date resDate;
	private String resDateS;
	private String staTime;
	private String endTime;
	private String resTitle;
	private String resContent;
	private String roomNo;
	private String roomName;
	private String empNo;
	private String empName;
	private String status;
	private String location;
	
}
