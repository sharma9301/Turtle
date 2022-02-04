package com.turtle.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.member.model.service.MemberService;
import com.turtle.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes({"loginMember"})
@Controller
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
	public ModelAndView myInfo(String userId, ModelAndView mv) { 
		
		/*
		 * Member m = service.myInfo(userId);
		 * 
		 * mv.addObject("m",m);
		 */
		mv.setViewName("member/mypage/myInfo");
		
		return mv;
		
	}
	
	@RequestMapping("/member/mypage/myInfoUpdate")
	public String myInfoUpdate() {
		return "member/mypage/myInfoUpdate";
	}
	
	@RequestMapping("/member/mypage/myInfoUpdateEnd")
	public ModelAndView myInfoUpdateEnd(ModelAndView mv,HttpServletRequest request) {
		System.out.println("확인");
		
		mv.setViewName("member/mypage/myInfo");
		return mv;
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
	
	@RequestMapping("/member/login/login")
	public String loginPage() {
		return "member/login/login";
	}
	
	@RequestMapping("/member/login/login.do")
	public ModelAndView login(ModelAndView mv,HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		System.out.println(userId);
		System.out.println(password);
		
		Map<String,Object> param = new HashMap();
		param.put("userId", userId);
		param.put("password", password);
		
		Member m = service.login(param);
		
		System.out.println(m);
		String msg = "";
		String loc = "";
		if(m!=null) {
			mv.addObject("loginMember", m);
			msg="로그인 성공";
			loc="/";
		}else {
			msg="로그인 실패 다시 시도하세요";
			loc="/member/login/login";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(ModelAndView mv, HttpSession session,SessionStatus status) { 
		
		
		if(!status.isComplete()) { //-> "만약 삭제되지 않았다면"
			status.setComplete();
		}
		
		String msg="로그아웃 되었습니다.";
		String loc="/";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	

	
	
	
	
	
	
	
	
	
}
