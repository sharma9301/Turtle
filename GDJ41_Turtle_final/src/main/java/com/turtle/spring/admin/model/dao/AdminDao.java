package com.turtle.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, Map<String, Object> param);

	List<Product> selectProductList(SqlSessionTemplate session, Map<String, Object> param);

	List<Option> selectProductOptList(SqlSessionTemplate session, Map<String, Object> param);

	List<Order> selectOrderList(SqlSessionTemplate session, Map<String, Object> param);

	List<Reviews> selectReviewsList(SqlSessionTemplate session, Map<String, Object> param);
	
	List selectStatusList(SqlSessionTemplate session);
	
	int selectProductCount(SqlSessionTemplate session, Map<String, Object> param);

	int selectProductOptCount(SqlSessionTemplate session, Map<String, Object> param);
	
	int selectOrderCount(SqlSessionTemplate session, Map<String, Object> param);

	int selectReviewsCount(SqlSessionTemplate session, Map<String, Object> param);

	int insertProduct(SqlSessionTemplate session, Map<String, Object> param);

	int insertProductOpt(SqlSessionTemplate session, Map<String, Object> param);

	int selectProductCodeCheck(SqlSessionTemplate session, String productCode);

	int updateProduct(SqlSessionTemplate session, Map<String, Object> param);

	int deleteProduct(SqlSessionTemplate session, String pd_Code);

	int updateStock(SqlSessionTemplate session, Map<String, Object> param);

	int deleteProductOption(SqlSessionTemplate session, String opt_No);

	int updateInvoice(SqlSessionTemplate session, Map<String, Object> param);

	int updateStatus(SqlSessionTemplate session, Map<String, Object> param);

	



	

	


	
}
