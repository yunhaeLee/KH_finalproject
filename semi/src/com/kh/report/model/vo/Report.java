package com.kh.report.model.vo;

import java.util.Date;

public class Report {
	private int reportNo;
	private int reportObjNo;
	private int reportType;
	private String reportCategory;
	private String reportContent;
	private String memNo;
	private Date reportDate;
	
	
	public Report() {
		
	}



	public Report(int reportNo, int reportObjNo, int reportType, String reportCategory, String reportContent,
			String memNo, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.reportObjNo = reportObjNo;
		this.reportType = reportType;
		this.reportCategory = reportCategory;
		this.reportContent = reportContent;
		this.memNo = memNo;
		this.reportDate = reportDate;
		
	}



	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportObjNo() {
		return reportObjNo;
	}

	public void setReportObjNo(int reportObjNo) {
		this.reportObjNo = reportObjNo;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}



	public Date getReportDate() {
		return reportDate;
	}



	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}






	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportObjNo=" + reportObjNo + ", reportType=" + reportType
				+ ", reportCategory=" + reportCategory + ", reportContent=" + reportContent + ", memNo=" + memNo
				+ ", reportDate=" + reportDate + "]";
	}

	
	
}
