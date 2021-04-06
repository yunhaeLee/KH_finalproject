package com.kh.spring.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.address.model.dao.AddressDao;
import com.kh.spring.address.model.vo.Address;
import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Employee;

@Service("addressService")
public class AddressServiceImpl implements AddressService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressDao addressDao;
	
	@Override
	public int selectListCount(Employee eno) {  // 원래 String eno
		// TODO Auto-generated method stub
		return addressDao.selectListCount(sqlSession,eno);
	}
	@Override
	public ArrayList<Address> selectList(PageInfo pi, Employee eno) {// 원래 String eno
		// TODO Auto-generated method stub
		return addressDao.selectList(sqlSession,pi,eno);
	}

	@Override
	public ArrayList<Address> selectListCount(PageInfo pi) {
		// TODO Auto-generated method stub
		return addressDao.selectListCount(sqlSession,pi);
	}

	@Override
	public int insertAddress(Address a) {
		// TODO Auto-generated method stub
		int result= addressDao.insertAddress(sqlSession, a);
		return result;
	}

	@Override
	public Address selectAddress(int ano) {
		// TODO Auto-generated method stub
		return addressDao.selectAddress(sqlSession,ano);
	}

	@Override
	public int deleteAddress(int ano) {
		// TODO Auto-generated method stub
		System.out.println("delete.add ser ano:: "+ano);
		return addressDao.deleteAddress(sqlSession,ano);
	}

	@Override
	public int updateAddress(Address a) {
		// TODO Auto-generated method stub
		System.out.println("update.add  ano:: "+a);
		return addressDao.updateAddress(sqlSession,a);
	}

	@Override
	public ArrayList<Employee> selectListCount2(PageInfo pi) {
		// TODO Auto-generated method stub
		return addressDao.selectListCount2(sqlSession,pi);
	}

	@Override
	public int selectListCount2() {
		// TODO Auto-generated method stub
		return addressDao.selectListCount2(sqlSession);
	}


	

	/*
	@Override
	public String selectAddressNum(String eno) {
		// TODO Auto-generated method stub
		return addressDao.selectAddressNum(sqlSession,eno);
	}
	*/
	

	




	
	
}
