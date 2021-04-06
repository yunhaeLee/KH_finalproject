package com.kh.spring.survey.model.vo;

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
public class Survey {
	
	private String surNo;
	private String surWriter;
	private String surTitle;
	private String surContent;
	private Date surStart;
	private Date surEnd;
	private Date surDate;
	private String status;
	private String surqContent;
	private String surqType;
	private String surqStatus;
	
}