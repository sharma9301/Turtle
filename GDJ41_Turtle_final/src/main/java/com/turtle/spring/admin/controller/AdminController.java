package com.turtle.spring.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.admin.model.service.AdminService;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/adminMainPage")
	public String adminMainPage() {
		return "admin/adminMainPage";
	}
	
	@RequestMapping("/admin/memberList")
	public String memberList() {
		return "admin/memberList";
	}
	
	@RequestMapping("/admin/productEnroll")
	public String productEnroll() {
		return "admin/productEnroll";
	}
	
	@RequestMapping("/admin/productList")
	public String productList() {
		return "admin/productList";
	}
	
	@RequestMapping("/admin/reviewList")
	public String reviewList() {
		return "admin/reviewList";
	}
	
	@RequestMapping("/admin/userOrderList")
	public String userOrderList() {
		return "admin/userOrderList";
	}
	
	@RequestMapping("/admin/stockManagement")
	public String stockManagement() {
		return "admin/stockManagement";
	}
	
	@RequestMapping("/admin/searchMember")
	public ModelAndView searchMember(ModelAndView mv, HttpServletRequest request) {
		String searchType = request.getParameter("searchType");
		System.out.println("searchType : "+searchType);
		String[] keywords = request.getParameterValues("searchKeyword");
		System.out.println("searchKeyword : "+keywords);
		String enrollType = request.getParameter("enrollType");
		System.out.println("enrollType : "+enrollType);
		String keyword = "";
		for(int i=0; i<keywords.length;i++) {
			if(keywords[i]!="") {
				keyword = keywords[i];
			}
		}
		System.out.println("keyword : "+keyword);
		
		Map<String,Object> param = new HashMap();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("enrollType", enrollType);
		
		
		List<Member> list = service.selectMemberList(param);
		
		System.out.println(list);
		mv.addObject("memberList",list);
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	@RequestMapping("/admin/searchProduct")
	public ModelAndView searchProduct(ModelAndView mv, HttpServletRequest request) {
		String searchType = request.getParameter("searchType");
		System.out.println("searchType : "+searchType);
		String[] keywords = request.getParameterValues("searchKeyword");
		System.out.println("searchKeyword : "+keywords);
		String category_code = request.getParameter("category_code");
		System.out.println("category_code : "+category_code);
		String keyword = "";
		for(int i=0; i<keywords.length;i++) {
			if(keywords[i]!="") {
				keyword = keywords[i];
			}
		}
		System.out.println("keyword : "+keyword);
		
		Map<String,Object> param = new HashMap();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("category_code", category_code);
		
		
		List<Product> list = service.selectProductList(param);
		int count = service.selectProductCount(param);
		
		System.out.println(list);
		mv.addObject("productList",list);
		mv.addObject("productCount",count);		
		mv.setViewName("admin/productList");
		return mv;
	}
}
