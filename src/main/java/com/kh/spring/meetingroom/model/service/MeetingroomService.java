package com.kh.spring.meetingroom.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.spring.meetingroom.model.vo.Meetingroom;
import com.kh.spring.meetingroom.model.vo.Reservation;

public interface MeetingroomService {

	int insertRoom(Meetingroom room);

	ArrayList<Meetingroom> selectAllRoomList();

	int updateRoom(Meetingroom room);

	int deleteRoom(int roomNo);

	ArrayList<Meetingroom> selectRoomList();

	ArrayList<Reservation> selectMyReservation(String empNo);

	ArrayList<Reservation> selectDateReservation(Reservation res);

	int insertReservation(Reservation res);

	int deleteReservation(String resNo);

	void checkReservation(Date time);

	ArrayList<Reservation> selectReservation(String status);

}
