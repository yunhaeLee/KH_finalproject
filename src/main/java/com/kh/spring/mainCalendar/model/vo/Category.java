package com.kh.spring.mainCalendar.model.vo;

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
public class Category {

	private String categoryNo;
	private String categoryTitle;
	private String categoryColor;

}