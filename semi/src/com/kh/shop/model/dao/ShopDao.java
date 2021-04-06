package com.kh.shop.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.close;

import com.kh.board.model.vo.Attachment;
import com.kh.shop.model.vo.Shop;

public class ShopDao {
	private Properties prop = new Properties();
	
	

	public ShopDao() {
		String fileName = ShopDao.class.getResource("/sql/shop/shop.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<Shop> selectShList(Connection conn,double lat,double lon) {
		ArrayList<Shop> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectShList");
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, lat);
			pstmt.setDouble(2, lon);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Shop s = new Shop();
				s.setShopNo(rset.getInt("SHOP_NUMBER"));
				s.setShopTitle(rset.getString("SHOP_TITLE"));
				s.setDetailLocation(rset.getString("DETAILLOCATION"));
				s.setTitleImg(rset.getString("FILE_CHANGED"));

				list.add(s);
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



	public int insertShBoard(Connection conn, Shop s) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertShBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,s.getShopTitle());
			pstmt.setString(2,s.getShopContent());
			pstmt.setString(3,s.getPhoneNo());
			pstmt.setInt(4, Integer.parseInt(s.getShopWriter()));
			pstmt.setString(5,s.getDetailLocation());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertShAttachment");

		for (int i = 0; i < fileList.size(); i++) {
			Attachment at = fileList.get(i);
			try {
				pstmt = conn.prepareStatement(sql);

				
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());

				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

		}
		return result;
	}






	public int increaseCount(Connection conn, int sNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}


	public Shop selectshop(Connection conn, int sNo) {
		Shop s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectShop");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, sNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Shop(rset.getInt("SHOP_NUMBER"), rset.getString("SHOP_TITLE"), rset.getString("SHOP_CONTENT"),
						rset.getString("SHOP_PHONENO"),  rset.getInt("SHOP_READ_COUNT"),
						rset.getDate("SHOP_WRITE_DATE"),rset.getString("DETAILLOCATION"),rset.getString("M_NAME"),rset.getInt("M_NO"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}




	public ArrayList<Attachment> selectShAttachment(Connection conn, int sNo) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		ArrayList<Attachment> list =null;
		String  sql= prop.getProperty("selectShAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNo);
			rs=pstmt.executeQuery();
			
			list= new ArrayList<Attachment>();
			
			while(rs.next()) {
				Attachment at= new Attachment();
				
				at.setFileNo(rs.getInt("FILE_NUMBER"));
				at.setOriginName(rs.getString("FILE_ORIGIN"));
				at.setChangeName(rs.getString("FILE_CHANGED"));
				
				list.add(at);
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



	public int deleteShop(Connection conn, int sNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteShop");
		try {

		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int deleteAttachment(Connection conn, int sNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		try {

		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}



	public ArrayList<Shop> selectShTopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Shop> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectTopShList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {//BOARD_NO, BOARD_TITLE, COUNT, CHANGE_NAME 
				Shop s = new Shop();
				s.setShopNo(rs.getInt("SHOP_NUMBER"));
				s.setShopTitle(rs.getString("SHOP_TITLE"));
			    s.setReadCount(rs.getInt("SHOP_READ_COUNT"));
			    s.setCreateDate(rs.getDate("SHOP_WRITE_DATE"));
			    s.setDetailLocation(rs.getString("DETAILLOCATION"));
				s.setTitleImg(rs.getString("FILE_CHANGED"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block//
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		
		return list;
	}
}
