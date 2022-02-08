package com.turtle.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Override
	public Member login(SqlSessionTemplate session, Map param) {
		return session.selectOne("member.selectMember",param);
	}
	
	@Override
	public Member myInfo(SqlSessionTemplate session, String userId) {
		return session.selectOne("member.selectMyInfo",userId);
	}
	
	@Override
	public int myInfoUpdate(SqlSessionTemplate session, Map param) {
		return session.update("member.myInfoUpdate",param);
	}
	
	@Override
	public int enrollEnd(SqlSessionTemplate session,Map param) {
		return session.insert("member.enrollEnd",param);
	}

	@Override
	public int userIdChk(SqlSessionTemplate session,String userId) {
		return session.selectOne("member.userIdChk",userId);
	}
	
}
