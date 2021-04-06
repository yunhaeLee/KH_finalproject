package com.kh.report.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.PageDto;
import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;
public class ReportService {

	public ArrayList<Report> getReportList(PageDto dto) {
		Connection conn=getConnection();
		
		ArrayList<Report> list=new ReportDao().getReportList(conn,dto);
		
		close(conn);
		
		return list;
	}

	public Report getReport(int rno) {
		Connection conn=getConnection();
		
		Report r=new ReportDao().getReport(conn,rno);
		close(conn);
		return r;
	}

	public int getTotalCount() {
		Connection conn=getConnection();
		
		int total=new ReportDao().getTotalCount(conn);
		
		close(conn);
		
		
		
		
		
		return total;
	}

	public void insertReport(Report report) {
		Connection conn=getConnection();
		
		int result=new ReportDao().insertReport(conn,report);
		
		
		if(report.getReportType()==3) { //사용자 신고일때 
			int result2=new ReportDao().updateReportCount(conn, report.getReportObjNo());
			
			if(result * result2>0) {
				
				commit(conn);
			}else {
				rollback(conn);
			}
			
		}else {
			if(result>0) {
				
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		
		
		
	}

	public Reply getReply(int rno) {
		Connection conn=getConnection();
		
		Reply r=new ReportDao().getReply(conn,rno);
		
		close(conn);
		
		
		return r;
	}

	public void deleteReply(int rno) {
		Connection conn=getConnection();
		
		int result=new ReportDao().deleteReply(conn,rno);
		
		if(result>0) {
			
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		
		
	}
	
	public Board selectBoard(int bno) {
		
		Connection conn = getConnection();



		Board b = null;

			commit(conn);
			b = new BoardDao().selectBoard(conn, bno);
	
		close(conn);
		return b;
	}

	public Attachment selectAttachment(int bno) {
		Connection conn = getConnection();

		Attachment at = new BoardDao().selectAttachment(conn, bno);
		close(conn);
		return at;
	}

	public void deleteBoard(int bno) {
		Connection conn = getConnection();

		int result1 = new BoardDao().deleteBoard(conn, bno);
		int result2 = new BoardDao().deleteAttachment(conn, bno);
		
		if(result1>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
	}

	public void blacklist(int mno) {
		Connection conn = getConnection();
		
		int result=new ReportDao().blacklist(conn, mno);
		

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

	}

	public int deleteReport(int rno) {
		Connection conn = getConnection();
		
		int result=new ReportDao().deleteReport(conn, rno);
		

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
