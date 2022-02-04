package com.turtle.spring.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.turtle.spring.order.model.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService service;
	
	
}
