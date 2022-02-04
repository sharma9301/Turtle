package com.turtle.spring.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.product.model.dao.ProductDao;
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
	public List<Product> productList(int cPage, int numPerpage){
		List<Product> list=dao.productList(session ,cPage, numPerpage);
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
	public Product productDetail(String pcCode) {
		return dao.productDetail(session, pcCode);
	}
	
}
