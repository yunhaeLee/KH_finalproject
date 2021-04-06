package com.kh.spring.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.address.model.vo.Address;
import com.kh.spring.address.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Employee;

@Repository("addressDao")
public class AddressDao {
//////////////////////////
	public int selectListCount(SqlSessionTemplate sqlSession,Employee eno) {  //원래 String eno     개인 주소록 불러오기
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressMapper.selectListCount",eno);
	}

	public ArrayList<Address> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("addressMapper.selectList", null, rowBounds); 
	}
/////////////////////////
	public int insertAddress(SqlSessionTemplate sqlSession, Address a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressMapper.insertAddress",a);
	}

	public Address selectAddress(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressMapper.selectAddress",ano);
	}

	public int deleteAddress(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		//System.out.println("delete.add dao ano:: "+ano);
		return sqlSession.update("addressMapper.deleteAddress",ano);
	}

	public int updateAddress(SqlSessionTemplate sqlSession, Address a) {
		// TODO Auto-generated method stub
		System.out.println("update.add dao ano:: "+a);
		return sqlSession.update("addressMapper.updateAddress",a);
	}

	public ArrayList<Employee> selectListCount2(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("addressMapper.selectList2", null, rowBounds);
	}

	public int selectListCount2(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressMapper.selectListCount2");
	}

	public Address selectAddressNum(SqlSessionTemplate sqlSession, String eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressMapper.selectAddressNum",eno);
	}

	public ArrayList<Address> selectList(SqlSessionTemplate sqlSession, PageInfo pi, Employee eno) {  //원래 String eno  개인 주소록 불러오기
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("addressMapper.selectList", eno, rowBounds);
	}

	/*
	public String selectAddressNum(SqlSessionTemplate sqlSession, String eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressMapper.selectAddressNum",eno);
	}
	*/



}
