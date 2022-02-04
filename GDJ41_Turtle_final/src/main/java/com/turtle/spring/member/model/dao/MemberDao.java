package com.turtle.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.member.model.vo.Member;

public interface MemberDao {
	
	Member login(SqlSessionTemplate session, Map param);
	
	Member myInfo(SqlSessionTemplate session, String userId);
	
}
