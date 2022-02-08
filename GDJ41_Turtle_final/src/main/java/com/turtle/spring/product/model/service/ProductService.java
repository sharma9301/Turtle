package com.turtle.spring.product.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface ProductService {

	List<Product> productList(int cPage, int numPerpage,Map param);

	List<Product> productCategoryList(Map param, int cPage, int numPerpage);

	int productListCount();

	int productCategoryListCount(Map param);

	Option productDetail(String pdCode);

	List<Option> pdOptionSizeList(String pdCode);

	int pdOptionSizeCount(String pdCode);

	List<Product> productSaleList(int cPage, int numPerpage);

	List<Product> productNewList(int cPage, int numPerpage);

	List<Product> productBestList(int cPage, int numPerpage);

	int productSaleListCount();
	
	int productNewListCount();
	
	int productBestListCount();

//	index페이지용 
	List<Product> productMainSaleList();

	List<Reviews> selectReivews(String pdCode);
}
