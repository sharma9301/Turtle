package com.turtle.spring.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

public interface OrderDao {
	
	List<OrderDetail> selectODList(SqlSessionTemplate session,String userId);
	
	List<Product> selectPDList(SqlSessionTemplate session,String orderNo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
