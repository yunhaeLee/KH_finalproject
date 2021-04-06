package com.kh.qna.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.qna.model.vo.PageInfo;
import com.kh.qna.model.vo.Qna;
import com.kh.qna.model.vo.Reply;

public class QnaDao {

	private Properties prop = new Properties();
	
	public QnaDao() {
		String fileName = QnaDao.class.getResource("/sql/qna/qna.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
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

	public ArrayList<Qna> selectList(Connection conn, PageInfo pi) {
		ArrayList<Qna> list = new ArrayList<Qna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getQnaLimit() + 1;// 시작페이지
		int endRow = startRow + pi.getQnaLimit() - 1;
		System.out.println("start row:" + startRow);
		System.out.println("endrow :" + endRow);

		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println("pstmt" + pstmt);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();


			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("QNA_NO"),
									rset.getString("QNA_TITLE"),
									rset.getString("M_NAME"),
									rset.getInt("QNA_COUNT"),
									rset.getDate("QNA_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertQna(Connection conn, Qna q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaTitie());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, Integer.parseInt(q.getQnaWriter()));
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}

	public Qna selectQna(Connection conn, int qno) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		String sql = prop.getProperty("selectQna");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset =pstmt.executeQuery();
			
			if (rset.next()) {
				q = new Qna(rset.getInt("QNA_NO"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getString("M_NAME"), 
						rset.getInt("QNA_COUNT"),
						rset.getDate("QNA_DATE"),
						rset.getInt("M_NO"));


			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public int updateQna(Connection conn, Qna q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaTitie());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteQna(Connection conn, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int increaseCount(Connection conn, int qno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefQnaId());
			pstmt.setString(3, r.getReplyWriter());
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<Reply> selectQlist(Connection conn, int qId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Reply> list = new ArrayList<>();
		String sql = prop.getProperty("selectQlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qId);
			rs=pstmt.executeQuery();
		while(rs.next()) {
			list.add(new Reply(rs.getInt("QNA_REPLY_NO"),
							   rs.getNString("QNA_REPLY_CONTENT"),
							   rs.getNString("M_NAME"),
							   rs.getDate("QNA_WRITE_DATE"),
							   rs.getInt("M_NO")));
		}
		}catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteQnaRelpy(Connection conn, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQnaReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
}
