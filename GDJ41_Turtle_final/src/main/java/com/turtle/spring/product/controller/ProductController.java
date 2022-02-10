package com.turtle.spring.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.common.PageFactory;
import com.turtle.spring.member.model.vo.Member;
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productList.do?",param ));
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productCategoryList.do?",param));

		List<Product> list=service.productCategoryList(param,cPage, numPerpage );
		mv.addObject("list", list);
		mv.addObject("title",title);
		mv.addObject("selectedValue",selectedValue);
		mv.setViewName("product/productList");
		return mv;
	}
	
//	상품상세페이지
	@RequestMapping("/productDetail.do")
	public ModelAndView productDetail(ModelAndView mv, HttpServletRequest request,
										@RequestParam(value="cPage",defaultValue="1") int cPage,  
										@RequestParam(value="numPerpage",defaultValue="5") int numPerpage) {
		String pdCode=request.getParameter("pdCode");
		Option product=service.productDetail(pdCode);
		List<Option> sizeList = service.pdOptionSizeList(pdCode);
		List<Reviews> reviews=service.selectReivews(cPage, numPerpage,pdCode);
		int totalData=service.reviewsCount(pdCode);
//		안쓰는 title
		String title="";
		Map<String,Object> param = new HashMap();
		int sizeCount = service.pdOptionSizeCount(pdCode);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productDetail.do?pdCode="+pdCode+"&",param));
		mv.addObject("product",product);
		mv.addObject("sizeList",sizeList);
		mv.addObject("sizeCount",sizeCount);
		mv.addObject("reviews",reviews);
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productSaleList.do",param ));
		
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productNewList.do",param ));
		
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productBestList.do",param ));
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		return mv;
	}
	
	//주문페이지
	@RequestMapping("/orderProduct.do")
	public ModelAndView orderProduct(ModelAndView mv, String pdCode, String userId,HttpServletRequest request) {
		Product product=service.productOrderDetail(pdCode);

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
	
	@RequestMapping("/productPayment.do")
	public ModelAndView productPayment(ModelAndView mv) {
		
		mv.setViewName("product/payment");
		return mv;
	}
}
