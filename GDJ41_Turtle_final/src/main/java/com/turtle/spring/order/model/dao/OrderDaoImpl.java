package com.turtle.spring.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.order.model.vo.OrderDetail;
import com.turtle.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class OrderDaoImpl implements OrderDao {

	@Override
	public List<OrderDetail> selectODList(SqlSessionTemplate session,String userId) {
		return session.selectList("order.selectODList",userId);
	}
	
	
	@Override
	public List<Product> selectPDList(SqlSessionTemplate session,String orderNo) {
		log.debug("{}"+session.selectList("order.selectPDList",orderNo));
		return session.selectList("order.selectODList",orderNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
