package com.turtle.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface AdminService {

	List<Member> selectMemberList(Map<String, Object> param);

	List<Product> selectProductList(Map<String, Object> param);

	List<Option> selectProductOptList(Map<String, Object> param);
	
	List<Order> selectOrderList(Map<String, Object> param);
	
	List<Reviews> selectReviewsList(Map<String, Object> param);

	List selectStatusList();

	int selectProductCount(Map<String, Object> param);

	int selectProductOptCount(Map<String, Object> param);

	int selectOrderCount(Map<String, Object> param);

	int selectReviewsCount(Map<String, Object> param);
	
	int insertProduct(Map<String, Object> param);
	
	int insertProductOpt(Map<String, Object> param);

	int selectProductCodeCheck(String productCode);

	int updateProduct(Map<String, Object> param);

	int deleteProduct(String pd_Code);

	int updateStock(Map<String, Object> param);

	int deleteProductOption(String opt_No);

	int updateInvoice(Map<String, Object> param);

	int updateStatus(Map<String, Object> param);

	int updateReviewIsImage(Map<String, Object> param);




	



}
