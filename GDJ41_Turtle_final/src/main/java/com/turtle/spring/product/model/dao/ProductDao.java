package com.turtle.spring.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.product.model.vo.Product;

public interface ProductDao {

	List<Product> productList(SqlSessionTemplate session);
	
}
