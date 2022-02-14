package com.turtle.spring.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.order.model.service.OrderService;
import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService service;

	@RequestMapping("/member/mypage/delivery")
	public ModelAndView delivery(ModelAndView mv, String userId) {
		System.out.println("userId들어왔나요" + userId);

		List<OrderDetail> oDList = service.selectODList(userId);

		mv.addObject("oDList", oDList);
		mv.setViewName("member/mypage/delivery");

		return mv;

	}

	@RequestMapping("/member/mypage/deliveryDetail")
	public ModelAndView deliveryDetail(ModelAndView mv, String userId, String orderNo) {
		System.out.println("유저아이디 : " + userId + "오더넘버 : " + orderNo);

		List<Product> pdList = service.selectPDList(orderNo);
		System.out.println(pdList);
		mv.addObject("pdList",pdList); 
		mv.setViewName("member/mypage/deliveryDetail");
		return mv;
	}

}
