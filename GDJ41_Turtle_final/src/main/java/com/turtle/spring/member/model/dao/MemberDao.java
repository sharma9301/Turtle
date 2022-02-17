package com.turtle.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;

public interface MemberDao {
	
	Member login(SqlSessionTemplate session, Map param);
	
	Member myInfo(SqlSessionTemplate session, String userId);
	
	int myInfoUpdate(SqlSessionTemplate session, Map param);

	int enrollEnd(SqlSessionTemplate session,Map param);

	int userIdChk(SqlSessionTemplate session, String userId);
	
	int deleteMember(SqlSessionTemplate session, String userId);

	















}