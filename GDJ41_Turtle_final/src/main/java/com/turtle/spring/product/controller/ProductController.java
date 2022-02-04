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
	
	@RequestMapping("/productList.do")
	public ModelAndView productList(ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		List<Product> list=service.productList(cPage, numPerpage);
		int totalData=service.productListCount();

		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productList.do"));
		
		String title = request.getParameter("title");
		mv.addObject("title",title);
		
		mv.addObject("list", list);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
	@RequestMapping("/productCategoryList.do")
	public ModelAndView productABC(ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value="cPage",defaultValue="1") int cPage,  
									@RequestParam(value="numPerpage",defaultValue="16") int numPerpage) {
		String title = request.getParameter("title");
		String category = title.substring(0,4).toLowerCase();
		Map<String,Object> param = new HashMap();
		param.put("category", category);
		int totalData=service.productCategoryListCount(param);
		System.out.println(totalData);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "/product/productList.do"));

		List<Product> list=service.productCategoryList(param,cPage, numPerpage );
		mv.addObject("list", list);
		mv.addObject("title",title);
		mv.setViewName("product/productList");
		return mv;
	}
	
	@RequestMapping("/productDetail.do")
	public ModelAndView productDetail(ModelAndView mv, HttpServletRequest request) {
		String pdCode=request.getParameter("pdCode");
		Product product=service.productDetail(pdCode);
		List<Option> sizeList = service.pdOptionSizeList(pdCode);
		int sizeCount = service.pdOptionSizeCount(pdCode);
		mv.addObject("product",product);
		mv.addObject("sizeList",sizeList);
		mv.addObject("sizeCount",sizeCount);
		mv.setViewName("product/productDetail");
		return mv;
	}
}
