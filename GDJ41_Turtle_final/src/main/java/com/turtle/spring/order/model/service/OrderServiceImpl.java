package com.turtle.spring.order.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.spring.order.model.dao.OrderDao;
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
	public List<Product> selectPDList(String orderNo) {
		return dao.selectPDList(session,orderNo);
	}
	
	
	
	
	
	
	
	
	
	
	
}
