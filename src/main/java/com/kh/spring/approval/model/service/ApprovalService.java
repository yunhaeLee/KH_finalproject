package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.employee.model.vo.Employee;

public interface ApprovalService  {

	int insertApproval(Approval ap);

	Employee selectfApprEmp(String deptCode);

	Employee selectlApprEmp();

	ArrayList<Approval> selectyList(Employee emp);

	Approval selectdetailapproval(int ano);

	ArrayList<Approval> selectfaList(Employee emp);

	ArrayList<Approval> selectclist(Employee emp);

	Employee selectinsertEmp(Employee emp);

	Employee selectfApprEmpDetail(String firstapp);

	int updateStatus(int ano);

	int updateCStatus(int ano);

	int updateRStatus(int ano);

	int updateApproval(Approval ap);

	int deleteApproval(int approvalNo);

	



}
