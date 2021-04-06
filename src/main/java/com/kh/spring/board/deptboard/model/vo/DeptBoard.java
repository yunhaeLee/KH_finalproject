package com.kh.spring.board.deptboard.model.vo;
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
public class DeptBoard {
	
	public int dboardNo;
	public String dboardWriter;
	public String deptCode;
	public String dboardCategory;
	public String dboardTitle;
	public String dboardContent;
	public Date dboardDate;
	public String status;
	public int count;
	private String profile;
	private int replyCount;
	private String dboardWriterName;
	
}