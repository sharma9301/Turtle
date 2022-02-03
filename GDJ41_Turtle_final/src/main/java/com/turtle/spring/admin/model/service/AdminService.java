package com.turtle.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMemberList(Map<String, Object> param);

}
