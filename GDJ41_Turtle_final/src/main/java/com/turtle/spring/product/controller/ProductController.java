package com.turtle.spring.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.turtle.spring.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {

	@Autowired
	private ProductService service;
	
	
}
