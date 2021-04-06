package com.kh.spring.productInOut.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.productInOut.model.service.ProductInOutService;
import com.kh.spring.productInOut.model.vo.Client;
import com.kh.spring.productInOut.model.vo.Inout;
import com.kh.spring.productInOut.model.vo.Product;

@Controller
@SessionAttributes("msg")
public class ProductInOutController {
	
	@Autowired
	private ProductInOutService proInoutService;
	//--------------------------------------------------------거래처--------------------------------------------------------//
	
	//거래처화면
	@RequestMapping("cList.pio")
	public String clientListView(Model model) {
		return "productInOut/clientListView";
	}
	
	//거래처 리스트
	@RequestMapping(value="selectClientList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectClientList() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", proInoutService.selectClientList());
		return new GsonBuilder().create().toJson(result);
	}
	
	//거래처 상세정보
	@RequestMapping("detailClient")
	public String selectClient(String cliNo,Model model) {
		Client client = proInoutService.selectClient(cliNo);
		model.addAttribute("client",client);
		return "productInOut/ClientDetailView";
	}
	
	//거래처코드만들기
	@RequestMapping("createClientNo")
	@ResponseBody
	public String createClientNo() {
		int result ,ran;
		String code=null;
		do {
			ran =  ((int)(Math.random()*998)+1);
			code = 'C'+String.format("%03d", ran);
			result=proInoutService.checkClientNo(code);
		}while(result>0);

		return code;
	}	
		
	//거래처 추가
	@RequestMapping("insertClient")
	public String insertClient(Client client, String post, String address1, String address2, Model model) {
		client.setAddress(post + "/" + address1 + "/" + address2);
		if(client.getComment().equals("")) {
			client.setComment(null);
		}
		int result = proInoutService.insertClient(client);
		if(result > 0) {
			model.addAttribute("msg","거래처추가를 성공하였습니다.");
			return "redirect:cList.pio";
		}else {
			model.addAttribute("msg","거래처추가를 실패하였습니다.");
			return "redirect:cList.pio";
		}
		
	}

	//거래처 수정
	@RequestMapping("updateClient")
	public String updateClient(Client client, String post, String address1, String address2, Model model,RedirectAttributes rd) {
		client.setAddress(post + "/" + address1 + "/" + address2);
		if(client.getComment().equals("")) {
			client.setComment(null);
		}
		int result = proInoutService.updateClient(client);
		if(result > 0) {
			rd.addAttribute("cliNo",client.getCliNo());
			model.addAttribute("msg","거래처수정을 성공하였습니다.");
			return "redirect:detailClient";
		}else {
			rd.addAttribute("cliNo",client.getCliNo());
			model.addAttribute("msg","거래처수정을 실패하였습니다.");
			return "redirect:detailClient";
		}
	}
	
	//거래처 삭제
	@RequestMapping("deleteClient")
	public String deleteClient(String cliNo, Model model,RedirectAttributes rd) {
		int count = proInoutService.selectProductCount(cliNo);
		if(count <= 0) {
			int result = proInoutService.deleteClient(cliNo);
			if(result > 0) {
				return "redirect:cList.pio";
			}else {
				rd.addAttribute("cliNo",cliNo);
				model.addAttribute("msg","삭제를 실패하였습니다.");
				return "redirect:detailClient";
			}
		}else {
			rd.addAttribute("cliNo",cliNo);
			model.addAttribute("msg","거래처 관련 상품이 남아있습니다.");
			return "redirect:detailClient";
		}
		
	}
	
	//--------------------------------------------------------상품--------------------------------------------------------//
	//상품화면
	@RequestMapping("pList.pio")
	public String productListView(Model model) {
		ArrayList<Client> cList = proInoutService.selectClientList();
		System.out.println(cList);
		model.addAttribute("cList",cList);
		return "productInOut/productListView";
	}
	
	//상품 리스트
	@RequestMapping(value="selectProductList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectProductList(String cliNo) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(cliNo.equals("")) cliNo=null;
		map.put("cliNo", cliNo);
		result.put("data", proInoutService.selectProductList(map));
		System.out.println(result);
		return new GsonBuilder().create().toJson(result);
	}
	
	//상품코드만들기
	@RequestMapping("createProductNo")
	@ResponseBody
	public String createProductNo(String cliNo) {
		System.out.println(cliNo);
		cliNo = cliNo.substring(1); 
		int result,ran;
		String code=null;
		do{
			ran =  ((int)(Math.random()*9998)+1);
			code = 'P'+cliNo+String.format("%04d", ran);
			result=proInoutService.checkProductNo(code);
		}while(result>0);
		return code;
	}	
		
	//상품 상세정보
	@RequestMapping("detailProduct")
	public String selectProduct(String proNo,Model model) {
		Product product = proInoutService.selectProduct(proNo);
		model.addAttribute("product",product);
		return "productInOut/ProductDetailView";
	}
			
	//상품 추가
	@RequestMapping("insertProduct")
	public String insertProduct(Product product, Model model) {
		if(product.getComment().equals("")) {
			product.setComment(null);
		}
		int result = proInoutService.insertProduct(product);
		if(result > 0) {
			return "redirect:pList.pio";
		}else {
			model.addAttribute("msg","상품추가를 실패하였습니다.");
			return "redirect:pList.pio";
		}
			
	}
	
	//거래처 수정
	@RequestMapping("updateProduct")
	public String updateProduct(Product product, Model model, RedirectAttributes rd) {
		if(product.getComment().equals("")) {
			product.setComment(null);
		}
		int result = proInoutService.updateProduct(product);
		if(result > 0) {
			rd.addAttribute("proNo",product.getProNo());
			return "redirect:detailProduct";
		}else {
			model.addAttribute("msg","상품수정을 실패하였습니다.");
			return "redirect:detailProduct";
		}
	}
		
	//상품 삭제
	@RequestMapping("deleteProduct")
	public String deleteProduct(String proNo, Model model, RedirectAttributes rd) {
		
		int result = proInoutService.deleteProduct(proNo);
		if(result > 0) {
			return "redirect:pList.pio";
		}else {
			rd.addAttribute("proNo",proNo);
			model.addAttribute("msg","상품삭제를 실패하였습니다.");
			return "redirect:detailProduct";
		}
			
	}
	
	//상품 전체삭제
	@RequestMapping("deleteAllProduct")
	@ResponseBody
	public String deleteAllProduct(String cliNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(cliNo.equals("")) cliNo=null;
		map.put("cliNo", cliNo);
		int result = proInoutService.deleteAllProduct(map);
		return String.valueOf(result);
	}
	
	
	//--------------------------------------------------------입출고--------------------------------------------------------//
	//입출고 화면
	@RequestMapping("ioList.pio")
	public String inoutListView(Model model) {
		ArrayList<Client> cList = proInoutService.selectClientList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cliNo", null);
		ArrayList<Product> pList =  proInoutService.selectProductList(map);
		System.out.println(pList);
		model.addAttribute("cList",cList);
		model.addAttribute("pList",pList);
		return "productInOut/inoutListView";
	}
	
	//입출고리스트
	@RequestMapping(value="selectInoutList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectInoutList(String proNo,String cliNo) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(proNo.equals("")) proNo=null;
		if(cliNo.equals(""))cliNo=null;
		map.put("cliNo", cliNo);
		map.put("proNo", proNo);
		ArrayList<Inout> iList = proInoutService.selectInoutList(map);
		for(Inout i : iList) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			i.setInoutDateS(format.format(i.getInoutDate()));
		}
		result.put("data",iList);
		System.out.println(result);
		return new GsonBuilder().create().toJson(result);
	}
	
	//입출고 추가
	@RequestMapping("insertInout")
	public String insertInout(String incliNo,Inout inout, Model model) {
		
		System.out.println(inout.toString());
		inout.setInoutNo(String.valueOf(proInoutService.selectInoutCount()+1));
		
		//if(inout.getCliNo()=="")inout.setCliNo(null);
		if(inout.getComment().equals(""))inout.setComment(null);
		
		Product product = proInoutService.selectProduct(inout.getProNo());
		
		if(inout.getSortation().equals("입고")) {
			product.setInStock(product.getInStock()+inout.getQuantity());
			product.setStock(product.getStock()+inout.getQuantity());
		}else {
			product.setOutStock(product.getOutStock()+inout.getQuantity());
			product.setStock(product.getStock()-inout.getQuantity());
		}
		
		int result = proInoutService.insertInout(inout,product);
		
		if(result > 0) {
				return "redirect:ioList.pio";
		}else {
			model.addAttribute("msg","입출고추가를 실패하였습니다.");
			return "redirect:ioList.pio";
		}
				
	}
	//입출고 취소
	@RequestMapping("deleteInout")
	public String deleteInout(String proNo,String inoutNo, Model model) {
		
		Inout io = proInoutService.selectInout(inoutNo);
		Product product = proInoutService.selectProduct(proNo);
		
		if(io.getSortation().equals("입고")) {
			
			if(product.getStock()-io.getQuantity()<0) {
				model.addAttribute("msg","재고를 확인해주세요.");
				return "redirect:ioList.pio";
			}else {
				product.setStock(product.getStock()-io.getQuantity());
				product.setInStock(product.getInStock()-io.getQuantity());
			}
			
		}else {
			product.setStock(product.getStock()+io.getQuantity());
			product.setOutStock(product.getOutStock()-io.getQuantity());
		}
		
			int result = proInoutService.deleteInout(inoutNo, product);
			
			if(result>0) {
				model.addAttribute("msg","취소를 성공하였습니다.");
				return "redirect:ioList.pio";
			}else {
				model.addAttribute("msg","취소를 실패하였습니다.");
				return "redirect:ioList.pio";
			}
			
	}
	
}
