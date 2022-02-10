package com.turtle.spring.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.dao.ProductDao;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Product> productList(int cPage, int numPerpage,Map param){
		List<Product> list=dao.productList(session ,cPage, numPerpage,param);
		return list;
	}
	
	@Override
	public List<Product> productCategoryList(Map param,int cPage, int numPerpage){
		List<Product> list=dao.productCategoryList(session,param,cPage, numPerpage);
		return list;
	}
	
	@Override
	public int productListCount() {
		return dao.productListCount(session);
	}
	
	@Override
	public int productCategoryListCount(Map param) {
		return dao.productCategoryListCount(session,param);
	}
	
	@Override
	public Option productDetail(String pdCode) {
		return dao.productDetail(session, pdCode);
	}

	@Override
	public List<Option> pdOptionSizeList(String pdCode) {
		return dao.pdOptionSizeList(session,pdCode);
	}

	@Override
	public int pdOptionSizeCount(String pdCode) {
		return dao.pdOptionSizeCount(session,pdCode);
	}

	@Override
	public List<Product> productSaleList(int cPage, int numPerpage) {
		return dao.productSaleList(session, cPage, numPerpage);
	}

	@Override
	public List<Product> productNewList(int cPage, int numPerpage) {
		return dao.productNewList(session, cPage, numPerpage);
	}

	@Override
	public List<Product> productBestList(int cPage, int numPerpage ) {
		return dao.productBestList(session, cPage, numPerpage);
	}
	
	@Override
	public int productSaleListCount() {
		return dao.productSaleListCount(session);
	}
	
	@Override
	public int productNewListCount() {
		return dao.productNewListCount(session);
	}
	
	@Override
	public int productBestListCount() {
		return dao.productBestListCount(session);
	}

	@Override
	public List<Product> productMainSaleList() {
		return dao.productMainSaleList(session);
	}

	@Override
	public List<Reviews> selectReivews(int cPage, int numPerpage, String pdCode) {
		return dao.selectReivews(session,pdCode,cPage, numPerpage);
	}

	@Override
	public int reviewsCount(String pdCode) {
		return dao.reviewsCount(session,pdCode);
	}

	@Override
	public Member orderMember(String userId) {
		return dao.orderMember(session, userId);
	}

	@Override
	public Product productOrderDetail(String pdCode) {
		return dao.productOrderDetail(session, pdCode);
	}
	
}
