package com.kh.spring.meetingroom.controller;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.meetingroom.model.service.MeetingroomService;
import com.kh.spring.meetingroom.model.vo.Meetingroom;
import com.kh.spring.meetingroom.model.vo.Reservation;

@Controller
@SessionAttributes("msg")
public class MeetingroomController {
	
	//회의실 관련 : .r 예약관련 : .re
	
	@Autowired
	private MeetingroomService  meetingService;
	//--------------------------------------------------------회의실--------------------------------------------------------//
		
	//회의실관리화면
	@RequestMapping("meetingRoom.ad")
	public String meetingRoomView(Model model) {
		ArrayList<Meetingroom> rList = meetingService.selectAllRoomList();
		model.addAttribute("rList",rList);
		return "admin/meetingRoomAdminView";
	}
	
	//회의실 추가
	@RequestMapping("insertRoom.r")
	public String insertRoom(Meetingroom room, Model model) {
		int result = meetingService.insertRoom(room);
		if(result > 0) {
			model.addAttribute("msg","추가에 성공하였습니다.");
			return "redirect:meetingRoom.ad";
		}else {
			model.addAttribute("msg","추가에 실패하였습니다.");
			return "redirect:meetingRoom.ad";
		}
		
	}
	
	//회의실 수정
	@RequestMapping("updateRoom.r")
	public String updateRoom(Meetingroom room, Model model) {
		System.out.println(room);
		int result = meetingService.updateRoom(room);
		if(result > 0) {
			model.addAttribute("msg","수정에 성공하였습니다.");
			return "redirect:meetingRoom.ad";
		}else {
			model.addAttribute("msg","수정에 실패하였습니다.");
			return "redirect:meetingRoom.ad";
		}
		
	}
	
	//회의실 삭제
	@RequestMapping("deleteRoom.r")
	public String deleteRoom(int roomNo, Model model) {
		System.out.println(roomNo);
		int result = meetingService.deleteRoom(roomNo);
		if(result > 0) {
			model.addAttribute("msg","삭제에 성공하였습니다.");
			return "redirect:meetingRoom.ad";
		}else {
			model.addAttribute("msg","삭제에 실패하였습니다.");
			return "redirect:meetingRoom.ad";
		}
		
	}
	
	//--------------------------------------------------------예약--------------------------------------------------------//
	
	//회의실예약화면
	@RequestMapping("enrollForm.re")
	public String authorityView(Model model) {
		ArrayList<Meetingroom> rList = meetingService.selectRoomList();
		Date time = new Date(System.currentTimeMillis());
		meetingService.checkReservation(time);
		model.addAttribute("rList",rList);
		return "reservation/reservationInsertForm";
	}
	
	//예약날 체크
	@RequestMapping("selectDateRes.re")
	@ResponseBody
	public ArrayList<Reservation> selectDateReservation(String selectDate,String rNo,Model model) {
		Reservation res = new Reservation();
		System.out.println(selectDate);
		res.setResDate(java.sql.Date.valueOf(selectDate));
		res.setRoomNo(rNo);
		System.out.println();
		ArrayList<Reservation> resList = meetingService.selectDateReservation(res);
		return resList;
	}
		
	//내 예약리스트
	@RequestMapping("selectMyRes.re")
	@ResponseBody
	public ArrayList<Reservation> selectMyReservation(String empNo,Model model) {
		ArrayList<Reservation> resList = meetingService.selectMyReservation(empNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		for(int i = 0; i < resList.size(); i++) resList.get(i).setResDateS(format.format(resList.get(i).getResDate()));
		return resList;
	}
	
	//예약추가
	@RequestMapping("insertRes.re")
	public String insertReservation(Reservation res, Model model) {
		System.out.println(res.getResDateS());
		System.out.println(res.toString());
		res.setResDate(java.sql.Date.valueOf(res.getResDateS()));
		int result = meetingService.insertReservation(res);
		if(result > 0) {
			model.addAttribute("msg","예약이 완료되었습니다.");
			return "redirect:enrollForm.re";
		}else {
			model.addAttribute("msg","예약을 실패하였습니다.");
			return "redirect:enrollForm.re";
		}
	}
	
	//예약 취소
	@RequestMapping("deleteReservation.re")
	@ResponseBody
	public String deleteReservation(String resNo) {
		int result = meetingService.deleteReservation(resNo);
		return String.valueOf(result);
	}
	
	
	//예약관리화면
	@RequestMapping("reservation.ad")
	public String reservationAdminView(Model model) {
		Date time = new Date(System.currentTimeMillis());
		meetingService.checkReservation(time);
		return "admin/reservationAdminView";
	}
	
	//예약리스트
	@RequestMapping(value="selectReservation" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectReservation(String status) {
		Map<String, Object> result = new HashMap<String, Object>();
		ArrayList<Reservation> resList = meetingService.selectReservation(status);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		for(int i = 0; i < resList.size(); i++) resList.get(i).setResDateS(format.format(resList.get(i).getResDate()));
		result.put("data", resList);
		return new GsonBuilder().create().toJson(result);
	}
}
