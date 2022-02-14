package com.turtle.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.member.model.dao.MemberDao;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public Member login(Map param) {
		return dao.login(session,param);
	}
	
	@Override
	public Member myInfo(String userId) {
		return dao.myInfo(session,userId);
	}
	
	@Override
	public int myInfoUpdate(Map param) {
		return dao.myInfoUpdate(session,param);
	}
	
	@Override
	public int enrollEnd(Map param) {
		return dao.enrollEnd(session,param);
	}

	@Override
	public int userIdChk(String userId) {
		return dao.userIdChk(session,userId);
	}
	
	//@Override
	//public int deleteEnd(Map param) {
	//	return dao.deleteEnd(session,param);
	//}
	
	
	
	
	
	
	
	
	
	
}
