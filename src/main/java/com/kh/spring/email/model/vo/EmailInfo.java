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
public class EmailInfo {
	public String empNo;
	public String emailEmail;
	public String emailId;
	public String emailPwd;
	public String emailHost;
	public String emailPort;
}
