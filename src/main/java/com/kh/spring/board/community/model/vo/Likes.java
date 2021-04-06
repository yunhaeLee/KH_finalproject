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
public class Likes {
	
	public int likeNo;
	public String empNo; //추천 누르는 사람의 사번
	public int cboardNo; //추천될 글 번호
	
}