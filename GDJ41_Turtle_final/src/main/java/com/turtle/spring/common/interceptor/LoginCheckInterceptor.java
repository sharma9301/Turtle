package com.turtle.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.turtle.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//login여부 확인하기
		HttpSession session = request.getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
//		if(loginMember==null) {
//			request.setAttribute("msg", "로그인 후 이용가능한 서비스입니다.");
//			request.setAttribute("loc", "/member/login/login");
//			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
//			.forward(request, response);
//			return false;
//		}else {
//			
//			return true;
//		}
		return true;
	
	}
	
	
	
	
	
	
}
