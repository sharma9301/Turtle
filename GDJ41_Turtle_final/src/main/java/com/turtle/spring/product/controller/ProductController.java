package com.turtle.spring.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.common.PageFactory;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.product.model.service.ProductService;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;
	
//	all
	@RequestMapping("/productList.do")
	public ModelAndView productList(ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		String selectedValue = request.getParameter("selectedValue");
		Map<String,Object> param = new HashMap();
		param.put("selectedValue", selectedValue);
		
		List<Product> list=service.productList(cPage, numPerpage,param);
		int totalData=service.productListCount();
		String title = request.getParameter("title");
		
		
		
		param.put("title", title);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productList.do?",param ));
		mv.addObject("selectedValue",selectedValue);
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
//	earr,ring,neck,brac
	@RequestMapping("/productCategoryList.do")
	public ModelAndView productCategoryList(ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		String title = request.getParameter("title");
		String category = title.substring(0,4).toLowerCase();
		
		String selectedValue = request.getParameter("selectedValue");
		Map<String,Object> param = new HashMap();
		param.put("category", category);
		param.put("selectedValue", selectedValue);
		
		int totalData=service.productCategoryListCount(param);
		param.put("title", title);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productCategoryList.do?",param));

		List<Product> list=service.productCategoryList(param,cPage, numPerpage );
		mv.addObject("list", list);
		mv.addObject("title",title);
		mv.addObject("selectedValue",selectedValue);
		mv.setViewName("product/productList");
		return mv;
	}
	
//	?????????????????????
	@RequestMapping("/productDetail.do")
	public ModelAndView productDetail(ModelAndView mv, HttpServletRequest request,
										@RequestParam(value="cPage",defaultValue="1") int cPage,  
										@RequestParam(value="numPerpage",defaultValue="5") int numPerpage) {
		String pdCode=request.getParameter("pdCode");
		Option product=service.productDetail(pdCode);
		List<Option> sizeList = service.pdOptionSizeList(pdCode);
		List<Reviews> reviews=service.selectReviews(cPage, numPerpage,pdCode);
		List<Reviews> reviews2=service.selectReviews2(pdCode);

		int reviewsSum=0;
		double reviewsSum2=0;
		
		int totalData=service.reviewsCount(pdCode);
		
		if(totalData>0) {
			//????????? ?????????
			reviewsSum=service.reviewsSum(pdCode);
			//?????????????????????
			reviewsSum2=service.reviewsSum2(pdCode);
		}else {
			reviewsSum=0;
			reviewsSum2=0;
		}
		
//		????????? title
		String title="";
		Map<String,Object> param = new HashMap();
		int sizeCount = service.pdOptionSizeCount(pdCode);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productDetail.do?pdCode="+pdCode+"&",param));
		mv.addObject("product",product);
		mv.addObject("sizeList",sizeList);
		mv.addObject("sizeCount",sizeCount);
		mv.addObject("reviews",reviews);
		mv.addObject("reviews2",reviews2);
		mv.addObject("reviewsSum",reviewsSum);
		mv.addObject("reviewsSum2",reviewsSum2);
		mv.addObject("totalData",totalData);
		mv.setViewName("product/productDetail");
		return mv;
	}

//	sale
	@RequestMapping("/productSaleList.do")
	public ModelAndView productSaleList(ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		List<Product> list=service.productSaleList(cPage, numPerpage);
		int totalData=service.productSaleListCount();
		String title = request.getParameter("title");
		Map<String,Object> param = new HashMap();
		param.put("title", title);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productSaleList.do?",param ));
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		return mv;
	}
	
//	NEW
	@RequestMapping("/productNewList.do")
	public ModelAndView productNewList(ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		List<Product> list=service.productNewList(cPage, numPerpage);
		int totalData=service.productNewListCount();
		String title = request.getParameter("title");
		Map<String,Object> param = new HashMap();
		param.put("title", title);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productNewList.do?",param ));
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		return mv;
	}
	
//	BEST
	@RequestMapping("/productBestList.do")
	public ModelAndView productBestList(ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		List<Product> list=service.productBestList(cPage, numPerpage);
		int totalData=service.productBestListCount();
		String title = request.getParameter("title");
		Map<String,Object> param = new HashMap();
		param.put("title", title);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, request.getContextPath()+"/product/productBestList.do?",param ));
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		return mv;
	}
	
	//???????????????
	@RequestMapping("/orderProduct.do")
	public ModelAndView orderProduct(ModelAndView mv, String pdCode, String userId, HttpServletRequest request) {
		Product product=service.productOrderDetail(pdCode);

		mv.addObject("pdCode",pdCode);
		mv.addObject("product",product);
		mv.addObject("amount",request.getParameter("amount"));
		mv.addObject("size",request.getParameter("size"));
		mv.setViewName("product/orderDetail");
		return mv;
	}
	
	@RequestMapping("/cartOrderProduct.do")
	public ModelAndView cartOrderProduct(ModelAndView mv, HttpServletRequest request) {
		String pdCode=request.getParameter("pdCode");
		Product product=service.productOrderDetail(pdCode);
		
		mv.addObject("userId",request.getParameter("userId"));
		mv.addObject("pdCode",pdCode);
		mv.addObject("product",product);
		mv.addObject("amount",request.getParameter("amount"));
		mv.addObject("size",request.getParameter("size"));
		mv.setViewName("product/orderDetail");
		return mv;
	}
	
	

	@RequestMapping("/orderCheck.do")
	public ModelAndView orderCheck(ModelAndView mv,HttpServletRequest request,String userName, String phone, String email, String address) {
		String pdCode=request.getParameter("pdCode");
		Product p=service.productOrderDetail(pdCode);
		mv.addObject("pdCode",pdCode);
		mv.addObject("size",request.getParameter("size"));
		mv.addObject("amount",request.getParameter("amount"));
		mv.addObject("userId",request.getParameter("userId"));
		mv.addObject("userName",userName);
		mv.addObject("phone",phone);
		mv.addObject("email",email);
		mv.addObject("address",address);
		mv.addObject("product",p);
		mv.setViewName("product/orderCheck");
		return mv;
	}
	
	@RequestMapping("/insertOrder.do")
	@ResponseBody
	public ModelAndView payment(HttpServletRequest request, ModelAndView mv) throws ServletException, IOException {
		String pdName=request.getParameter("pdName");
		String orderNo=request.getParameter("orderNo");
		String userId=request.getParameter("userId");
		String rcName=request.getParameter("rcName");
		String rcPhone=request.getParameter("rcPhone");
		String rcAddress=request.getParameter("rcAddress");
		String payMethod=request.getParameter("payMethod");
		int payTotalPrice=Integer.parseInt(request.getParameter("payTotalPrice"));
		int size=Integer.parseInt(request.getParameter("size"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		String optNo=pdName+" "+size;
		
		Map<String, Object> param = new HashMap();
		Map<String, Object> param2 = new HashMap();
		param.put("orderNo", orderNo);
		param.put("userId", userId);
		param.put("rcName", rcName);
		param.put("rcPhone", rcPhone);
		param.put("rcAddress", rcAddress);
		param.put("payMethod", payMethod);
		param.put("payTotalPrice", payTotalPrice);
		
		param2.put("orderNo", orderNo);
		param2.put("amount", amount);
		param2.put("optNo", optNo);
		
		int orderResult=service.insertOrder(param);
		int orderDetailResult=service.insertOrderDetail(param2);
		String msg="";
		String loc="";
		if(orderResult>0) {
			if(orderDetailResult>0) {
				msg="????????? ??????????????? ?????????????????????. ?????? ????????? ????????????????????? ??????????????????.";
				loc="/member/mypage/myMain";
			}
			else {
				msg="?????? ?????????????????????. ??????????????? ???????????????.";
				loc="/product/productDetail";
			}
		}else {
			msg="?????? ?????????????????????. ??????????????? ???????????????.";
			loc="/product/productDetail";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	@RequestMapping("/searchProduct.do")
	public ModelAndView searchProduct(ModelAndView mv, String search, HttpServletRequest request) {
		String searchType = request.getParameter("searchType").toUpperCase();
		String keyword = request.getParameter("keyword").toUpperCase();
		
		if(searchType.equals("PD_CODE")) {
			keyword = request.getParameter("keyword").toLowerCase();
		}
		
		System.out.println(searchType);
		System.out.println(keyword);
		
		Map<String,Object> param = new HashMap();
		param.put("searchType", searchType);
		param.put("keyword", keyword);

		List<Product> list=service.searchProduct(param);
		int count = service.searchProductCount(param);
		
		mv.addObject("keyword",keyword);
		mv.addObject("list",list);
		mv.addObject("totalContents",count);
		mv.setViewName("product/productList");
		return mv;
	}
	
	@RequestMapping("/insertReview.do")
	public ModelAndView insertReview(ModelAndView mv,HttpServletRequest request) {
		String pdCode=request.getParameter("pdCode");
		String userId=request.getParameter("userId");
		int rvNo=Integer.parseInt(request.getParameter("rvNo"));
		
		mv.addObject("pdCode",pdCode);
		mv.addObject("userId",userId);
		mv.addObject("rvNo",rvNo);
		mv.setViewName("product/insertReview");
		return mv;
	}
	
	@RequestMapping("/insertReviewEnd.do")
	public ModelAndView insertReviewEnd(ModelAndView mv, HttpServletRequest request, MultipartFile upFile) {
		String rvTitle=request.getParameter("rvTitle");
		String rvContent = request.getParameter("rvContent");
		int rvGrade = Integer.parseInt(request.getParameter("rvGrade"));
		String userId=request.getParameter("userId");
		int rvNo=Integer.parseInt(request.getParameter("rvNo"));
		String pdCode=request.getParameter("pdCode");
		
		System.out.println("rvTitle : "+rvTitle);
		System.out.println("rvContent : "+rvContent);
		System.out.println("rvGrade : "+rvGrade);
		System.out.println("userId : "+userId);
		System.out.println("rvNo : "+rvNo);
		System.out.println("pdCode : "+pdCode);
		
		log.debug(upFile.getOriginalFilename());
		
		//???????????? ????????????
		String path = request.getServletContext().getRealPath("/resources/images/reviews/");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		
		String pdImage="";
		if(!upFile.isEmpty()) {
			//???????????????
			String originalFileName = upFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmm");
			int rNum = (int)(Math.random()*1000);
			pdImage = sdf.format(System.currentTimeMillis())+"_"+rNum+ext;
			
			try {
				upFile.transferTo(new File(path+pdImage));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			System.out.println("????????? ???????????? ??? ???????!!"+pdImage);
		}
		
		Map<String, Object> param = new HashMap();
		param.put("rvTitle", rvTitle);
		param.put("rvContent", rvContent);
		param.put("rvGrade", rvGrade);
		param.put("userId", userId);
		param.put("rvNo", rvNo);
		param.put("pdCode", pdCode);
		param.put("pdImage", pdImage);
		
		String msg="";
		String loc="";
		int result = service.insertReviewEnd(param);
		if(result>0) {
			System.out.println("??????????????????!");
			int result2 = service.rvIs(rvNo);
			if(result2>0) {
				System.out.println("?????? Y??? ?????? ??????!");
				msg="?????? ????????? ?????????????????????. ????????? ????????? ?????? ????????? ?????? ?????? ????????????????????? ?????? ???????????????.";
				loc="/member/mypage/reviews?userId="+userId;
			}else {
				msg="?????? ?????? ????????? ?????????????????????. ??????????????? ???????????????.";
				loc="/member/service/email";
			}
			
		}else {
			msg="?????? ?????? ????????? ?????????????????????. ??????????????? ???????????????.";
			loc="/member/service/email";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/addCart.do")
	public ModelAndView addCart(ModelAndView mv, HttpServletRequest request) {
		Map<String, Object> param = new HashMap();
		Map<String, Object> param2 = new HashMap();
		String userId=request.getParameter("userId");
		String pdName=request.getParameter("pdName");
		int size=Integer.parseInt(request.getParameter("size"));
		String amount=request.getParameter("amount");
		
		String optNo ="";
		if(size == 0) {
			optNo = pdName;
		}else {
			optNo = pdName+" "+size;
		}
		
		String msg="";
		String loc="";
		Cart c = service.selectCart(optNo);
		param.put("userId", userId);
		param.put("optNo", optNo);
		param.put("amount", amount);
		
		param2.put("optNo", optNo);
		param2.put("amount", amount);
		param2.put("userId", userId);
		if(c != null) {
			//????????? ??????
			int update = service.updateAmount(param2);
			if(update>0) {
				System.out.println("?????? ????????? ???????????????!");
				msg="?????? ????????? ??????????????? ?????????????????????. ????????????????????? ???????????????.";
				loc="/member/mypage/wishList?userId="+userId;
			}else {
				msg="???????????? ?????? ?????????????????????. ??????????????? ??????????????????.";
				loc="/member/service/email";
			}
		}else {
			//????????? ?????? ??????
			int result = service.addCart(param);
			if(result>0) {
				System.out.println("????????? ?????? ???????????? ??????!");
				msg="?????? ????????? ??????????????? ?????????????????????. ????????????????????? ???????????????.";
				loc="/member/mypage/wishList?userId="+userId;
			}else {
				msg="???????????? ?????? ?????????????????????. ??????????????? ??????????????????.";
				loc="/member/service/email";
			}
		}		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
	
	
}
