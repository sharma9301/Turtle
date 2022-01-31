package com.turtle.spring.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.product.model.vo.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> productList(SqlSessionTemplate session){
		return session.selectList("product.productList");
	}
	
}
