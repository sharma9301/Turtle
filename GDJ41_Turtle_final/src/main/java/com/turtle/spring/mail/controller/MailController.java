package com.turtle.spring.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.turtle.spring.mail.service.MailService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MailController {
	private final MailService mailService;
	
	@RequestMapping("/sendEmail.do")
	@ResponseBody
	public String sendEmail(HttpServletRequest request,String email) {
		
		HttpSession session = request.getSession();
		System.out.println(session);
		 
		mailService.mailSend(session, email);
		
		
		return "success";		
	}
	
	@RequestMapping("/checkToken.do")
	@ResponseBody
	public boolean checkToken(HttpServletRequest request, String email,String token) {
		HttpSession session = request.getSession();
		boolean result = mailService.checkToken(session,email,Integer.parseInt(token));
		return result;
	
	}
	
	
	
	
	
	
	
	
	
	
}
