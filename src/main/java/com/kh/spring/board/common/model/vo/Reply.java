package com.kh.spring.board.common.model.vo;

import java.sql.Timestamp;

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

public class Reply {
	private int replyNo;
	private String replyWriter; //사번 연결
	private String refBoardNo;
	private String replyContent;
	private Timestamp replyDate;
	private String status; //
	private String replyWriterName; //댓글 작성자 이름
}
