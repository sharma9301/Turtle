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

import com.turtle.spring.common.PageFactory;
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
		List<Product> list=service.productList(cPage, numPerpage);
		int totalData=service.productListCount();
		String title = request.getParameter("title");
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productList.do",title ));
		
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
//	earr,ring,neck,brac
	@RequestMapping("/productCategoryList.do")
	public ModelAndView productABC(ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		String title = request.getParameter("title");
		String category = title.substring(0,4).toLowerCase();
		String selectedValue = request.getParameter("selectedValue");
//		System.out.println("title : "+title);
//		System.out.println("category : "+category);
//		System.out.println("selectedValue : "+selectedValue);
		Map<String,Object> param = new HashMap();
		param.put("category", category);
		param.put("selectedValue", selectedValue);
		
		int totalData=service.productCategoryListCount(param);

		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productList.do",title));

		List<Product> list=service.productCategoryList(param,cPage, numPerpage );
		mv.addObject("list", list);
		mv.addObject("title",title);
		mv.setViewName("product/productList");
		return mv;
	}
	
//	상품상세페이지
	@RequestMapping("/productDetail.do")
	public ModelAndView productDetail(ModelAndView mv, HttpServletRequest request) {
		String pdCode=request.getParameter("pdCode");
		System.out.println(pdCode);
		Product product=service.productDetail(pdCode);
		System.out.println(product);
		List<Option> sizeList = service.pdOptionSizeList(pdCode);
		int sizeCount = service.pdOptionSizeCount(pdCode);
		mv.addObject("product",product);
		mv.addObject("sizeList",sizeList);
		mv.addObject("sizeCount",sizeCount);
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
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productSaleList.do",title ));
		
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
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productNewList.do",title ));
		
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
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productBestList.do",title ));
		
		mv.addObject("title",title);
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		return mv;
	}

}
