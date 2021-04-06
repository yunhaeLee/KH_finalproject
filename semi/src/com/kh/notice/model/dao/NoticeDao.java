package com.kh.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.notice.model.vo.PageInfo;
import com.kh.notice.model.vo.Notice;

import static com.kh.common.JDBCTemplate.*;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, Integer.parseInt(n.getNoticeWriter()));
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
		
	}
	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
         System.out.println("안녕하세요"+listCount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getNoticeLimit() + 1;// 시작페이지
		int endRow = startRow + pi.getNoticeLimit() - 1;
		System.out.println("start row:" + startRow);
		System.out.println("endrow :" + endRow);

		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println("pstmt" + pstmt);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();


			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("M_NAME"),
									rset.getInt("NOTICE_COUNT"),
									rset.getDate("NOTICE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("Dao의 리스트" + list);
		return list;
	}

	

	
	public int increaseCount(Connection conn, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectNotice(Connection conn, int nno) {
		// TODO Auto-generated method stub
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, nno);
			rset =pstmt.executeQuery();
			
			if (rset.next()) {
				n = new Notice(rset.getInt("NOTICE_NO"),
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("M_NAME"), 
						rset.getInt("NOTICE_COUNT"),
						rset.getDate("NOTICE_DATE"),
						rset.getInt("M_NO"));


			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteNotice(Connection conn, int nno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	


	}


