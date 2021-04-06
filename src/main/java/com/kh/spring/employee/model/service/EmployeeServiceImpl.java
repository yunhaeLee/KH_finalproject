package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.vo.Job;
import com.kh.spring.employee.model.dao.EmployeeDao;
import com.kh.spring.employee.model.vo.Employee;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private EmployeeDao employeeDao;

	
	
	@Override
	public Employee loginEmployee(Employee emp) throws Exception {
		Employee loginUser=employeeDao.loginUser(sqlSession,emp);
	    System.out.println("service:: "+emp);
	 		return loginUser;
	}


	@Override
	public int updateMypage(Employee emp) {
		return employeeDao.updateMypage(sqlSession,emp);
	}

	@Override
	public ArrayList<Job> selectJobList() {
		// TODO Auto-generated method stub
		return employeeDao.selectJobList(sqlSession);
	}


	@Override
	public ArrayList<Employee> selectEmpList() {
		// TODO Auto-generated method stub
		return employeeDao.selectEmpList(sqlSession);
	}


	@Override
	public Employee selectEmployee(String empNo) {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployee(sqlSession, empNo);
	}

  
	@Override
	public int updateEmployee(Employee emp) {
		// TODO Auto-generated method stub
		return employeeDao.updateEmployee(sqlSession, emp);
	}


	@Override
	public int updateEntDate(Employee emp) {
		// TODO Auto-generated method stub
	
		return employeeDao.updateEntDate(sqlSession, emp);
	}


	@Override
	public int insertEmployee(Employee emp) {
		// TODO Auto-generated method stub
		return employeeDao.insertEmployee(sqlSession, emp);
	}


	@Override
	public int selectEmpCount() {
		// TODO Auto-generated method stub
		return employeeDao.selectEmpCount(sqlSession);
	}



	@Override
	public Employee loginEncEmployee(BCryptPasswordEncoder bCryptPasswordEncoder, Employee emp) throws Exception {
		// TODO Auto-generated method stub
		Employee loginUser=employeeDao.loginEncEmployee(sqlSession,emp);
		
		
	System.out.println(loginUser);
		   if(loginUser==null) {
			   throw new Exception("loginuser확인하세요");
		   }
		    if(!bCryptPasswordEncoder.matches(emp.getEmpPwd(), loginUser.getEmpPwd())) {
		    	throw new Exception("암호를 확인하세요:불일치 ");
		    }
			return loginUser;

	}


	@Override
	public int updatePwd(Employee emp) {
		// TODO Auto-generated method stub
		return employeeDao.updatePwd(sqlSession,emp);
	}


	@Override
	public int resetPwd(Employee emp) {
		// TODO Auto-generated method stub
		return employeeDao.resetPwd(sqlSession,emp);
	}

}
