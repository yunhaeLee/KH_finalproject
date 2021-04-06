package com.kh.member.model.vo;

public class Member {

	private int m_no; //회원번호
	private String m_name; //회원명
	private String id; //아이디
	private String pwd; //패스워드
	private String phone; //휴대폰
	private String email; //이메일
	private String status; //탈퇴여부
	private int report_count; //신고횟수 
	private int grade; //등급
	

	private double lat; //위도
	private double lon; //경도
	
	private String region1; //지역1(시)
	private String region2; //지역2(동)
	
	private String blacklist; //블랙리스트
	
	

	
	
	public Member(int m_no, String m_name, String id, String pwd, String phone, String email,
			String status, int report_count, int grade, double lat, double lon, String region1, String region2,
			String blacklist) {

		this.m_no = m_no;
		this.m_name = m_name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.report_count = report_count;
		this.grade = grade;
		this.lat = lat;
		this.lon = lon;
		this.region1 = region1;
		this.region2 = region2;
		this.blacklist = blacklist;
	}




	public Member() {
		
	}
	



	public Member( String m_name, String id, String pwd, String phone, String email,double lat,double lon ,String region1,String region2){

		
		this.m_name = m_name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.lat = lat;
		this.lon = lon;
		this.region1 = region1;
		this.region2 = region2;
		
	}
	
	
	public Member(int m_no, String m_name, String id, String pwd, String phone, String address, String email,
			String status, int report_count, int grade) {

		this.m_no = m_no;
		this.m_name = m_name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.report_count = report_count;
		this.grade = grade;
	}
	
	public Member(String id,String m_name,String phone, String email) {
		this.id = id;
		this.m_name =m_name;
		this.phone = phone;
		this.email = email;
		
	}
	
	
	
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

	public double getLat() {
		return lat;
	}


	public void setLat(double lat) {
		this.lat = lat;
	}


	public double getLon() {
		return lon;
	}


	public void setLon(double lon) {
		this.lon = lon;
	}


	public String getRegion1() {
		return region1;
	}


	public void setRegion1(String region1) {
		this.region1 = region1;
	}


	public String getRegion2() {
		return region2;
	}


	public void setRegion2(String region2) {
		this.region2 = region2;
	}


	public String getBlacklist() {
		return blacklist;
	}


	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}




	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_name=" + m_name + ", id=" + id + ", pwd=" + pwd + ", phone=" + phone
				+ ", email=" + email + ", status=" + status + ", report_count=" + report_count + ", grade=" + grade
				+ ", lat=" + lat + ", lon=" + lon + ", region1=" + region1 + ", region2=" + region2 + ", blacklist="
				+ blacklist + "]";
	}

	
	
	
}
