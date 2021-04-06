package com.kh.shop.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import com.kh.member.model.vo.Member;
import com.kh.shop.model.dao.ShopDao;
import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.shop.model.vo.Shop;

public class ShopService {

	public ArrayList<Shop> selectShList(double lat,double lon) {
		Connection conn = getConnection();
		ArrayList<Shop> list =new ShopDao().selectShList(conn,lat,lon);
		
		close(conn);
		return list;
	}



	public int insertShop(Shop s, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		ShopDao bdao= new ShopDao();
		int result1= bdao.insertShBoard(conn,s);
		int result2=bdao.insertAttachment(conn, fileList);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	
	}



	public Shop selectshop(int sNo) {
		Connection conn = getConnection();

		int result = new ShopDao().increaseCount(conn, sNo);

		Shop s = null;
		if (result > 0) {
			commit(conn);
			s = new ShopDao().selectshop(conn, sNo);
		} else {
			rollback(conn);
		}
		close(conn);
		return s;
	}




	public ArrayList<Attachment> selectShAttachment(int sNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list =new ShopDao().selectShAttachment(conn,sNo);
		
		close(conn);
		return list;
	}
	
	
	public int deleteShop(int sNo) {
		Connection conn = getConnection();
		int result1 = new ShopDao().deleteShop(conn, sNo);
		int result2 = new ShopDao().deleteAttachment(conn, sNo);
		
		if(result1>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}



	public ArrayList<Shop> selectShTopList() {
		Connection conn = getConnection();
		ArrayList<Shop> list = new ShopDao().selectShTopList(conn);
		 close(conn);
		return list;//
	}

}
