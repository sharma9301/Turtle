package com.turtle.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, Map<String, Object> param);

	List<Product> selectProductList(SqlSessionTemplate session, Map<String, Object> param);
	
}
