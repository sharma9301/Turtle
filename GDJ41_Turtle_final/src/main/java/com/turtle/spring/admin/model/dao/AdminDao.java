package com.turtle.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, Map<String, Object> param);
	
}
