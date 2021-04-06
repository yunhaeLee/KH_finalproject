package com.kh.spring.board.deptboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.deptboard.model.service.DeptService;
import com.kh.spring.board.deptboard.model.vo.DeptBoard;
import com.kh.spring.board.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;


@SessionAttributes("loginUser")
@Controller
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	/* 부서게시판 목록 */
	@RequestMapping("dlist.bo")
	public String ListView(@RequestParam(value="currentPage", required=false, defaultValue="1") 
	   int currentPage, Model model) {
	   Employee loginUser=(Employee)model.getAttribute("loginUser");
	   int listCount = deptService.selectLictCount(loginUser.getDeptCode());
	   System.out.println(loginUser.toString());
	     
	   PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
	   ArrayList<DeptBoard> list = deptService.selectList(pi,loginUser.getDeptCode());
	      
	   model.addAttribute("list", list);
	   model.addAttribute("pi", pi);
	      
	   return "board/deptboard/dboardListView";  
	}
	
	/* 부서게시판 디테일뷰 */
	@RequestMapping("ddetail.bo")
	public ModelAndView selectBoard(int dno, ModelAndView mv) {
		int result = deptService.updateIncreaseCount(dno);
		
		if(result > 0) {
			DeptBoard db = deptService.selectBoard(dno);
			
			mv.addObject("db", db).setViewName("board/deptboard/dboardDetailView");
		}else {
			
		}
		
		return mv;
	}
	
	
	/* 부서게시판 등록 */
	@RequestMapping("dinsertForm.bo")
	public String dboardInsertForm() {
		
		return "board/deptboard/dboardInsertForm";
	}
	
	@RequestMapping("dinsert.bo")
	public String insertDeptBoard(DeptBoard db, HttpServletRequest request, Model model,
			@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println(db);
		System.out.println("file : " + file);
		
		/*if(!file.getOriginalFilename().equals("")) {
		
		String changeName = saveFile(file,request);
		
		if(changeName != null) {
		
		//파일이 저장된 경우
		db.setOriginName(file.getOriginalFilename());
		db.setChangeName(changeName);
		}
		
		}*/
		
		int result = deptService.insertDeptBoard(db);
		
			if(result > 0) {
				return "redirect:dlist.bo";
			}else {
				throw new CommException("게시물 작성에 실패하였습니다.");
			}
		}
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		// 파일의 경로 : resources 하위 upload_files 폴더 생성
		// "/폴더명/"로 해줄 것
		String savePath = resources + "/upload_files/";
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}
		
		return changeName;
	}
	
	
	@RequestMapping("getchagePhoto.dbo")
	@ResponseBody
	public String savePhoto(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload_files/";
			File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
			return renameFileName;
	}
	
	/* 부서게시판 수정 */
	@RequestMapping("dupdateForm.bo")
	public ModelAndView updateForm(ModelAndView mv, int dno) {
		
		mv.addObject("db", deptService.selectBoard(dno)).
		setViewName("board/deptboard/dboardUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("dupdate.bo")
	public ModelAndView updateBoard(DeptBoard db, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
		int result = deptService.updateDeptBoard(db);
		
		System.out.print(result);
		
		if(result > 0) {
			mv.addObject("dno", db.getDboardNo())
			.setViewName("redirect:dlist.bo");
		}else {
			throw new CommException("게시물 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	/* 부서게시판 삭제 */
	@RequestMapping("ddelete.bo")
	public String deleteBoard(int dno, String fileName, HttpServletRequest request, Model model) {
		
		int result = deptService.deleteDeptBoard(dno);
		System.out.println("넘어옴" + dno);
		
		
		return "redirect:dlist.bo";
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	
	/* 댓글 등록 */
	@ResponseBody
	@RequestMapping("rinsert.dbo")
	public String insertReply(Reply r) {
		System.out.println(r.toString());
		int result = deptService.insertReply(r);
		
		return String.valueOf(result);
	}
	
	/* 댓글 목록 */
	@ResponseBody
	@RequestMapping(value="rlist.dbo", produces="application/json; charset=UTF-8")
	public String selectReplyList(int dno) {
		
		ArrayList <Reply> list = deptService.selectReplyList(dno);
		
		return new GsonBuilder().setDateFormat("yy년 MM월 dd일 HH:mm").create().toJson(list);
	}
		
	
}
