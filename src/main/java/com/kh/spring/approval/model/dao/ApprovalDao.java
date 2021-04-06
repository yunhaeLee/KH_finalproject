package com.kh.spring.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.employee.model.vo.Employee;


@Repository("approvalDao")
public class ApprovalDao {
    

	public int insertApproval(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertApproval",ap);
	}

	public Employee selectfApprEmp(SqlSessionTemplate sqlSession, String deptCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectfApprEmp",deptCode);
	}

	public Employee selectlApprEmp(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectlApprEmp");
	}

	public ArrayList<Approval> selectyList(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectyList",emp);
	}

	public Approval selectdetailapproval(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectdetailapproval",ano);
	}

	public ArrayList<Approval> selectfaList(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectfaList",emp);
	}

	public ArrayList<Approval> selectclist(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectclist",emp);
	}

	public Employee selectinsertEmp(SqlSessionTemplate sqlSession,Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectinsertEmp",emp);
	}

	public Employee selectfApprEmpDetail(SqlSessionTemplate sqlSession, String firstapp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectfApprEmpDetail",firstapp);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateStatus", ano);
	}

	public int updateRStatus(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateRStatus", ano);
	}

	public int updateCStatus(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateCStatus", ano);
	}

	public int updateApproval(SqlSessionTemplate sqlSession, Approval ap) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateApproval",ap);
	}

	public int deleteApproval(SqlSessionTemplate sqlSession, int approvalNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.deleteApproval", approvalNo);
	}



}
