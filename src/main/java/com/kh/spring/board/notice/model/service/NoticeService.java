package com.kh.spring.board.notice.model.service;

import java.util.ArrayList;

import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectLictCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int updateIncreaseCount(int nno);

	Notice selectBoard(int nno);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int nno);

	int insertNotice(Notice n);

	int deleteNotice(int nno);

	int updateNotice(Notice n);

	ArrayList<Notice> selectMainNotice();

}
 