package com.turtle.spring.order.model.service;

import java.util.List;
import java.util.Map;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

public interface OrderService {

	
	  
	List<OrderDetail> selectODList(String userId);
	List stList(String userId);
	
	List<Product> selectPDList(Map param);
	
	List selectFirst(String userId);
	
	int refundRequest(String orderNo);
	
	int orderCancel(String orderNo);
	
	List<Cart> selectCart(String userId);
	
	int updateCart(Map param);
	
	List<Reviews> selectReviews(String userId);

	List<OrderDetail> selectNotYet(String userId);

	int deleteRv(int detailNo);

	int updateRvYn(int detailNo);

	
	
}
