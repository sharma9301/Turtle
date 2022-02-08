package com.turtle.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.admin.model.dao.AdminDao;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Product;

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

	@Override
	public List<Product> selectProductList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectProductList(session,param);
	}
	
	@Override
	public List<Product> selectProductOptList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectProductOptList(session,param);
	}

	@Override
	public int selectProductCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectProductCount(session,param);
	}

	@Override
	public int selectProductOptCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectProductOptCount(session,param);
	}
	
	@Override
	public int insertProduct(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.insertProduct(session,param);
	}

	@Override
	public int insertProductOpt(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.insertProductOpt(session,param);
	}

	@Override
	public int selectProductCodeCheck(String productCode) {
		// TODO Auto-generated method stub
		return dao.selectProductCodeCheck(session,productCode);
	}

	
	
	
}
