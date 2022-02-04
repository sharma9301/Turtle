package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.product.model.vo.Product;

public interface ProductDao {

	List<Product> productList(SqlSessionTemplate session,int cPage, int numPerpage);

	List<Product> productCategoryList(SqlSessionTemplate session, Map param,int cPage, int numPerpage);

	int productListCount(SqlSessionTemplate session);

	int productCategoryListCount(SqlSessionTemplate session, Map param);

	Product productDetail(SqlSessionTemplate session, String pcCode);
	
}
