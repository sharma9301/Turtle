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
	
	@RequestMapping("/login/enrollment")
	public String enrollment() {
		return "login/enrollment";
	}
	
	@RequestMapping("/login/finding")
	public String finding() {
		return "login/finding";
	}
	
	@RequestMapping("/mypage/myInfo")
	public String myInfo() {
		return "mypage/myInfo";
	}
	
	@RequestMapping("/mypage/myInfoUpdate")
	public String myInfoUpdate() {
		return "mypage/myInfoUpdate";
	}
	
}
