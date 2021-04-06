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
public class Meetingroom {

	private int roomNo;
	private String roomName;
	private int limitCount;
	private String location;
	private Date closureDate;
	private String status;
	
}
