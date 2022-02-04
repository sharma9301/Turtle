package com.turtle.spring.member.model.service;

import java.util.Map;

import com.turtle.spring.member.model.vo.Member;

public interface MemberService {
	
	Member login(Map param);
	
	Member myInfo(String userId);
	
	
	
	
	
	
	
	
}
