package com.kh.spring.employee.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.model.vo.Department;
import com.kh.spring.admin.model.vo.Job;
import com.kh.spring.employee.model.vo.Employee;

@Repository("employeeDao")
public class EmployeeDao {

	public Employee loginUser(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		System.out.println("DAo loginUser "+emp);
		return sqlSession.selectOne("employeeMapper.loginEmployee",emp);
	}

	public int updateMypage(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updateMypage",emp);
	}

	public ArrayList<Job> selectJobList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectJobList");
	}

	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList");
	}

	public Employee selectEmployee(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectEmployee", empNo);
	}

	public int updateEmployee(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updateEmployee", emp);
	}

	public int updateEntDate(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updateEntDate", emp);
	}

	public int insertEmployee(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.insertEmployee", emp);
	}

	public int selectEmpCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectEmpCount");
	}

	public Employee loginEncEmployee(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.loginEncEmployee",emp);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updatePwEmp",emp);
	}

	public int resetPwd(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.resetPwd",emp);
	}


}
