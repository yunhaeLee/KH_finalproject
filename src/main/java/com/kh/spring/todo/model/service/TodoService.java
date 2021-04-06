package com.kh.spring.todo.model.service;

import java.util.ArrayList;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mainCalendar.model.vo.Calendar;
import com.kh.spring.todo.model.vo.Todo;

public interface TodoService {

	 int insertTodo(Todo t);

	 ArrayList<Todo> selectTodo(Employee emp);


	int updateDoing(int tno);

	int updateDone(int tno);

	int deleteTodo(int tno);

	ArrayList<Todo> selectMainTodo(Employee emp);


	Todo selectTodo(String todoNo);

	int updateTodo(Todo t);

}