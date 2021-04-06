package com.kh.spring.employee.model.vo;

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
public class Employee {
	
	private String empNo;//사번
	private String empPwd;//비밀번호
	private String empName;//성명
	private String phone;//개인번호
	private String address;//주소
	private String officePhone;//내선번호
	private String email;//이메일
	private String resNo;//주민번호
	private Date joinDate;//입사일
	private String joinDateS;
	private Date entDate;//퇴사일
	private String entDateS;
	private String originName;//프로필 사진 원본명
	private String changeName;//프로필사진 수정명
	private String status;//상태
	private String deptName;//부서명  
	private String empPosition;//직급
	private String jobCode;//직급코드
	private String deptCode;//부서코드
	private String chatNo;//채팅방


}
