package com.kh.spring.board.deptboard.model.service;

import java.util.ArrayList;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.deptboard.model.vo.DeptBoard;

public interface DeptService {

	int selectLictCount(String deptCode);

	ArrayList<DeptBoard> selectList(PageInfo pi, String deptCode);

	int updateIncreaseCount(int dno);

	DeptBoard selectBoard(int dno);

	int insertDeptBoard(DeptBoard db);

	int updateDeptBoard(DeptBoard db);

	int deleteDeptBoard(int dno);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int dno);


}
 