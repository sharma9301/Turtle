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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.admin.model.service.AdminService;
import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/adminMainPage")
	public ModelAndView adminMainPage(ModelAndView mv) {
		
		List list = service.selectStatusList();
		
		mv.addObject("statusList",list);
		mv.setViewName("admin/adminMainPage");
		return mv;
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
	
	@RequestMapping("/admin/searchProductOpt.do")
	public ModelAndView searchProductOpt(ModelAndView mv, HttpServletRequest request) {
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
		
		List<Option> list = service.selectProductOptList(param);
		int count = service.selectProductOptCount(param);
		
		System.out.println(list);
		mv.addObject("productOptList",list);
		mv.addObject("productOptCount",count);		
		mv.setViewName("admin/stockManagement");
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
		
		String msg = "";
		String loc = "";
		loc="/admin/productEnroll";
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
			msg = "product 추가 성공";
		}else {
			System.out.println("product 추가 실패");
			msg = "product 추가 성공";
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
					msg = "product opt 추가 실패";
				}
			}
		}else {
			param.put("opt_size", opt_sizes);
			insertResult2 = service.insertProductOpt(param);
			
			if(insertResult2>0) {
				System.out.println("product opt 추가 성공");
			}else {
				System.out.println("product opt 추가 실패");
				msg = "product opt 추가 실패";
			}
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/admin/productCodeChk")
	@ResponseBody
	public String productCodeCheck(String productCode) {
		
		log.debug("productCodeCheck 진입");
		System.out.println(productCode);
		int result = service.selectProductCodeCheck(productCode);
		
		log.debug("결과 값 : "+result);
		
		if(result != 0) {
			log.debug("중복됨");
			return "fail";
		} else {
			log.debug("중복 안됨");
			return "success";
		}
		
	
	}

	@RequestMapping("/admin/updateProduct.do")
	public ModelAndView updateProduct(ModelAndView mv, HttpServletRequest request, MultipartFile file) {
		log.debug("=====");
		String updateData = request.getParameter("updateData");
		System.out.println("updateData : "+updateData);
		String[] dataList = updateData.split(",");
		String[] dataArr = null;
		String pd_Code = "";
		String pd_Price = "";
		String pd_Is_Discount = "";
		String pd_Discountrate = "";
		String pd_Is_Display = "";
		String msg = "";
		String loc = "";
		
		for(int i=0;i<dataList.length;i++) {
			System.out.println(dataList[i]);
			dataArr = dataList[i].split("/");
//			for(int j=0;j<dataArr.length;j++) {
//				System.out.println(dataArr[j]);
//			}
			pd_Code = dataArr[0];
			pd_Price = dataArr[1];
			pd_Is_Discount = dataArr[2];
			pd_Discountrate = dataArr[3];
			pd_Is_Display = dataArr[4];
			
			System.out.println(pd_Code);
			System.out.println(pd_Price);
			System.out.println(pd_Is_Discount);
			System.out.println(pd_Discountrate);
			System.out.println(pd_Is_Display);
			
			
			Map<String,Object> param = new HashMap();		
			param.put("pd_Code",pd_Code);
			param.put("pd_Price",pd_Price);
			param.put("pd_Is_Discount",pd_Is_Discount);
			param.put("pd_Discountrate",pd_Discountrate);
			param.put("pd_Is_Display", pd_Is_Display);
			
			int count = service.updateProduct(param);
			
			if(count>0) {
				log.debug("수정 완료");
				msg="정보 수정 성공";
				
			}else {
				log.debug("수정 실패");
				msg="정보 수정 실패";
			}
		}
		loc="/admin/productList";
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

	@RequestMapping("/admin/deleteProduct.do")
	public ModelAndView deleteProduct(ModelAndView mv, HttpServletRequest request, MultipartFile file) {
		
		String deleteData = request.getParameter("deleteData");
		System.out.println("deleteData : "+deleteData);
		String[] dataList = deleteData.split(",");
		String pd_Code = "";
		String msg = "";
		String loc = "";
		loc = "/admin/productList";
		
		for(int i=0;i<dataList.length;i++) {
			pd_Code = dataList[i];
			int count = service.deleteProduct(pd_Code);
			
			if(count>0) {
				log.debug("삭제 완료");
				msg = "삭제 완료";
			}else {
				log.debug("삭제 실패");
				msg = "삭제 실패";
			}
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/admin/updateStock.do")
	public ModelAndView updateStock(ModelAndView mv, HttpServletRequest request) {
		log.debug("=====");
		String updateData = request.getParameter("updateData");
		System.out.println("updateData : "+updateData);
		String[] dataList = updateData.split(",");
		String[] dataArr = null;
		String opt_No = "";
		String stock = "";
		
		String msg = "";
		String loc = "";
		
		for(int i=0;i<dataList.length;i++) {
			System.out.println(dataList[i]);
			dataArr = dataList[i].split("/");

			opt_No = dataArr[0];
			stock = dataArr[1];
			
			
			System.out.println(opt_No);
			System.out.println(stock);
			
			
			Map<String,Object> param = new HashMap();		
			param.put("opt_No",opt_No);
			param.put("stock",stock);
			
			int count = service.updateStock(param);
			
			if(count>0) {
				log.debug("수정 완료");
				msg="정보 수정 성공";
				
			}else {
				log.debug("수정 실패");
				msg="정보 수정 실패";
			}
		}
		loc="/admin/stockManagement";
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/deleteProductOption.do")
	public ModelAndView deleteProductOption(ModelAndView mv, HttpServletRequest request, MultipartFile file) {
		
		String deleteData = request.getParameter("deleteData");
		System.out.println("deleteData : "+deleteData);
		String[] dataList = deleteData.split(",");
		String opt_No = "";
		String msg = "";
		String loc = "";
		loc = "/admin/productList";
		
		for(int i=0;i<dataList.length;i++) {
			opt_No = dataList[i];
			int count = service.deleteProductOption(opt_No);
			
			if(count>0) {
				log.debug("삭제 완료");
				msg = "삭제 완료";
			}else {
				log.debug("삭제 실패");
				msg = "삭제 실패";
			}
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/searchOrder.do")
	public ModelAndView searchOrder(ModelAndView mv, HttpServletRequest request) {
		String searchType = request.getParameter("searchType");
		System.out.println("searchType : "+searchType);
		String[] keywords = request.getParameterValues("searchKeyword");
		System.out.println("searchKeyword : "+keywords);
		String pay_method = request.getParameter("pay_method");
		System.out.println("pay_method : "+pay_method);
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
		param.put("pay_method", pay_method);
		param.put("fromDate", fromDate);
		param.put("toDate", toDate);
		
		List<Order> list = service.selectOrderList(param);
		int count = service.selectOrderCount(param);
		
		System.out.println(list);
		mv.addObject("orderList",list);
		mv.addObject("orderCount",count);		
		mv.setViewName("admin/userOrderList");
		return mv;
	}
	
	@RequestMapping("/admin/updateInvoice.do")
	public ModelAndView updateInvoice(ModelAndView mv, HttpServletRequest request) {
		log.debug("=====");
		String updateData = request.getParameter("updateData");
		System.out.println("updateData : "+updateData);
		String[] dataList = updateData.split(",");
		String[] dataArr = null;
		String order_No = "";
		String deliveryComp = "";
		String invoice = "";
		
		String msg = "";
		String loc = "";
		
		for(int i=0;i<dataList.length;i++) {
			System.out.println(dataList[i]);
			dataArr = dataList[i].split("/");

			order_No = dataArr[0];
			deliveryComp = dataArr[1];
			invoice = dataArr[2];
			
			
			
			System.out.println(order_No);
			System.out.println(deliveryComp);
			System.out.println(invoice);
			
			
			Map<String,Object> param = new HashMap();		
			param.put("order_No",order_No);
			param.put("deliveryComp",deliveryComp);
			param.put("invoice",invoice);
			
			int count = service.updateInvoice(param);
			
			if(count>0) {
				log.debug("수정 완료");
				msg="송장 번호 저장 성공";
				
			}else {
				log.debug("수정 실패");
				msg="송장 번호 저장 실패";
			}
		}
		loc="/admin/userOrderList";
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/updateStatus.do")
	public ModelAndView updateStatus(ModelAndView mv, HttpServletRequest request) {
		log.debug("=====");
		String updateData = request.getParameter("updateData");
		System.out.println("updateData : "+updateData);
		String[] dataList = updateData.split(",");
		String[] dataArr = null;
		String status = "";
		
		String orderNo="";
		String msg = "";
		String loc = "";
		
		for(int i=0;i<dataList.length;i++) {
			System.out.println(dataList[i]);
			dataArr = dataList[i].split("/");

			orderNo = dataArr[0];
			status = dataArr[1];
			
			if(status.equals("미배송")) {
				status = "결제 완료";
			}
			log.debug(status);
			
			System.out.println(orderNo);
			
			Map<String,Object> param = new HashMap();		
			param.put("order_No",orderNo);
			param.put("orderStatus",status);			
			
			int count = service.updateStatus(param);
			
			if(count>0) {
				log.debug("수정 완료");
				msg="상태 수정 성공";
				
			}else {
				log.debug("수정 실패");
				msg="상태 수정 실패";
			}
		}
		loc="/admin/userOrderList";
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/searchReviews.do")
	public ModelAndView searchReviews(ModelAndView mv, HttpServletRequest request) {
		String searchType = request.getParameter("searchType");
		System.out.println("searchType : "+searchType);
		String[] keywords = request.getParameterValues("searchKeyword");
		System.out.println("searchKeyword : "+keywords);
		
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
		param.put("fromDate", fromDate);
		param.put("toDate", toDate);
		
		List<Reviews> list = service.selectReviewsList(param);
		int count = service.selectReviewsCount(param);
		
		System.out.println(list);
		mv.addObject("reviewsList",list);
		mv.addObject("reviewsCount",count);		
		mv.setViewName("admin/reviewList");
		return mv;
	}
	
}
