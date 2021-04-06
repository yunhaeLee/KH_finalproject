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
public class Product {
	private String proNo;
	private String proName;
	private int inStock;
	private String inPrice;
	private int outStock;
	private String outPrice;
	private int stock;
	private String comment;
	private String cliNo;
	private String cliName;
}
