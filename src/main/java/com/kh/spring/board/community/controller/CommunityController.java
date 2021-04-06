package com.kh.spring.board.community.controller;

import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.spring.board.common.Pagination;
import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.common.model.vo.Reply;
import com.kh.spring.board.community.model.service.CommunityService;
import com.kh.spring.board.community.model.vo.Community;
import com.kh.spring.board.community.model.vo.Likes;
import com.kh.spring.board.notice.model.vo.Notice;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;

@SessionAttributes("loginUser")
@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	/* 커뮤니티 목록 */
	@RequestMapping("clist.bo")
	public String adminNoticeView(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = communityService.selectLictCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Community> list = communityService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/community/communityListView";  
	}

	/* 커뮤니티 디테일뷰 */
	@RequestMapping("cdetail.bo")
	public ModelAndView selectBoard(int cno, ModelAndView mv) {
		int result = communityService.updateIncreaseCount(cno);
		
		if(result > 0) {
			Community cb = communityService.selectBoard(cno);
			
			mv.addObject("cb", cb).setViewName("board/community/communityDetailView");
		}else {
			
		}
		
		return mv;
	}
	
	/* 커뮤니티 좋아요 */
	@RequestMapping("recommend.do")
    public String recommend (@RequestParam int cno, ModelAndView mv) {
        
		System.out.println("넘어오냐");
		int result = communityService.recommend(cno);
		
		if(result > 0) {
			return "forward:clist.do";
		}else {
			
		}
    
        return "forward:clist.do"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
    }
	
	/* 커뮤니티 등록 */
	@RequestMapping("cinsertForm.bo")
	public String cboardInsertForm() {
		
		return "board/community/communityInsertForm"; 
	}
	
	@RequestMapping("cinsert.bo")
	public String insertCommunity(Community cb, HttpServletRequest request, Model model,
			@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println(cb);
		System.out.println("file : " + file);
		
		/*if(!file.getOriginalFilename().equals("")) {
		
		String changeName = saveFile(file,request);
		
		if(changeName != null) {
		
		//파일이 저장된 경우
		cb.setOriginName(file.getOriginalFilename());
		cb.setChangeName(changeName);
		}
		
		}*/
		
		int result = communityService.insertCommunity(cb);
		
		if(result > 0) {
			return "redirect:clist.bo";
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
	
	
	@RequestMapping("getchagePhoto.cbo")
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
	
	/* 커뮤니티 수정 */
	@RequestMapping("cupdateForm.bo")
	public ModelAndView updateForm(ModelAndView mv, int cno) {
		
		mv.addObject("cb", communityService.selectBoard(cno)).
		setViewName("board/community/communityUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("cupdate.bo")
	public ModelAndView updateBoard(Community cb, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
		int result = communityService.updateCommunity(cb);
		
		System.out.print(result);
		
		if(result > 0) {
			mv.addObject("cno", cb.getCboardNo())
			.setViewName("redirect:clist.bo");
		}else {
			throw new CommException("게시물 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	/* 커뮤니티 삭제 */
	@RequestMapping("cdelete.bo")
	public String deleteBoard(int cno, String fileName, HttpServletRequest request, Model model) {
		
		int result = communityService.deleteCommunity(cno);
		System.out.println("넘어옴" + cno);
		
		
		return "redirect:clist.bo";
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	/* 댓글 등록 */
	@ResponseBody
	@RequestMapping("rinsert.cbo")
	public String insertReply(Reply r) {
		int result = communityService.insertReply(r);
		
		return String.valueOf(result);
	}
	
	/* 댓글 목록 */
	@ResponseBody
	@RequestMapping(value="rlist.cbo", produces="application/json; charset=UTF-8")
	public String selectReplyList(int cno) {
		
		ArrayList <Reply> list = communityService.selectReplyList(cno);
		
		return new GsonBuilder().setDateFormat("yy년 MM월 dd일 HH:mm").create().toJson(list);
		
	}
	
	/* 좋아요 버튼 */
	@RequestMapping("clickLikes")
	@ResponseBody
	public Map<String, Object> likesButton(HttpServletRequest request, @RequestParam("cboardNo") int cno, Model model) {	
		
		Employee loginUser=(Employee)model.getAttribute("loginUser");
		
		System.out.println("넘어옴");
		System.out.println(cno);
		
		Likes likevo = new Likes();
		likevo.setEmpNo(loginUser.getEmpNo());
		likevo.setCboardNo(cno);
		
		System.out.println(likevo.getEmpNo());
		System.out.println(cno);
		
		Map<String, Object> data = new HashMap<String, Object>();
		String result = "";
		
		if(loginUser.getEmpNo() == null) {
			result = "fail";
			data.put("result", result);
			return data; //로그인 후 추천 가능
		} else {
			String already = communityService.selectLikes(likevo);
			if(already == null) {
				int in = communityService.insertLikes(likevo);
				if(in > 0) {
				result = "like";
				}
				}
			else {
				result = "likeReady";	
			}
		}
		data.put("result", result);
		return data;  //좋아요 처리 완료
	}
		
	

	

}
