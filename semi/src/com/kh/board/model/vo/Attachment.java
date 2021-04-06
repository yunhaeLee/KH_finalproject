package com.kh.board.model.vo;

import java.util.Date; 
 
public class Attachment {
	private int fileNo; // 파일 고유 번호
	private String originName; // 파일 원본명
	private String changeName; // 파일 수정명
	private Date uploadDate; // 파일 업로드일
	private String filePath; // 파일이 저장된 폴더 경로
	private String status; // 파일 상태값
	private int refBoardNo; // 참조하고 있는 게시글 번호
	private int boardlevel;//1: board , 2:shop
	
	
	public  Attachment() {
		
	}
	
	
	public Attachment(int fileNo, String originName, String changeName, Date uploadDate, String filePath, String status,
			int refBoardNo, int boardlevel) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.filePath = filePath;
		this.status = status;
		this.refBoardNo = refBoardNo;
		this.boardlevel = boardlevel;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getRefBoardNo() {
		return refBoardNo;
	}


	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}


	public int getBoardlevel() {
		return boardlevel;
	}


	public void setBoardlevel(int boardlevel) {
		this.boardlevel = boardlevel;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", uploadDate=" + uploadDate + ", filePath=" + filePath + ", status=" + status + ", refBoardNo="
				+ refBoardNo + ", boardlevel=" + boardlevel + "]";
	}
	



}
