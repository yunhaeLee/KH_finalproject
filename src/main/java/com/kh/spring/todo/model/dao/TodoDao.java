package com.kh.spring.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.todo.model.vo.Todo;


@Repository("todoDao")
public class TodoDao {

	public int insertTodo(SqlSessionTemplate sqlSession, Todo t) {
		// TODO Auto-generated method stub
		return sqlSession.insert("todoMapper.insertTodo",t);
	}

	public ArrayList<Todo> selectTodo(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodo",emp);
	}





	public int updateDoing(SqlSessionTemplate sqlSession, int tno) {
		// TODO Auto-generated method stub
		return sqlSession.update("todoMapper.updateDoing",tno);
	}

	public int updateDone(SqlSessionTemplate sqlSession, int tno) {
		// TODO Auto-generated method stub
		return sqlSession.update("todoMapper.updateDone",tno);
	}

	public int deleteTodo(SqlSessionTemplate sqlSession, int tno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("todoMapper.updateDelete",tno);
	}

	public ArrayList<Todo> selectMainTodo(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("todoMapper.selectMainTodo",emp);
	}

	public Todo selectTodo(SqlSessionTemplate sqlSession, String todoNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("todoMapper.selectTodoDetail",todoNo);
	}

	public int updateTodo(SqlSessionTemplate sqlSession, Todo t) {
		// TODO Auto-generated method stub
		return sqlSession.update("todoMapper.updateTodo",t);
	}



}
