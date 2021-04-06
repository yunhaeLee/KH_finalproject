package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyfileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {

		String originName = originFile.getName();

		// 수정명 :파일 업로드시간 (년월시분초) + 10000~9999 사이에 렌덤한 값을 더할 것임 (5자리 랜덤한 값)+확장자
		// 원본 파일이 aaa.jpg -> 2020121501010122222.jpg

		//1.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String currentTime = sdf.format(new Date());
		
//		(int)(Math.random()*최대값)+최소값
//		(int)(Math.random()*100)+1(0~99)+1
		//2
		int ranNum =(int)(Math.random()*90000)+10000;//
		
		//3
		String ext="";
		int dot=originName.lastIndexOf(".");
		ext =originName.substring(dot);//.jpg
		
		String fileName= currentTime+ranNum+ext; //1+2+3
		File renameFile = new File(originFile.getParent(),fileName);//전달받은 파일을 변경된 파일명으로 파일객체를 생성해서 리턴 
		return renameFile;
	}

}
