package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.admin.model.vo.AdminMenu;
import com.kh.spring.admin.model.vo.Authority;
import com.kh.spring.admin.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mainCalendar.model.vo.Calendar;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;
	@Override
	public ArrayList<Department> selectDeptList() {
		// TODO Auto-generated method stub
		return adminDao.selectDeptList(sqlSession);
	}
	@Override
	public ArrayList<Employee> selectEmployeeList() {
		// TODO Auto-generated method stub
		return adminDao.selectEmployeeList(sqlSession);
	}
	@Override
	public int selectAuthority(String authNo) {
		// TODO Auto-generated method stub
		return adminDao.selectAuthority(sqlSession,authNo);
	}
	@Override
	public int insertAuthority(Authority auth) {
		// TODO Auto-generated method stub
		return adminDao.insertAuthority(sqlSession,auth);
	}
	@Override
	public ArrayList<Authority> selectAuthList() {
		// TODO Auto-generated method stub
		return adminDao.selectAuthList(sqlSession);
	}
	@Override
	public ArrayList<AdminMenu> selectAdminList() {
		// TODO Auto-generated method stub
		return adminDao.selectAdminList(sqlSession);
	}
	@Override
	public int deleteAuthority(String authNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteAuthority(sqlSession,authNo);
	}
	@Override
	public ArrayList<Department> deptMainList() {
		// TODO Auto-generated method stub
		return adminDao.deptMainList(sqlSession);
	}
	@Override
	public ArrayList<Department> deptSubList(String deptCode) {
		// TODO Auto-generated method stub
		return adminDao.deptSubList(sqlSession,deptCode);
	}
	@Override
	public int insertDept(Department dept) {
		// TODO Auto-generated method stub
		return adminDao.insertDept(sqlSession,dept);
	}
	@Override
	public ArrayList<Employee> deptEmpList(String deptCode) {
		// TODO Auto-generated method stub
		return adminDao.deptEmpList(sqlSession,deptCode);
	}
	@Override
	public ArrayList<Calendar> selectCalendarList() {
		// TODO Auto-generated method stub
		return adminDao.selectCalendarList(sqlSession);
	}
	@Override
	public int insertCalendar(Calendar cal) {
		// TODO Auto-generated method stub
		return adminDao.insertCalendar(sqlSession,cal);
	}
	@Override
	public int deleteCalendar(String calNo) {
		// TODO Auto-generated method stub
		return adminDao.deleteCalendar(sqlSession,calNo);
	}
	@Override
	public ArrayList<String> checkAdmin(String empNo) {
		// TODO Auto-generated method stub
		return adminDao.checkAdmin(sqlSession,empNo);
	}

}
