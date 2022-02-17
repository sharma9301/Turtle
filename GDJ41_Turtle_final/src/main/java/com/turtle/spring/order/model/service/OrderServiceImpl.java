package com.turtle.spring.order.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.order.model.dao.OrderDao;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<OrderDetail> selectODList(String userId) {
		return dao.selectODList(session,userId);
	}

	@Override
	public List stList(String userId) {
		return dao.stList(session,userId);
	}
	
	
	@Override
	public List<Product> selectPDList(Map param) {
		return dao.selectPDList(session,param);
	}

	
	
	@Override
	public List selectFirst(String userId) {
		return dao.selectFirst(session,userId);
	}


	@Override
	public int refundRequest(String orderNo) {
		return dao.refundRequest(session,orderNo);
	}
	
	@Override
	public int orderCancel(String orderNo) {
		return dao.orderCancel(session,orderNo);
	}

	@Override
	public List<Cart> selectCart(String userId) {
		return dao.selectCart(session,userId);
	}

	@Override
	public int updateCart(Map param) {
		return dao.updateCart(session,param);
	}


	
	
	
	
	
	
	
	
	
	
	
}
