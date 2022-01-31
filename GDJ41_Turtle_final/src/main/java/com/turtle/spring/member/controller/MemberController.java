package com.turtle.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turtle.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/login/enrollment")
	public String enrollment() {
		return "member/login/enrollment";
	}
	
	@RequestMapping("/member/login/finding")
	public String finding() {
		return "member/login/finding";
	}
	
	@RequestMapping("/member/mypage/myMain")
	public String myMain() {
		return "member/mypage/myMain";
	}	
	
	@RequestMapping("/member/mypage/reviews")
	public String reviews() {
		return "member/mypage/reviews";
	}	
	
	@RequestMapping("/member/mypage/myInfo")
	public String myInfo() {
		return "member/mypage/myInfo";
	}
	
	@RequestMapping("/member/mypage/myInfoUpdate")
	public String myInfoUpdate() {
		return "member/mypage/myInfoUpdate";
	}
	
	@RequestMapping("/member/mypage/delivery")
	public String delivery() {
		return "member/mypage/delivery";
	}
	
	@RequestMapping("/member/mypage/deliveryDetail")
	public String deliveryDetail() {
		return "member/mypage/deliveryDetail";
	}
	
	@RequestMapping("/member/mypage/wishList")
	public String wishList() {
		return "member/mypage/wishList";
	}
	
	@RequestMapping("/member/service/faq")
	public String faq() {
		return "member/service/faq";
	}
	
	@RequestMapping("/member/service/email")
	public String email() {
		return "member/service/email";
	}
	
	@RequestMapping("/member/service/delete")
	public String delete() {
		return "member/service/delete";
	}
	
	
	
}
