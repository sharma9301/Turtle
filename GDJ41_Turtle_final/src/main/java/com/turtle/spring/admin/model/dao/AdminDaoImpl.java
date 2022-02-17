package com.turtle.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Order;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectMemberList",param);
	}

	@Override
	public List<Product> selectProductList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectProductList",param);
	}

	@Override
	public List<Option> selectProductOptList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectProductOptList",param);
	}
	
	@Override
	public List<Order> selectOrderList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectOrderList",param);
	}
	
	@Override
	public List<Reviews> selectReviewsList(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectReviewsList",param);
	}
	
	@Override
	public int selectProductCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectProductCount",param);
	}

	@Override
	public int selectProductOptCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectProductOptCount",param);
	}
	
	@Override
	public int selectOrderCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectOrderCount",param);
	}
	
	@Override
	public int selectReviewsCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectReviewsCount",param);
	}
	
	@Override
	public int insertProduct(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProduct",param);
	}

	@Override
	public int insertProductOpt(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProductOpt",param);
	}

	@Override
	public int selectProductCodeCheck(SqlSessionTemplate session, String productCode){
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectProductCodeCheck",productCode);
	}

	@Override
	public int updateProduct(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProduct",param);
	}

	@Override
	public int deleteProduct(SqlSessionTemplate session, String pd_Code) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteProduct",pd_Code);
	}

	@Override
	public int updateStock(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateStock",param);
	}

	@Override
	public int deleteProductOption(SqlSessionTemplate session, String opt_No) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteProductOption",opt_No);
	}

	@Override
	public int updateInvoice(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateInvoice",param);
	}

	@Override
	public int updateStatus(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateStatus",param);
	}

	

	

	

	

	

	
}
