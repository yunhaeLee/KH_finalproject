package com.kh.spring.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.admin.model.vo.AdminMenu;
import com.kh.spring.admin.model.vo.Authority;
import com.kh.spring.admin.model.vo.Department;
import com.kh.spring.admin.model.vo.TreeModel;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mainCalendar.model.service.CalendarService;
import com.kh.spring.mainCalendar.model.vo.Calendar;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.board.common.Pagination;
import com.kh.spring.board.common.model.vo.PageInfo;
import com.kh.spring.board.notice.model.service.NoticeService;
import com.kh.spring.board.notice.model.vo.Notice;

@Controller
@SessionAttributes("msg")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private EmployeeService employeeService;
	

  //--------------------------------------------------------권한--------------------------------------------------------//
	
	//AdmimcheckCount
	@RequestMapping("checkAdmin.ad")
	@ResponseBody
	public ArrayList<String> checkAdmin(String empNo) {
		ArrayList<String> admin = adminService.checkAdmin(empNo);
		System.out.println("admin : "+admin);
		return admin;
	}
	
	//AdmimList
	/*@RequestMapping("selectAdmin.ad")
	@ResponseBody
	public ArrayList selectAdmin(String empNo) {
		String[] admin = adminService.selectAdmin(empNo);
		System.out.println("admin : "+admin);
		return admin;
	}*/
		
	//관리자메인화면
	@RequestMapping("adminMain.ad")
	public String adminMain(Model model) {
		return "admin/adminMain";
	}
		
	//권한관리화면 /관리리스트
	@RequestMapping("authority.ad")
	public String authorityView(Model model) {
		ArrayList<AdminMenu> adminList = adminService.selectAdminList();
		model.addAttribute("adminList",adminList);
		
		return "admin/authorityView";
	}
	
	//권한리스트
	@RequestMapping(value="selectAuthList",produces="application/json; charset=UTF-8" )
	@ResponseBody
	public String selectAuthList() {

		ArrayList<Authority> authList = adminService.selectAuthList();
		return new GsonBuilder().create().toJson(authList);
	}
	
	//조직도
	@RequestMapping("/treeList")
	@ResponseBody
	public ArrayList treeView(Model model){
	    ArrayList<Department> dList = adminService.selectDeptList();
	    ArrayList<Employee> eList = adminService.selectEmployeeList();
	    
	    ArrayList<TreeModel> treeModel = new ArrayList<TreeModel>();
	    for(int i = 0 ;i < dList.size();i++) {
	    	String dCode=dList.get(i).getDeptCode();
	    	String dName=dList.get(i).getDeptName();
	    	if(dCode.length()<=3) {
	    		treeModel.add(new TreeModel(dCode, "0", dName, null, null));
	    	}else {
	    		if(dCode.length()==4) {
	    			treeModel.add(new TreeModel(dCode, dCode.substring(0, 2), dName, null, null));
	    		}else {
	    			treeModel.add(new TreeModel(dCode, dCode.substring(0, 3), dName, null, null));
	    		}
	    	}
	    }
	    for(int j = 0; j <eList.size(); j++) {
	    	String eCode=eList.get(j).getEmpNo();
	    	String dCode=eList.get(j).getDeptCode();
	    	String eName=eList.get(j).getEmpName();
	    	String jName=eList.get(j).getEmpPosition();
	    	
	    	treeModel.add(new TreeModel(eCode, dCode, eName+" "+jName, null, null));
	    }
	    
	    return treeModel;
	}
	
	//권한 추가
	@RequestMapping("/insertAuthority")
	@ResponseBody
	public String insertAuthority(Authority auth) {
		auth.setAuthNo("A001"+auth.getEmpNo());
		int result = adminService.selectAuthority(auth.getAuthNo());
		if(result<1) {
			auth.setAuthNo(auth.getAdminNo()+auth.getEmpNo());
			int result1 = adminService.selectAuthority(auth.getAuthNo());
			if(result1 < 1) {
				int result2 = adminService.insertAuthority(auth);
				return String.valueOf(result2);
			}else {
				return String.valueOf(result1+1);
			}	
		}else {
				return String.valueOf(result+1);
		}

		
	}
	
	//권한삭제
	@RequestMapping("/deleteAuthority")
	@ResponseBody
	public String deleteAuthority(String authNo) {

		int result = adminService.deleteAuthority(authNo);
		
		return String.valueOf(result);
	}
	
	
	//--------------------------------------------------------부서--------------------------------------------------------//
	//부서화면
	@RequestMapping("dept.ad")
	public String deptView() {
		return "admin/deptAdminView";
	}
	
	//상위부서리스트
	@RequestMapping(value="deptMainList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deptMainList() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", adminService.deptMainList());
		return new GsonBuilder().create().toJson(result);
	}
	
	//하위부서리스트
	@RequestMapping(value="deptSubList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deptSubList(String deptCode) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", adminService.deptSubList(deptCode));
		return new GsonBuilder().create().toJson(result);
	}
	
	//부서추가
	@RequestMapping("insertDept")
	public String insertDept(Department dept, Model model) {
		int result = adminService.insertDept(dept);
		if(result > 0) {
			model.addAttribute("msg", "부서추가에 성공하셨습니다.");
			return "redirect:dept.ad";
		}else {
			model.addAttribute("msg", "부서추가에 실패하셨습니다.");
			return "redirect:dept.ad";
		}
		
	}
	
	//부서 구성원리스트
	@RequestMapping(value="deptEmpList",produces="application/json; charset=UTF-8" )
	@ResponseBody
	public String deptEmpList(String deptCode) {

		ArrayList<Employee> empList = adminService.deptEmpList(deptCode);
		return new GsonBuilder().create().toJson(empList);
	}
	

	//--------------------------------------------------------전사캘린더--------------------------------------------------------//
	//캘린더 관리 화면
	@RequestMapping("calendar.ad")
	public String calendarView() {
		return "admin/calendarAdminView";
	}
	
	//캘린더리스트
	@RequestMapping(value="selectCalendarList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectCalendarList() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", adminService.selectCalendarList());
		return new GsonBuilder().create().toJson(result);
	}
	
	//일정추가
	@RequestMapping("insertCalendar")
	public String insertCalendar(Calendar cal, Model model) {
		System.out.println(cal);
		int result = adminService.insertCalendar(cal);
		if(result > 0) {
			return "redirect:calendar.ad";
		}else {
			model.addAttribute("msg", "일정 추가에 실패하셨습니다.");
			return "redirect:calendar.ad";
		}
		
	}
	
	//일정추가
	@RequestMapping("deleteCalendar")
	public String deleteCalendar(@RequestParam(value="calNos")String[] calNos, Model model) {
		String failed="";
		for(int i = 0; i < calNos.length;i++) {
			int result = adminService.deleteCalendar(calNos[i]);
			if(result <= 0) {
				failed = failed + calNos[i]+ "번";
			}
		}
		if(!(failed.equals(""))) {
			model.addAttribute("msg", failed+"일정이 취소에 실패하였습니다.");
			return "redirect:calendar.ad";
		}
		model.addAttribute("msg","삭제가 완료되었습니다.");
		return "redirect:calendar.ad";
	}
		
	@RequestMapping("survey.ad")
	public String surveyView() {
		return "admin/surveyAdminView";
	}
	
	
	
	
}
