package com.kh.spring.email.model.vo;

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
public class Email {
	public int emailNo;
	public String emailTitle;
	public String emailContent;
	public String emailOFile;
	public String emailNFile;
	public String emailTime;
	public String status;
	public String emailImportant;
	
	
	public String empNo;// 로그인한놈
	public String emailSendEmail;
	
	
	
	public String emailReceive;// 타인
	public String emailReceiveEmail;

	
}
