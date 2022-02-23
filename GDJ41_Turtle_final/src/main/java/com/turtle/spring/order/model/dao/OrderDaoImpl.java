package com.turtle.spring.order.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.order.model.vo.Cart;
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
	public List stList(SqlSessionTemplate session,String userId) {
		return session.selectList("order.stList",userId);
	}
	
	@Override
	public List<Product> selectPDList(SqlSessionTemplate session,Map param) {
		log.debug("{}"+session.selectList("order.selectPDList",param));
		return session.selectList("order.selectPDList",param);
	}
	

	@Override
	public List selectFirst(SqlSessionTemplate session, String userId) {
		return session.selectList("order.selectFirst",userId);
	}
	
	@Override
	public int refundRequest(SqlSessionTemplate session, String orderNo) {
		return session.update("order.refundRequest",orderNo);
	}

	@Override
	public int orderCancel(SqlSessionTemplate session, String orderNo) {
		return session.update("order.orderCancel",orderNo);
	}

	@Override
	public List<Cart> selectCart(SqlSessionTemplate session, String userId) {
		return session.selectList("order.selectCart",userId);
	}
	
	@Override
	public int updateCart(SqlSessionTemplate session, Map param) {
		return session.update("order.updateCart",param);
	}

	@Override
	public List<Reviews> selectReviews (SqlSessionTemplate session, String userId) {
		return session.selectList("order.selectReviews",userId);
	}	
	
	@Override
	public List<OrderDetail> selectNotYet (SqlSessionTemplate session, String userId) {
		return session.selectList("order.selectNotYet",userId);
	}	
	
	@Override
	public int deleteRv (SqlSessionTemplate session, int detailNo) {
		return session.delete("order.deleteRv",detailNo);
	}
	
	@Override
	public int updateRvYn (SqlSessionTemplate session, int detailNo) {
		return session.update("order.updateRvYn",detailNo);
	}

	@Override
	public int deleteCart(SqlSessionTemplate session, int cartNo) {
		return session.delete("order.deleteCart",cartNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
