package com.kh.spring.meetingroom.model.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.meetingroom.model.vo.Meetingroom;
import com.kh.spring.meetingroom.model.vo.Reservation;

@Repository("meetingroomDao")
public class MeetinroomDao {
	

	public int insertRoom(SqlSessionTemplate sqlSession, Meetingroom room) {
		// TODO Auto-generated method stub
		return sqlSession.insert("meetingMapper.insertRoom", room);
	}

	public ArrayList<Meetingroom> selectAllRoomList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("meetingMapper.selectAllRoomList");
	}

	public int updateRoom(SqlSessionTemplate sqlSession, Meetingroom room) {
		// TODO Auto-generated method stub
		return sqlSession.update("meetingMapper.updateRoom", room);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int roomNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("meetingMapper.deleteRoom", roomNo);
	}

	public ArrayList<Meetingroom> selectRoomList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("meetingMapper.selectRoomList");
	}

	public ArrayList<Reservation> selectMyReservation(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("meetingMapper.selectMyReservation",empNo);
	}

	public ArrayList<Reservation> selectDateReservation(SqlSessionTemplate sqlSession, Reservation res) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("meetingMapper.selectDateReservation",res);
	}

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation res) {
		// TODO Auto-generated method stub
		return sqlSession.insert("meetingMapper.insertReservation", res);
	}

	public int deleteReservation(SqlSessionTemplate sqlSession, String resNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("meetingMapper.deleteReservation",resNo);
	}

	public void checkReservation(SqlSessionTemplate sqlSession, Date time) {
		// TODO Auto-generated method stub
		sqlSession.delete("meetingMapper.checkReservation",time);
	}

	public ArrayList<Reservation> selectReservation(SqlSessionTemplate sqlSession, String status) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("meetingMapper.selectReservation",status);
	}

}
