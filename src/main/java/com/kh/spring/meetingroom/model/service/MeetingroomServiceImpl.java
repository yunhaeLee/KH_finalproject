package com.kh.spring.meetingroom.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.meetingroom.model.dao.MeetinroomDao;
import com.kh.spring.meetingroom.model.vo.Meetingroom;
import com.kh.spring.meetingroom.model.vo.Reservation;

@Service("meetingroomService")
public class MeetingroomServiceImpl implements MeetingroomService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MeetinroomDao meetingDao;
	@Override
	public int insertRoom(Meetingroom room) {
		// TODO Auto-generated method stub
		return meetingDao.insertRoom(sqlSession, room);
	}
	@Override
	public ArrayList<Meetingroom> selectAllRoomList() {
		// TODO Auto-generated method stub
		return meetingDao.selectAllRoomList(sqlSession);
	}
	@Override
	public int updateRoom(Meetingroom room) {
		// TODO Auto-generated method stub
		return meetingDao.updateRoom(sqlSession, room);
	}
	@Override
	public int deleteRoom(int roomNo) {
		// TODO Auto-generated method stub
		return meetingDao.deleteRoom(sqlSession, roomNo);
	}
	@Override
	public ArrayList<Meetingroom> selectRoomList() {
		// TODO Auto-generated method stub
		return  meetingDao.selectRoomList(sqlSession);
	}
	@Override
	public ArrayList<Reservation> selectMyReservation(String empNo) {
		// TODO Auto-generated method stub
		return  meetingDao.selectMyReservation(sqlSession, empNo);
	}
	@Override
	public ArrayList<Reservation> selectDateReservation(Reservation res) {
		// TODO Auto-generated method stub
		return  meetingDao.selectDateReservation(sqlSession, res);
	}
	@Override
	public int insertReservation(Reservation res) {
		// TODO Auto-generated method stub
		return  meetingDao.insertReservation(sqlSession, res);
	}
	@Override
	public int deleteReservation(String resNo) {
		// TODO Auto-generated method stub
		return meetingDao.deleteReservation(sqlSession,resNo);
	}
	@Override
	public void checkReservation(Date time) {
		meetingDao.checkReservation(sqlSession,time);
		
	}
	@Override
	public ArrayList<Reservation> selectReservation(String status) {
		// TODO Auto-generated method stub
		return meetingDao.selectReservation(sqlSession,status);
	}

}
