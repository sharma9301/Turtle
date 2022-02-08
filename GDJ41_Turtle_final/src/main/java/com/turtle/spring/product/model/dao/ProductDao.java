package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface ProductDao {

	List<Product> productList(SqlSessionTemplate session,int cPage, int numPerpage);

	List<Product> productCategoryList(SqlSessionTemplate session, Map param,int cPage, int numPerpage);

	int productListCount(SqlSessionTemplate session);

	int productCategoryListCount(SqlSessionTemplate session, Map param);

	Product productDetail(SqlSessionTemplate session, String pdCode);

	List<Option> pdOptionSizeList(SqlSessionTemplate session, String pdCode);

	int pdOptionSizeCount(SqlSessionTemplate session, String pdCode);

	List<Product> productSaleList(SqlSessionTemplate session, int cPage, int numPerpage);

	List<Product> productNewList(SqlSessionTemplate session, int cPage, int numPerpage);

	List<Product> productBestList(SqlSessionTemplate session, int cPage, int numPerpage);

	int productSaleListCount(SqlSessionTemplate session);

	int productNewListCount(SqlSessionTemplate session);

	int productBestListCount(SqlSessionTemplate session);

	List<Product> productMainSaleList(SqlSessionTemplate session);
	
}
