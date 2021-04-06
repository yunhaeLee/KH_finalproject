package com.kh.board.model.vo;

import java.util.Date;
  
public class Board {

	private int boardNo; // 게시글 고유 번호
	private String boardTitle; // 게시글 제목
	private String boardContent; // 게시글 내용
	private int readCount; // 게시글 조회수
	private int likeCount; // 게시글 조회수
	private Date createDate; // 게시글 작성일 
	private String boardWriter; // 게시글 작성자 (번호 또는 이름)
	private String status; // 게시글 상태값(Y, N)
	private int boardType;	//1: 이웃게시판 2:가게 게시판 
	private String titleImg; // 게시글의 타이틀 이미지 (실제 서버에 업로드되어있는 이름)
	private String region1;
	private String region2;
	private int boardWriterNo;

	
	public Board() {

	}
	

	public Board(int boardNo, String boardTitle, String boardContent, int readCount, int likeCount, Date createDate,
			String boardWriter, String status, String titleImg, String region1, String region2) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.readCount = readCount;
		this.likeCount = likeCount;
		this.createDate = createDate;
		this.boardWriter = boardWriter;
		this.status = status;
		this.titleImg = titleImg;
		this.region1 = region1;
		this.region2 = region2;
	}


	public int getBoardNo() {
		return boardNo;
	}





	public Board(int boardNo, String boardTitle,String boardWriter, int readCount, Date createDate ) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.readCount = readCount;
		this.createDate = createDate;
		this.boardWriter = boardWriter;
		
	}


	public Board(int boardNo, String boardTitle, String boardContent,String boardWriter, int readCount, Date createDate,
			 int boardWriterNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.readCount = readCount;
		this.createDate = createDate;
		this.boardWriter = boardWriter;
		this.boardWriterNo = boardWriterNo;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public int getReadCount() {
		return readCount;
	}


	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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


	public int getBoardWriterNo() {
		return boardWriterNo;
	}


	public void setBoardWriterNo(int boardWriterNo) {
		this.boardWriterNo = boardWriterNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", readCount=" + readCount + ", likeCount=" + likeCount + ", createDate=" + createDate
				+ ", boardWriter=" + boardWriter + ", status=" + status + ", boardType=" + boardType + ", titleImg="
				+ titleImg + ", region1=" + region1 + ", region2=" + region2 + ", boardWriterNo=" + boardWriterNo + "]";
	}

	
	

	
	
	
}



