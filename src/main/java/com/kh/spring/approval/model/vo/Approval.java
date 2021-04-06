package com.kh.spring.approval.model.vo;

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
public class Approval {
    
	
	private int approvalNo; //결재서류 번호
	private String approvalTitle;//결재 제목
	private String approvalContent;//결재 내용
	private Date approvalDate;//결재 올린날(상신일)
	private String urgent;//긴급여부
	private String originalName;//파일 원본명
	private String changeName;//파일 수정명 
	private String status;//파일의 상태 ()
	private Date firstDate;//첫번째 결재날
	private Date doneDate;//마지막 최종 결재날짜
	private String empNo;//결재올린자(상신자 사원번호)
	private String empName;//결재올린자(상신자 이름 )
	private String deptName;//결재올린자(상신자 부서 )
	private String empPosition;//결재올린자(상신자 직급 )
	private String formNo;//결재 양식번호
	private String formName;//결재 양식이름
	private String firstApprEmp;//첫번째 결재자
	private String lastAppEmp;//마지막 결재자(대표이사)
	
	

	
}



