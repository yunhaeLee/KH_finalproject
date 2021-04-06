package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.notice.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		// NoticeDao 클래스로 가서 insertNotice 메소드 완성시키고 오자
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().getListCount(conn);

		close(conn);
		return listCount;
		
		
	}
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		
		close(conn);
		System.out.println("service의 리스트" + list);
		return list;
	}
	
	
	public Notice selectNotice(int nno) {
		Connection conn =getConnection();
		
		int result = new NoticeDao().increaseCount(conn, nno);
		
		Notice n = null;
		if(result > 0) {
			commit(conn);
			n = new NoticeDao().selectNotice(conn,nno);
		} else {
			rollback(conn);
		}
		close(conn);
		return n;
	}
	public Notice selectUpdateNotice(int nno) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nno);
		
		close(conn);
		
		return n;
	}
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int deleteNotice(int nno) {
	  Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	
	}

	


