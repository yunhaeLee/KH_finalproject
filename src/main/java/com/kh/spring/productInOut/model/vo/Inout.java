package com.kh.spring.productInOut.model.vo;

import java.sql.Date;

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

public class Inout {
	private String inoutNo;
	private String sortation;
	private int quantity;
	private String price;
	private Date inoutDate;
	private String inoutDateS;
	private String comment;
	private String cliNo;
	private String proNo;
	private String cliName;
	private String proName;
	private String status;
}
