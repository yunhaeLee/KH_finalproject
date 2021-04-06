package com.kh.spring.board.community.model.vo;

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
public class Community {
	
	public int cboardNo;
	public String cboardWriter;
	public String cboardTitle;
	public String cboardContent;
	public Date cboardDate;
	public int boardViewCount;
	public int boardLikeCount;
	public String status;
	private String profile;
	private int replyCount;
	private String cboardWriterName;
	
}