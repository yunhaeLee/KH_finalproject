package com.kh.spring.address.model.vo;

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
public class Address {
	public int addressNo;
	public String addressName;
	public String addressPhone;
	public String addressEmail;
	public String addressComName;
	public String addressJob;
	public String addressTel;
	public String addressDept;
	public String addressAddress;
	public String addressMemo;
	public String status;
	public String empNo;
	//원래 empNum
	
}

