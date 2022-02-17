package com.turtle.spring.order.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

public interface OrderDao {
	
	
	List<OrderDetail> selectODList(SqlSessionTemplate session,String userId);

	List stList(SqlSessionTemplate session,String userId);
	
	List<Product> selectPDList(SqlSessionTemplate session,Map param);
	
	List selectFirst(SqlSessionTemplate session,String userId);
	
	int refundRequest(SqlSessionTemplate session,String orderNo);
	
	int orderCancel(SqlSessionTemplate session,String orderNo);

	List<Cart> selectCart(SqlSessionTemplate session,String userId);
	
	int updateCart(SqlSessionTemplate session,Map param);
	
	
	
	
	
	
	
	
	
	
	
}
