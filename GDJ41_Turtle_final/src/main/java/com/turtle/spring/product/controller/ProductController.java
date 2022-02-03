package com.turtle.spring.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.product.model.service.ProductService;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@RequestMapping("/productAllList.do")
	public ModelAndView productList(ModelAndView mv) {
		List<Product> list=service.productList();
		mv.addObject("list", list);
		mv.setViewName("product/productAllList");
		return mv;
	}
	
}
