package com.kh.spring.admin.model.vo;

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
public class Authority {
	private String authNo; 
	private String adminNo; 
	private String empNo; 
	private String empName; 
}
