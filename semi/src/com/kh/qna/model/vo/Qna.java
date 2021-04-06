package com.kh.qna.model.vo;

import java.util.Date;

public class Qna {
	private int qnaNo; //고유번호
	private String qnaTitie; //제목
	private String qnaContent; //내용
	private Date qnaDate; //작성일
	private String qnaWriter; // 작성자 (번호 또는 이름)
	private String qnaStatus; // 상태값(Y, N)
	private int qnaCount;
	private int qnaWriterNo;
	
	public Qna() {
		
	}
	public Qna(int qnaNo, String qnaTitie, String qnaContent, Date qnaDate, String qnaWriter, String qnaStatus, int qnaCount ) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitie = qnaTitie;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaWriter = qnaWriter;
		this.qnaStatus = qnaStatus;
	}
	
	public Qna(int qnaNo, String qnaTitie, String qnaWriter, int qnaCount, Date qnaDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitie = qnaTitie;
		this.qnaWriter = qnaWriter;
		this.qnaCount = qnaCount;
		this.qnaDate = qnaDate;
	}
	
	
	public Qna(int qnaNo, String qnaTitie, String qnaContent,  String qnaWriter, int qnaCount,
			Date qnaDate, int qnaWriterNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitie = qnaTitie;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaCount = qnaCount;
		this.qnaDate = qnaDate;
		this.qnaWriterNo = qnaWriterNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitie() {
		return qnaTitie;
	}
	public void setQnaTitie(String qnaTitie) {
		this.qnaTitie = qnaTitie;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	
	public int getQnaCount() {
		return qnaCount;
	}
	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}
	
	public int getQnaWriterNo() {
		return qnaWriterNo;
	}
	public void setQnaWriterNo(int qnaWriterNo) {
		this.qnaWriterNo = qnaWriterNo;
	}
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitie=" + qnaTitie + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate
				+ ", qnaWriter=" + qnaWriter + ", qnaStatus=" + qnaStatus + ", qnaCount" + qnaCount + "qnaWriterNo" + qnaWriterNo + "]";
	}
	
	
	
	
}
