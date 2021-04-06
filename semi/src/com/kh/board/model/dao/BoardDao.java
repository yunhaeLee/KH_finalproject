package com.kh.board.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;


import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.Reply;


public class BoardDao { 
	private Properties prop = new Properties();

	
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBoard(Connection conn, Board b) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertBoard");

		try {
			pstmt = conn.prepareStatement(sql);

		
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttachment");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection conn,double lat,double lon) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setDouble(1, lat);
			pstmt.setDouble(2, lon);

			rset=pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
         System.out.println(listCount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi,double lat,double lon) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b=null;
		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;// 시작페이지
		int endRow = startRow + pi.getBoardLimit() - 1;
		System.out.println("start row:" + startRow);
		System.out.println("endrow :" + endRow);

		// current page =1 startrow 1 endrow:10
		// current page =1 startrow 1 endrow:10
		// current page =1 startrow 1 endrow:10
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, lat);
			pstmt.setDouble(2, lon);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

//			while (rset.next()) {
//				list.add(new Board(rset.getInt("BOARD_NUMBER"), 
//						rset.getString("BOARD_TITLE"), rset.getString("M_NO"), rset.getInt("B_READ_COUNT"),
//						rset.getDate("B_WRITE_DATE")));
//
//			}
			
			while (rset.next()) {
				b=new Board();
				b.setBoardNo(rset.getInt("BOARD_NUMBER"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardWriter(rset.getString("M_NAME"));
				b.setReadCount(rset.getInt("B_READ_COUNT"));
				b.setCreateDate(rset.getDate("B_WRITE_DATE"));
				b.setRegion1(rset.getString("REGION1"));
				b.setRegion2(rset.getString("REGION2"));

				
//				list.add(new Board(rset.getInt("BOARD_NUMBER"),
//						rset.getString("BOARD_TITLE"),rset.getString("M_NAME"), rset.getInt("B_READ_COUNT"),rset.getDate("B_WRITE_DATE")));

			
			list.add(b);
			
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

	public int increaseCount(Connection conn, int bno) {
		// TODO Auto-generated method stub
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public Board selectBoard(Connection conn, int bno) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectBoard");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
//				b = new Board(rset.getInt("BOARD_NUMBER"),
//						rset.getString("BOARD_TITLE"),rset.getString("BOARD_CONTENT"),rset.getString("M_NAME"), rset.getInt("B_READ_COUNT"),rset.getDate("B_WRITE_DATE"),rset.getInt("M_NO"));

				b=new Board();
				b.setBoardNo(rset.getInt("BOARD_NUMBER"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardWriter(rset.getString("M_NAME"));
				b.setReadCount(rset.getInt("B_READ_COUNT"));
				b.setCreateDate(rset.getDate("B_WRITE_DATE"));
				b.setBoardWriterNo(rset.getInt("M_NO"));
				b.setRegion1(rset.getString("REGION1"));
				b.setRegion2(rset.getString("REGION2"));
				

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public Attachment selectAttachment(Connection conn, int bno) {
		Board b = null;
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();   
			if (rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NUMBER"));
				at.setOriginName(rset.getString("FILE_ORIGIN"));
				at.setChangeName(rset.getString("FILE_CHANGED"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return at;
	}

	public int insertReply(Connection conn, Reply r) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,r.getReplyContent());
			pstmt.setInt(2, r.getRefBoardId());
			pstmt.setString(3, r.getReplyWriter());
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<Reply> selectRlist(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Reply> list = new ArrayList<>();
		String sql = prop.getProperty("selectRlist");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			
			rs=pstmt.executeQuery();
		while(rs.next()) {
			//REPLY_NO, REPLY_CONTENT, USER_ID, CREATE_DATE
			list.add(new Reply(rs.getInt("REPLY_NUMBER"),
					            rs.getString("REPLY_CONTENT"),
					            rs.getString("M_NAME"),
					            rs.getDate("R_WRITE_DATE"),
					            rs.getInt("M_NO")
					              )) ;
					
		}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteBoard(Connection conn, int bid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		try {

			// INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, 1,
			// DEFAULT)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteAttachment(Connection conn, int bid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		try {

			// INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, 1,
			// DEFAULT)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertNewAttahchment(Connection conn, Attachment at) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNewAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getRefBoardNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}




	public int deleteReplyBoard(Connection conn, String pw, int rId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		try {

	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			pstmt.setString(2,pw);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public ArrayList<Board> selectTopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectTopList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {//BOARD_NO, BOARD_TITLE, COUNT, CHANGE_NAME 
				Board b = new Board();
				b.setBoardNo(rs.getInt("BOARD_NUMBER"));
				b.setBoardTitle(rs.getString("BOARD_TITLE"));
			    b.setReadCount(rs.getInt("B_READ_COUNT"));
			    b.setCreateDate(rs.getDate("B_WRITE_DATE"));

				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		
		return list;
	}


	
}