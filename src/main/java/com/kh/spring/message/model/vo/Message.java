package com.kh.spring.message.model.vo;

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
public class Message {
	
	private int msgNo;
	private String chatNo;
	private String msgSender;
	private String msgReceiver;
	private String msgContent;
	private Timestamp msgDate;
	private String msgReadStatus;
	private String empName; //받는 사람 이름
	private String empPosition; //받는 사람
	private String deptName; //받는 사람
	private String profile; //프로필 = changeName
	
}