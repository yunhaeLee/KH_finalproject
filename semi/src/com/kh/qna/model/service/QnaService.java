package com.kh.qna.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.qna.model.vo.PageInfo;
import com.kh.qna.model.dao.QnaDao;
import com.kh.qna.model.vo.Qna;
import com.kh.qna.model.vo.Reply;

public class QnaService {

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new QnaDao().getListCount(conn);

		close(conn);
		return listCount;
		
	}

	public ArrayList<Qna> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Qna> list = new QnaDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertQna(Qna q) {
		Connection conn = getConnection();
		int result = new QnaDao().insertQna(conn,q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public Qna selectUpdateQna(int qno) {
		Connection conn = getConnection();
		
		Qna q = new QnaDao().selectQna(conn, qno);
		
		close(conn);
		
		return q;
	}

	public int updateQna(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().updateQna(conn,q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteQna(int qno) {
		 Connection conn = getConnection();
		 
		 int result = new QnaDao().deleteQna(conn, qno);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Qna selectQna(int qno) {
		Connection conn =getConnection();
		int result = new QnaDao().increaseCount(conn,qno);
		
		Qna q = null;
		if(result > 0) {
			commit(conn);
			q = new QnaDao().selectQna(conn,qno);
		} else {
			rollback(conn);
		}
		close(conn);
		return q;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertReply(conn,r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Reply> selectQlist(int qId) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new QnaDao().selectQlist(conn, qId);
		close(conn);
		return list;
	}

	public void deleteQnaReply(int qno) {
       Connection conn = getConnection();
		 
		 int result = new QnaDao().deleteQnaRelpy(conn, qno);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
	}

}
