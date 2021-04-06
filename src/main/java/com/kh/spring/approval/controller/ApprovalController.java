package com.kh.spring.approval.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.approval.model.service.ApprovalService;
import com.kh.spring.approval.model.vo.Approval;

import com.kh.spring.common.exception.CommException;
//import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService approvalService;

	// 사이드바에 전자결재 버튼을 누루면 리스트가 같이 들어올거임
	@RequestMapping("approvalList.do")
	public String approvalList(Employee emp, Model m, HttpSession session) {

		emp = (Employee) session.getAttribute("loginUser");

		System.out.println(emp);
		// 기안문서-내가 올린문서 중 진행중
		ArrayList<Approval> alist = approvalService.selectyList(emp);
		// 기안문서인데 첫번째 결재자용
		ArrayList<Approval> falist = approvalService.selectfaList(emp);// 처음 미결재시 status'Y' 결재'A'
		// 기안문서 마지막 결재자
		ArrayList<Approval> clist = approvalService.selectclist(emp);// 처음 미결재시 status'A' 결재'C'

		System.out.println("진행중문서::" + alist);
		System.out.println("첫번째 결재자 문서::" + falist);
		System.out.println("두번째 결재자 문서::" + clist);

		m.addAttribute("alist", alist);
		m.addAttribute("falist", falist);
		m.addAttribute("clist", clist);
		return "approval/approvalListView";
	}

	// 결재하기 버튼을 누루면 첫결재자와 대표가 들어감
	@RequestMapping("approvalInsertForm.do")
	public String approvalInsertForm(String deptCode, Model model, HttpSession session) {

		Employee emp = (Employee) session.getAttribute("loginUser");
		deptCode = emp.getDeptCode();

		Employee fApprEmp = approvalService.selectfApprEmp(deptCode);// 중간승인자 불러오기

		Employee lApprEmp = approvalService.selectlApprEmp();// 마지막 승인자 불러오기

		System.out.println("deptCode::" + deptCode);
		System.out.println("첫번째 결재자 나와라::" + fApprEmp);
		System.out.println("대표님 나와라::" + lApprEmp);

		if (emp.getEmpNo().equals(fApprEmp.getEmpNo()) || fApprEmp.getEmpNo().equals("920223100")) {
			model.addAttribute("firstApprEmp", null);
		} else {
			model.addAttribute("firstApprEmp", fApprEmp);
		}

		model.addAttribute("lastAppEmp", lApprEmp);

		return "approval/approvalInsertView";
	}

	@RequestMapping("insertApproval.do")
	public String approvalInsert(Approval ap, HttpServletRequest request, Model model, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		Employee emp = (Employee) session.getAttribute("loginUser");
		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				ap.setOriginalName(file.getOriginalFilename());
				ap.setChangeName(changeName);
			}
		}
		
		if(ap.getFirstApprEmp().equals("")) {
			ap.setStatus("A");
		}
		if(!ap.getFirstApprEmp().equals("")) {
			ap.setStatus("Y");
		}
		  System.out.println(ap.getFirstApprEmp().equals(""));
		  System.out.println(ap.getFirstApprEmp().equals(null));
		  System.out.println(ap.getFirstApprEmp()==(null));
		  System.out.println(ap.getFirstApprEmp()==(""));
        System.out.println("첫번째 결재자"+ap.getFirstApprEmp());
        System.out.println("status: "+ap.getStatus());
		int result = approvalService.insertApproval(ap);
	
		if (result > 0) {
            System.out.println("ap.getStatus"+ap.getStatus());
            session.setAttribute("msg", "성공적으로 결재를 올렸습니다.");
			return "redirect:approvalList.do";
		} else {

		}
		return null;
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";

		System.out.println("savaPath::" + savePath);

		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("파일 업로드 에러::" + e.getMessage());
		}

		return changeName;
	}

	// 결재자가 결재 하기 창으로 넘어감
	@RequestMapping("approval.do")
	public String approval() {
		return "approval/approvalView";
	}



	@RequestMapping("approvalDetailView.do")
	public ModelAndView selectApproval(int ano, ModelAndView mv, String firstapp, HttpSession session) {

		Employee emp = (Employee) session.getAttribute("loginUser");

		Employee lApprEmp = approvalService.selectlApprEmp();// 마지막 승인자 불러오기

		Approval ap = approvalService.selectdetailapproval(ano);// 결재상세페이지 불러오기

		firstapp = ap.getFirstApprEmp(); // 결재 문서의 첫번째결재자의 empNo 비교 후 그사람의 정보 끌어오기 이유는: deptName과 jobPostion이 필요함
		Employee firstperson = approvalService.selectfApprEmpDetail(firstapp);

		System.out.println("상세보기 " + ap);

		mv.addObject("firstApprEmp", firstperson);
		mv.addObject("lastAppEmp", lApprEmp);
		mv.addObject("ap", ap).setViewName("approval/approvalDetailView");

		return mv;

	}
	
	@RequestMapping("updateStatus.do")
	public String updateStatus ( int ano, Model m) {
		System.out.println(ano);
		int result =approvalService.updateStatus(ano);
		
		m.addAttribute("ano",ano);
		return "redirect:approvalList.do";
		
	
	}
	
	@RequestMapping("updateCStatus.do")
	public String updateCStatus ( int ano, Model m) {
		
		int result =approvalService.updateCStatus(ano);
		
		m.addAttribute("ano",ano);
		return "redirect:approvalList.do";
		
	
	}
	
	@RequestMapping("updateRStatus.do")
	public String updateRStatus ( int ano, Model m) {
		
		int result =approvalService.updateRStatus(ano);
		
		m.addAttribute("ano",ano);
		return "redirect:approvalList.do";
		
	
	}
	
	@RequestMapping("approvalUpdateForm.do")
	   public ModelAndView updateForm(int ano , ModelAndView mv ,HttpSession session,String firstapp , String status) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
    
		Employee lApprEmp = approvalService.selectlApprEmp();// 마지막 승인자 불러오기
	
        
		Approval ap = approvalService.selectdetailapproval(ano);// 결재상세페이지 불러오기
       
		firstapp = ap.getFirstApprEmp(); 
		Employee firstperson = approvalService.selectfApprEmpDetail(firstapp);
	
        System.out.println(firstapp);
        System.out.println(firstperson);
		System.out.println("상세보기 " + ap);
		
		 

		mv.addObject("firstApprEmp", firstperson);
		mv.addObject("lastAppEmp", lApprEmp);
     
		mv.addObject("status", status);
		mv.addObject("firstApprEmpNo",ap.getFirstApprEmp());
		mv.addObject("ap",approvalService.selectdetailapproval(ano)).setViewName("approval/approvalUpdateForm");
		
		
		   
		return mv;
		   
	   }
	
	
    @RequestMapping("updateApproval.do")
	public ModelAndView updateApproval(Approval ap,ModelAndView mv, HttpServletRequest request,HttpSession session, 
			                         @RequestParam(value="reUploadFile", required = false)MultipartFile file ) {
    	Employee emp = (Employee) session.getAttribute("loginUser");
    	
        
   		if(!file.getOriginalFilename().equals("")) {//새로넘어온 파일이 있는경우
   			
   			if(ap.getChangeName() !=null) {//새로 넘어온 파일이 잇는데 기존에 파일도 있는경우 -> 서버에 업로드 되어있는 파일을 삭제 함 
   				deleteFile(ap.getChangeName(),request);
   			}
   			String changeName=saveFile(file,request);//새로 넘어온 파일을 서버에 업로드 함  
   			ap.setOriginalName(file.getOriginalFilename());
   			ap.setChangeName(changeName);
   	}

   	
    	
       
	
	    

		if( ap.getFirstApprEmp().equals("")) {
			ap.setStatus("A");
		}else {
			ap.setStatus("Y");
		}
		
	 
   
	    
		int result=approvalService.updateApproval(ap);
    
			  
		if(result>0) {
		     System.out.println("ap.getStatus"+ap.getStatus());
		     System.out.println("업데이트문서1"+ap);           	   
			 mv.addObject("ano",ap.getApprovalNo()).setViewName("redirect:approvalList.do");
			 System.out.println("업데이트문서2"+ap);
			  session.setAttribute("msg", "성공적으로 결재를 수정하였습니다.");
		}
		

		return mv;
								

	}
    
	@RequestMapping("deleteApproval.do")
	public String deleteApproval(int approvalNo, String fileName, HttpServletRequest request, Model model,HttpSession session) {

		int result = approvalService.deleteApproval(approvalNo);

		if (result > 0) {
			if (!fileName.equals("")) {
				deleteFile(fileName, request);
			
			}
			  session.setAttribute("msg", "성공적으로 삭제하였습니다.");
			
			
		}
		return "redirect:approvalList.do";
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";		
		
		File deleteFile=new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
}
