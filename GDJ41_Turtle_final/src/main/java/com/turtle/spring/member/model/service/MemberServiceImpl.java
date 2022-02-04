package com.turtle.spring.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.member.model.dao.MemberDao;
import com.turtle.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	
	
	
	
	
	
	
}
