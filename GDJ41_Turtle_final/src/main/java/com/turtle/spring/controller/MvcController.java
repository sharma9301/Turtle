package com.turtle.spring.controller;

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
public class MvcController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/") 
	public ModelAndView mainPage(ModelAndView mv) {
		List<Product> list=service.productMainSaleList();
		mv.addObject("list", list);
		mv.setViewName("/index");
		return mv; 
	  }
	  
	  @RequestMapping("/main/store") 
	  public String mainStore() { 
		  return "main/store"; 
	  }
	  
	  @RequestMapping("/main/about") 
	  public String mainAbout() { 
		  return "main/about"; 
	  }
}
