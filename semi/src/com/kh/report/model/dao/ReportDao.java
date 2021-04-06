package com.kh.report.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Reply;
import com.kh.common.PageDto;
import com.kh.member.model.dao.MemberDao;
import com.kh.report.model.vo.Report;
import static com.kh.common.JDBCTemplate.*;
public class ReportDao {

	private Properties prop = new Properties();
	public ReportDao() {
		
		String fileName = MemberDao.class.getResource("/sql/report/report.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Report> getReportList(Connection conn,PageDto dto) {
		
		ArrayList<Report> list=new ArrayList<Report>();
		Report report=null;
		PreparedStatement pstmt=null;
		
		ResultSet rset=null;
		
		
		int end=dto.getCurPage()*10;
		int start=end-9;
		
		String sql=prop.getProperty("selectReportList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				 report=new Report();
				 

				 
				 report.setReportNo(rset.getInt("REPORT_NO"));
				 report.setReportObjNo(rset.getInt("REPORT_OBJECT_NO"));
				 report.setReportType(rset.getInt("REPORT_TYPE"));
				 report.setReportCategory(rset.getString("REPORT_CATEGORY"));
				 report.setReportContent(rset.getString("REPORT_CONTENT"));
				 report.setMemNo(rset.getString("M_NAME"));
				 report.setReportDate(rset.getDate("REPORT_DATE"));
				 
				 
			
				 list.add(report);

				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	public Report getReport(Connection conn, int rno) {
		
		Report report=null;
		PreparedStatement pstmt=null;
		
		ResultSet rset=null;
		
		String sql=prop.getProperty("selectReport");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				 report=new Report();
				 

				 
				 report.setReportNo(rset.getInt("REPORT_NO"));
				 report.setReportObjNo(rset.getInt("REPORT_OBJECT_NO"));
				 report.setReportType(rset.getInt("REPORT_TYPE"));
				 report.setReportCategory(rset.getString("REPORT_CATEGORY"));
				 report.setReportContent(rset.getString("REPORT_CONTENT"));
				 report.setMemNo(rset.getString("M_NAME"));
				 report.setReportDate(rset.getDate("REPORT_DATE"));
				 
				 
			
				

				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return report;
	}
	public int getTotalCount(Connection conn) {
		PreparedStatement pstmt=null;
		
		ResultSet rset=null;
		
		String sql=prop.getProperty("getTotalCount");
		
		int total=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				total=rset.getInt(1);
				
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		
		
		return total;
	}
	public int insertReport(Connection conn,Report report) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql=prop.getProperty("insertReport");
//		
//		REPORT_OBJECT_NO
//		REPORT_TYPE
//		REPORT_CATEGORY
//		REPORT_CONTENT
//		MEMBER_NO
//		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, report.getReportObjNo());
			pstmt.setInt(2, report.getReportType());
			pstmt.setString(3, report.getReportCategory());
			pstmt.setString(4, report.getReportContent());
			pstmt.setInt(5, Integer.parseInt(report.getMemNo()));
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		
		
		return result;
	}
	public int updateReportCount(Connection conn, int reportObjNo) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("updateReportCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reportObjNo);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}
	public Reply getReply(Connection conn, int rno) {
		
		Reply r=new Reply();
		
		PreparedStatement pstmt=null;
		
		ResultSet rset=null;
		
		String sql=prop.getProperty("getReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
	
			pstmt.setInt(1, rno);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				//REPLY_CONTENT,R_WRITE_DATE,M_NAME
				
				r.setReplyWriter(rset.getString("M_NAME"));
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				r.setCreateDate(rset.getDate("R_WRITE_DATE"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return r;
	}
	public int deleteReply(Connection conn, int rno) {
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("deleteReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		

		return result;
	}
	public int blacklist(Connection conn, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blacklist");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		return result;
	}
	public int deleteReport(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReport");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		
		
		return result;
	}
	

}
