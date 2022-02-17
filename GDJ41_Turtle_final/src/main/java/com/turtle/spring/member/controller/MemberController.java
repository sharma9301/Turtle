package com.turtle.spring.member.controller;

import java.util.HashMap;
import java.util.List;
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

import com.turtle.spring.member.model.service.MemberService;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.service.OrderService;
import com.turtle.spring.order.model.vo.OrderDetail;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes({"loginMember"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private OrderService service1;
	
	
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
	public ModelAndView myMain(HttpServletRequest request,ModelAndView mv) {
		
//		Map<String,Object> param = new HashMap();
//		param.put("userId", userId);
//		param.put("password", password);
//		
//		Member m = service.login(param);
//		mv.addObject("loginMember", m);
		
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("loginMember");
		System.out.println("아이디 확인 : "+m.getUserId());
		log.debug("아이디 확인 : "+m.getUserId());
		
		
		
		List<OrderDetail> oDList = service1.selectODList(m.getUserId());
		List stList = service1.stList(m.getUserId());
		log.debug("oDList 확인 : "+oDList);
		
		mv.addObject("oDList",oDList);
		mv.addObject("stList",stList);
		mv.setViewName("member/mypage/myMain");
		return mv;
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
			
			//세션 생성
			Member m = service.login(param);
			mv.addObject("loginMember", m);
			
		}else {
			msg="회원정보수정 실패";
			loc="/member/mypage/myInfoUpdate";
		}
		
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
			
		
		return mv;
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

	@RequestMapping("/member/service/deleteEnd")
	public ModelAndView deleteEnd(SessionStatus status,ModelAndView mv, String userId, String ori1, String ori2) {
		System.out.println("ori1 확인"+ori1);
		System.out.println("ori2 확인"+ori2);
		String msg="";
		String loc="";
		if(encoder.matches(ori1, ori2)) {
			System.out.println("비밀번호 일치합니다요");
			int result = service.deleteMember(userId);
			System.out.println("result들어왔니"+result);
			if(result>0) {
				msg="회원탈퇴 되었습니다.";
				loc="/";
				if(!status.isComplete()) { //-> "만약 삭제되지 않았다면"
					status.setComplete();
				}
			}else {
				msg="회원탈퇴 실패! 다시 시도해주세요.";
				loc="/member/service/delete";
			}
		}else {
			msg="비밀번호가 일치하지 않습니다.";
			loc="/member/service/delete";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/login/login")
	public String loginPage() {
		return "member/login/login";
	}
	
	@RequestMapping("/member/login/login.do")
	public ModelAndView login(ModelAndView mv,HttpServletRequest request) {
		log.debug("로그인 로직 실행했나?");
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
			if(userId.equals("admin")) {
				msg="관리자 로그인 성공";
				loc="/admin/adminMainPage";
			}else {
				msg="로그인 성공";
				loc="/";
			}
			
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
	
	
	/*
		@RequestMapping("/member/deleteEnd")
		public ModelAndView deleteEnd(ModelAndView mv,HttpServletRequest request) {
		String userId = request.getParameter("userId");		
		String oriPassword = request.getParameter("oriPassword");
		String oriPassword2 = request.getParameter("oriPassword2");
		
		String encPassword =encoder.encode(oriPassword);
		
		Map<String,Object> param = new HashMap();
		param.put("userId", userId);
		param.put("password", encPassword);
		
		String msg = "";
		String loc = "";
		if(encoder.matches(oriPassword, oriPassword2)) {
			int result = service.deleteEnd(param);
			if(result>0) {
				msg="탈퇴되었습니다.";
				//로그아웃 로직
				loc="/";
				
			}else {
				msg="문제가 생겼습니다. 다시 시도해주세요!";
				loc="/member/deleteEnd";
			}
		}else {
			msg="비밀번호가 일치하지 않습니다. 다시 시도해주세요!";
			loc="/member/deleteEnd";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
			
		
		return mv;
	}
	
	*/
	
	
	
	
	
	
	
	
}
