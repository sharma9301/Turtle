package com.turtle.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectMemberList",param);
	}

	@Override
	public List<Product> selectProductList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectProductList",param);
	}

	@Override
	public int selectProductCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectProductCount",param);
	}

	
}
