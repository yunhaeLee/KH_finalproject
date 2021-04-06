package com.kh.spring.board.notice.model.vo;

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
public class Notice {

	private int noticeNo;
	private String noticeWriter;
	private String replyWriterName;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String status;
	private int count;
	private String originName;
	private String changeName;
	private int replyCount;
	private String noticeWriterName;
	
}