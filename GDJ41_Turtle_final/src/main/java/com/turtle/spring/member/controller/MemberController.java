package com.turtle.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.turtle.spring.mail.service.MailService;
import com.turtle.spring.member.model.service.MemberService;
import com.turtle.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes({"loginMember"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//암호화처리 클래스 불러오기
	@Autowired
	private PasswordEncoder encoder;
	
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
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");		
		String oriPassword = request.getParameter("oriPassword2");
		String newPassword = request.getParameter("newPassword");
		String phone = request.getParameter("phone");
		String sample6postcode = request.getParameter("sample6_postcode");
		String sample6address = request.getParameter("sample6_address");
		String sample6detailAddress = request.getParameter("sample6_detailAddress");
		String password = "";
		
		if(newPassword==null || newPassword=="") {
			password = oriPassword;
		}else {
			password = newPassword;
		}
		
		String address = sample6postcode +"/"+ sample6address +"/"+ sample6detailAddress;
		
		System.out.println("oriPassword : "+oriPassword);
		System.out.println("newPassword : "+newPassword);
		System.out.println("password : "+password);
		System.out.println("address : "+address);
		
		String encPassword =encoder.encode(password);
		
		Map<String,Object> param = new HashMap();
		param.put("userName", userName);
		param.put("userId", userId);
		param.put("password", encPassword);
		param.put("phone", phone);
		param.put("address", address);
		
		
		int result = service.myInfoUpdate(param);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg="회원정보수정 성공";
			loc="/member/mypage/myInfo";
		}else {
			msg="회원정보수정 실패";
			loc="/member/mypage/myInfoUpdate";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
			
		
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
		
		String encPassword =encoder.encode(password);
		
		System.out.println(encPassword);
		
		Map<String,Object> param = new HashMap();
		param.put("userId", userId);
		param.put("password", password);
		
		Member m = service.login(param);
		
		System.out.println(m);
		String msg = "";
		String loc = "";
		if(m!=null && encoder.matches((String)param.get("password"), m.getPassword())) {
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
	
	@RequestMapping("/enrollmentEnd")
	public ModelAndView enrollEnd(ModelAndView mv,HttpServletRequest request) {
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");		
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr0 = request.getParameter("addr0");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		String address = addr0 +"/"+ addr1 +"/"+ addr2;
		
		String encPassword =encoder.encode(password);
		System.out.println("변경 전 패스워드 : " + password);
		System.out.println("변경 후 패스워드 : " + encPassword);
		Map<String,Object> param = new HashMap();
		param.put("userName", userName);
		param.put("userId", userId);
		param.put("password", encPassword);
		param.put("phone", phone);
		param.put("email", email);
		param.put("address", address);
		

		
		int result = service.enrollEnd(param);
		
		String msg="회원가입성공";
		String loc="/";
		if(result>0) {
			msg="회원가입성공";
			loc="/";
		}else {
			msg="회원가입실패";
			loc="/member/login/enrollment";
		}

		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/userIdChk.do")
	@ResponseBody
	public String userIdChk(String userId) {
		System.out.println(userId);
		int result = service.userIdChk(userId);
		System.out.println(result);
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
		
		
	}
	
	
	
	//저장되어있는 현재 비밀번호 암호화 & 입력한 현재 비밀번호 암호화 비교  
	@RequestMapping("/passwordChk.do")
	@ResponseBody
	public String passwordChk(String ori, String ori2) {
		
		if(encoder.matches(ori, ori2)) {
			return "success";
		}else {
			return "fail";
		}

		
		
	}
	
	
	
	
	
	
	
}
