package com.turtle.spring.product.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface ProductService {

	List<Product> productList(int cPage, int numPerpage);

	List<Product> productCategoryList(Map param, int cPage, int numPerpage);

	int productListCount();

	int productCategoryListCount(Map param);

	Product productDetail(String pdCode);

	List<Option> pdOptionSizeList(String pdCode);

	int pdOptionSizeCount(String pdCode);

}
