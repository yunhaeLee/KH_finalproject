package com.kh.spring.productInOut.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Client {
	private String cliNo;
	private String cliName;
	private String corporateNo;
	private String address;
	private String master;
	private String phone;
	private String sortation;
	private String comment;
	private String status;
}
