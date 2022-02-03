package com.turtle.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.admin.model.dao.AdminDao;
import com.turtle.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> selectMemberList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,param);
	}
	
	
}
