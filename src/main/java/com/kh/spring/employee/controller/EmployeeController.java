package com.kh.spring.employee.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.admin.model.vo.Department;
import com.kh.spring.admin.model.vo.Job;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;







@SessionAttributes({"loginUser", "msg"})// Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에 추가하는 어노테이션 
@Controller
public class EmployeeController {
	@Autowired 
	private EmployeeService employeeService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	//--------------------------------------------------------사원관리--------------------------------------------------------//
	
	//사원관리 화면
	@RequestMapping("manageEmp.do")
	public String manageEmployee(Model model) {
		return "employee/manageEmployee";
	}
	
	//사원리스트
	@ResponseBody
	@RequestMapping(value="selectEmpList.do", produces="application/json; charset=UTF-8")
	public String selectEmpList() {
		  Map<String, Object> result = new HashMap<String, Object>();
		  result.put("data", employeeService.selectEmpList());
		  return new GsonBuilder().create().toJson(result);
		//model.addAttribute("eList",eList);
		//return new GsonBuilder().create().toJson(eList);
	}
	
	//사원선택(상세보기, 수정)
	@RequestMapping("selectEmployee")
	@ResponseBody
	public Object selectEmployee(String empNo) {
		Employee emp = employeeService.selectEmployee(empNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		emp.setJoinDateS(format.format(emp.getJoinDate()));
		if(emp.getEntDate()!=null) {
			emp.setEntDateS(format.format(emp.getEntDate()));
		}
		return emp;
	}
	
	//사원추가화면
	@RequestMapping("insertEmpForm")
	public String insertEmployee(Model model) {
		ArrayList<Department> dList = adminService.selectDeptList();
		ArrayList<Job> jList = employeeService.selectJobList();
		model.addAttribute("dList",dList);
		model.addAttribute("jList",jList);
		return "employee/newEmployee";
	}
	
	//사원수정화면
	@RequestMapping("updateEmpForm")
	public String updateEmpForm(String empNo, Model model)  {
		System.out.println(empNo);
		Employee emp = employeeService.selectEmployee(empNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		format.format(emp.getJoinDate());
		emp.setJoinDateS(format.format(emp.getJoinDate()));
		ArrayList<Department> dList = adminService.selectDeptList();
		ArrayList<Job> jList = employeeService.selectJobList();
		model.addAttribute("dList",dList);
		model.addAttribute("jList",jList);
		model.addAttribute("emp",emp);
		return "employee/updateEmployee";	 
	 }
	
	//사원추가
	@RequestMapping("insertEmp.do")
	public String insertEmployee(Employee emp, String post, String address1, String address2,String resNo1, String resNo2, String email1, String email2,Model model) {
		emp.setAddress(post + "/" + address1 + "/" + address2);
		emp.setEmail(email1+"@"+email2);
		emp.setResNo(resNo1+"-"+resNo2);
		
		int eno = employeeService.selectEmpCount()+101;
		emp.setEmpNo(resNo1+eno);
		emp.setEmpPwd(resNo1+eno);
		System.out.println(emp.toString());
		int result = employeeService.insertEmployee(emp);
		System.out.println(result);
		if(result > 0) {
			model.addAttribute("msg", "사원을 성공적으로 추가하였습니다.");
			return "redirect:manageEmp.do";
		}else {
			model.addAttribute("msg", "사원추가에 실패하였습니다.");
			return "redirect:manageEmp.do";
		}
			
			
	}
		
	//사원수정
	@RequestMapping("updateEmp.do")
	public String updateEmp(Employee emp, String post, String address1, String address2, Model model) {
		emp.setAddress(post + "/" + address1 + "/" + address2);
		System.out.println(emp.getDeptCode());
		System.out.println(emp.toString());
		int result = employeeService.updateEmployee(emp);
		System.out.println(result);
		if(result > 0) {
			model.addAttribute("msg", "사원수정에 성공하였습니다.");
			model.addAttribute("empNo",emp.getEmpNo());
			return "forward:updateEmpForm";
		}else {
			model.addAttribute("msg", "사원수정에 실패하였습니다.");
			return "redirect:updateEmpForm";
		}
		
		
	}
	
	//사원탈퇴
	@RequestMapping("updateEntDate")
	@ResponseBody
	public String updateEntDate(Employee emp) {
		System.out.println(emp.getEntDateS());
		emp.setEntDate(java.sql.Date.valueOf(emp.getEntDateS()));
		int result = employeeService.updateEntDate(emp);
		return String.valueOf(result);
	}
	
	@RequestMapping("mypage.do")
	public String mypage() {
		return "employee/mypage";
	}

	@RequestMapping("login.do")
	public String loginPage() {
		return "common/login";
	}
	
	/**
	 @throws Exception 
	 * @RequestMapping(value="login.me",method=RequestMethod.POST)
		public ModelAndView loginEmployee(Employee emp, HttpSession session, ModelAndView mv) {
		 Employee loginUser;
		
	     try {
			loginUser=employeeService.loginEmployee(emp); 
			System.out.println("loginUser::"+loginUser);
			if(loginUser==null) {
				throw new Exception();
			}
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
	     }	catch (Exception e) {

				e.printStackTrace();
				mv.addObject("msg","로그인실패!");
				
			}
	     return mv;
	 }**/
	
	
/*로그인 암호화 전  */	
	 @RequestMapping(value="login.me",method= {RequestMethod.POST,RequestMethod.GET})
	   public String loginMember( Employee emp,Model model,HttpSession session) throws Exception {
			 Employee loginUser = (Employee) session.getAttribute("loginUser");
		     
	  	     
		   if(emp.getEmpNo().equals(emp.getEmpPwd())){     
		   
				loginUser = employeeService.loginEmployee(emp);
              if(loginUser.getEmpName()!= null) {
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("loginUser", loginUser);
				model.addAttribute("msg", "비밀번호를 변경해주세요");
				return "employee/mypage";
              }else {
            	  model.addAttribute("msg", "로그인을 진행해 주세요");
              }
		   }else {
			   loginUser=employeeService.loginEncEmployee(bCryptPasswordEncoder,emp);
			    if(loginUser!= null) {
			    	  
						model.addAttribute("loginUser", loginUser);
						model.addAttribute("msg",loginUser.getEmpName()+"님 환영합니다.");
						 return "common/main";
			    }else {
						model.addAttribute("msg","로그인실패!");
						return"redirect:/";
			    }
			   
		   }
		return null;

		
	 }
	 

	 
	    @RequestMapping(value="updatePwd.me", method=RequestMethod.POST)	
		 public String updatePwd (@RequestParam("currentPwd")String currentPwd,
				                                            @RequestParam("newPwd")String newPwd ,HttpSession session,Model model)throws Exception {
		    
			 Employee emp=(Employee) session.getAttribute("loginUser");
			 System.out.println("emp :::"+emp);
			String OriginPwd= emp.getEmpPwd();
			System.out.println("Pwd:::"+OriginPwd);
			
			String encPwd=bCryptPasswordEncoder.encode(newPwd);

			
			if((!emp.getEmpPwd().equals(OriginPwd))  ){//뒤가 인코딩 된 psw로 순서를 넣어줘야함
				
				throw new Exception("암호를 확인하세요:불일치");
			}else {
				emp.setEmpPwd(encPwd);
				System.out.println("encPwd:::"+encPwd);
				System.out.println("currentPwd:::"+currentPwd);
			}
			int result=employeeService.updatePwd(emp);
			if(result>0) {
				 model.addAttribute("loginUser",emp);
				 session.setAttribute("msg", "비밀번호수정 완료!!!");
	        	 return "employee/mypage";
			}else {
				 model.addAttribute("msg","수정실패!");
				    	 throw new CommException("회원정보수정에 실패하였습니다");}
		 }
		 	
	

	    
		 
	    @RequestMapping(value="updatePwdenc.me", method=RequestMethod.POST)	
		 public String updatePwdenc (@RequestParam("currentPwd")String currentPwd,
				                                            @RequestParam("newPwd")String newPwd ,HttpSession session,Model model)throws Exception {
		    
			 Employee emp=(Employee) session.getAttribute("loginUser");
			 System.out.println("emp :::"+emp);
			String OriginPwd= emp.getEmpPwd();
			System.out.println("Pwd:::"+OriginPwd);
			
			String encPwd=bCryptPasswordEncoder.encode(newPwd);

			
			if(!bCryptPasswordEncoder.matches(currentPwd,OriginPwd)  ){//뒤가 인코딩 된 psw로 순서를 넣어줘야함
				 model.addAttribute("msg", "암호를 확인하세요:불일치");
				//throw new Exception("암호를 확인하세요:불일치");
			}else {
				emp.setEmpPwd(encPwd);
				System.out.println("encPwd:::"+encPwd);
				System.out.println("currentPwd:::"+currentPwd);
			}
			int result=employeeService.updatePwd(emp);
			if(result>0) {
				 model.addAttribute("loginUser",emp);
				 session.setAttribute("msg", "비밀번호수정 완료!!!");
	        	 return "employee/mypage";
			}else {
				session.setAttribute("msg","수정실패!");
				    	 throw new CommException("회원정보수정에 실패하였습니다");}
				    	 }
		 		
	    
	    
	    
	    @RequestMapping(value="resetpw.do", method=RequestMethod.POST)	
		 public String resetPwd ( Employee emp, @RequestParam("empNo")String empNo,
				                                            @RequestParam("email")String email ,Model model)throws Exception {
		    
		
			 System.out.println("empNo :::"+empNo);
    		System.out.println("email:::"+email);
			
	
			if((emp.getEmpNo().equals(empNo)) && emp.getEmail().equals(email) ){
				
		     
			int result=employeeService.resetPwd(emp);
			System.out.println(result);
			if(result>0) {
				 model.addAttribute("emp",emp);
				 model.addAttribute("msg", "비밀번호초기화 완료! 사번으로 로그인해 주세요 ");
	        	 return "redirect:/";
			}else {
				model.addAttribute("msg","수정실패!");
				 return "redirect:/";
		 }
		 	
	
	    
			}
			return null;
	    }
	    
 /*로그인 암호화 후 	
	 
	 @RequestMapping(value="login.me",method = RequestMethod.POST)
	 @ResponseBody
     public String loginMember(@RequestParam("empNo")String empNo,@RequestParam("empPwd")String empPwd, Model model) throws Exception {

		    Employee emp =new Employee();
		    emp.setEmpNo(empNo);
		    emp.setEmpPwd(empPwd);
		    
		    
		    Employee loginUser;
		       loginUser=employeeService.loginEmployee(emp);
		       
		    if (bCryptPasswordEncoder.matches(emp.getEmpPwd(), loginUser.getEmpPwd())) {
		  
				
				model.addAttribute("loginUser", loginUser);
				if(empNo.equals(empPwd)) {
					return "changePwd";
				}
				return loginUser.getEmpName();
			} else {
				return "fail";
			}
	 }	 
	 
	 */  
	
	 @RequestMapping("update.me")
	 public String updateMypage( Employee emp,HttpServletRequest request, @RequestParam("post")String post,
			                                              @RequestParam("address1")String address1,                                    
	                                                      @RequestParam("address2")String address2 ,Model model,
	                                                      @RequestParam(name="file1",required = false)MultipartFile file) {  
			System.out.println("file::" + file);
			System.out.println("emp::" + emp);
		
			if(!file.getOriginalFilename().equals("")) {
				
				if(emp.getChangeName() !=null) {
					deleteFile(emp.getChangeName(),request);
				}
		
			        String changeName = saveFile(file, request);
					emp.setOriginName(file.getOriginalFilename());
					emp.setChangeName(changeName);
			}
		
			
			
     emp.setAddress(post+"/"+address1+"/"+address2);
     int result =employeeService.updateMypage(emp);
     if(result>0) {
    	 model.addAttribute("msg", "마이페이지 수정완료! ");
    	 model.addAttribute("loginUser",emp);
    	 return "employee/mypage";
    	 
     }else {
    
     }
     return "employee/login.me";
    
	 }	
	 
	 
	 
	 
		private void deleteFile(String fileName, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "/upload_files/";
			
			File deleteFile=new File(savePath+fileName);
			deleteFile.delete();
			
		
	}

		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "/upload_files/";
			
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

		@RequestMapping("logout.me")
	    public String logout(SessionStatus status) {
			status.setComplete();
		 
			 return "common/login";
		 
	 }
		

}