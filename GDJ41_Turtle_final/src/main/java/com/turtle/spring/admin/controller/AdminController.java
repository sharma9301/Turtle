package com.turtle.spring.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping("/admin/searchMember.do")
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
	
	@RequestMapping("/admin/searchProduct.do")
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
		
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		
		System.out.println("fromDate : "+fromDate);
		System.out.println("toDate : "+toDate);
		
		
		Map<String,Object> param = new HashMap();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("category_code", category_code);
		param.put("fromDate", fromDate);
		param.put("toDate", toDate);
		
		List<Product> list = service.selectProductList(param);
		int count = service.selectProductCount(param);
		
		System.out.println(list);
		mv.addObject("productList",list);
		mv.addObject("productCount",count);		
		mv.setViewName("admin/productList");
		return mv;
	}
	
	@RequestMapping("/admin/productEnrollEnd")
	public ModelAndView productEnroll(ModelAndView mv, HttpServletRequest request, @RequestParam("productImage") MultipartFile file) throws Exception {
		
		String pd_Name = request.getParameter("productName");
		String pd_Price = request.getParameter("productPrice");
		String category_code = request.getParameter("category_code");
		String pd_code = request.getParameter("productCode");
		String pd_Image = file.getOriginalFilename();	
		System.out.println("==================================");
		System.out.println("pd_Name : "+pd_Name);
		System.out.println("pd_Price : "+pd_Price);
		System.out.println("category_code : "+category_code);
		System.out.println("pd_code : "+pd_code);
		System.out.println("pd_Image : "+pd_Image);
		
		String path = request.getServletContext().getRealPath("/resources/images/product/");
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		file.transferTo(new File(path+pd_Image)); // 파일 업로드 작업 수행
		
		Map<String,Object> param = new HashMap();
		param.put("pd_Name",pd_Name);
		param.put("pd_Price",pd_Price);
		param.put("category_code",category_code);
		param.put("pd_code",pd_code);
		param.put("pd_Image", pd_Image);
		
		int insertResult = service.insertProduct(param);
		
		if(insertResult>0) {
			System.out.println("product 추가 성공");
		}else {
			System.out.println("product 추가 실패");
		}
		
		String opt_material = request.getParameter("material");
		String opt_color = request.getParameter("color");
		String opt_weight = request.getParameter("weight");
		String opt_stock = request.getParameter("stock");
		String opt_sizes = request.getParameter("size");
		
		
		param.put("opt_material", opt_material);
		param.put("opt_color", opt_color);
		param.put("opt_weight", opt_weight);
		param.put("opt_stock", opt_stock);
		
		int insertResult2 = 0;
		
		if(opt_sizes.toUpperCase() != "FREE") {
			String[] sizeArr = opt_sizes.split(",");
			for(int i=0;i<sizeArr.length;i++) {
				String opt_size = sizeArr[i];
				System.out.println("opt_size : "+opt_size);
				param.put("opt_size", opt_size);
				insertResult2 = service.insertProductOpt(param);
				
				if(insertResult2>0) {
					System.out.println("product opt 추가 성공");
				}else {
					System.out.println("product opt 추가 실패");
				}
			}
		}else {
			param.put("opt_size", opt_sizes);
			insertResult2 = service.insertProductOpt(param);
			
			if(insertResult2>0) {
				System.out.println("product opt 추가 성공");
			}else {
				System.out.println("product opt 추가 실패");
			}
		}
		
		
		mv.setViewName("admin/productEnroll");
		return mv;
	}
}
