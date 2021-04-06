package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	
	
	
	
	
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		System.out.println("result: -서비스-"+result);
		
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	
	}

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();		

		Member loginUser = new MemberDao().loginMember(conn,userId,userPwd);
		
		close(conn);
		return loginUser;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public int idCheck(String userId) {
		Connection conn = getConnection();

		int result = new MemberDao().idCheck(conn,userId);
		close(conn);
	
	return result;		
	}

	public Member getUserInfo(int mno) {
		Connection conn = getConnection();		

		Member m=new MemberDao().getUserInfo(conn,mno);
		
		close(conn);
		
		
		return m;
	}



	public Member updateMember(Member m) {
		Connection conn = getConnection();		
		Member updateM =null;
		
		int result = new MemberDao().updateMember(conn,m);
		
		if(result > 0) {
			commit(conn);
			updateM = new MemberDao().selectMember(conn,m.getId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateM;
	}

	
	public Member updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updateMem = null;
		
		int result = new MemberDao().updatePwd(conn,userId,userPwd,newPwd);
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn,userId);
		}else {
			rollback(conn);
			
		}

		close(conn);
		return updateMem;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		
		int result = new MemberDao().deleteMember(conn,userId);
		
		System.out.println("service result :  "+ result);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}

		close(conn);
		return result;


	}



}
