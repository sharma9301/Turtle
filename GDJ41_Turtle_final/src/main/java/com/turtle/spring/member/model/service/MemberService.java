package com.turtle.spring.member.model.service;

import java.util.Map;

import com.turtle.spring.member.model.vo.Member;

public interface MemberService {
	
	Member login(Map param);
	
	Member myInfo(String userId);
	
	int myInfoUpdate(Map param);
	
	int enrollEnd(Map param);
	
	int userIdChk(String userId);
	
	
	
	
	
	
}
