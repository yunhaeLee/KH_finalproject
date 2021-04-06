package com.kh.spring.todo.model.vo;


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
public class Todo {

 private int todoNo;
 private String todoTitle;
 private Date todoInsertDate;
 private String todoContent;
 private String todoDoneDate;
 private String status;
 private String empNo;
 

	 
}
