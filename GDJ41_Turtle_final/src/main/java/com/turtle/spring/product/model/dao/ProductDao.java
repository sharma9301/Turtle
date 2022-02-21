package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface ProductDao {

	List<Product> productList(SqlSessionTemplate session,int cPage, int numPerpage, Map param);

	List<Product> productCategoryList(SqlSessionTemplate session, Map param,int cPage, int numPerpage);

	int productListCount(SqlSessionTemplate session);

	int productCategoryListCount(SqlSessionTemplate session, Map param);

	Option productDetail(SqlSessionTemplate session, String pdCode);

	List<Option> pdOptionSizeList(SqlSessionTemplate session, String pdCode);

	int pdOptionSizeCount(SqlSessionTemplate session, String pdCode);

	List<Product> productSaleList(SqlSessionTemplate session, int cPage, int numPerpage);

	List<Product> productNewList(SqlSessionTemplate session, int cPage, int numPerpage);

	List<Product> productBestList(SqlSessionTemplate session, int cPage, int numPerpage);

	int productSaleListCount(SqlSessionTemplate session);

	int productNewListCount(SqlSessionTemplate session);

	int productBestListCount(SqlSessionTemplate session);

	List<Product> productMainSaleList(SqlSessionTemplate session);

	List<Reviews> selectReviews(SqlSessionTemplate session, String pdCode, int cPage, int numPerpage);

	int reviewsCount(SqlSessionTemplate session, String pdCode);

	Member orderMember(SqlSessionTemplate session, String userId);

	Product productOrderDetail(SqlSessionTemplate session, String pdCode);

	List<Product> searchProduct(SqlSessionTemplate session, Map<String, Object> param);

	int searchProductCount(SqlSessionTemplate session, Map<String, Object> param);

	int insertOrder(SqlSessionTemplate session, Map<String, Object> param);

	int insertOrderDetail(SqlSessionTemplate session, Map<String, Object> param2);

	List<Reviews> selectReviews2(SqlSessionTemplate session, String pdCode);

	int reviewsSum(SqlSessionTemplate session, String pdCode);

	double reviewsSum2(SqlSessionTemplate session, String pdCode);
	
}
