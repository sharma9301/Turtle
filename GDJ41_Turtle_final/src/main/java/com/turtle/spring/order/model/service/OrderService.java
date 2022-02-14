package com.turtle.spring.order.model.service;

import java.util.List;

import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

public interface OrderService {

	List<OrderDetail> selectODList(String userId);
	
	List<Product> selectPDList(String orderNo);
	
	
	
	
	
	
	
	
	
}
