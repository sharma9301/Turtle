package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.board.model.vo.Reviews;
import com.turtle.spring.member.model.vo.Member;
import com.turtle.spring.order.model.vo.Cart;
import com.turtle.spring.product.model.vo.Option;
import com.turtle.spring.product.model.vo.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> productList(SqlSessionTemplate session, int cPage, int numPerpage, Map param){
		return session.selectList("product.productList",param,
									new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public  List<Product> productCategoryList(SqlSessionTemplate session, Map param, int cPage, int numPerpage){
		return session.selectList("product.productCategoryList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int productListCount(SqlSessionTemplate session) {
		return session.selectOne("product.productListCount");
	}

	@Override
	public int productCategoryListCount(SqlSessionTemplate session,Map param) {
		return session.selectOne("product.productCategoryListCount",param);
	}
	
	@Override
	public Option productDetail(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.selectProductOne",pdCode);
	}

	@Override
	public List<Option> pdOptionSizeList(SqlSessionTemplate session, String pdCode) {
		return session.selectList("product.pdOptionSizeList",pdCode);
	}

	@Override
	public int pdOptionSizeCount(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.pdOptionSizeCount",pdCode);
	}

	@Override
	public List<Product> productSaleList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("product.productSaleList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public List<Product> productNewList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("product.productNewList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public List<Product> productBestList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("product.productBestList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int productSaleListCount(SqlSessionTemplate session) {
		return session.selectOne("product.productSaleListCount");
	}

	@Override
	public int productNewListCount(SqlSessionTemplate session) {
		return session.selectOne("product.productNewListCount");
	}

	@Override
	public int productBestListCount(SqlSessionTemplate session) {
		return session.selectOne("product.productBestListCount");
	}

	@Override
	public List<Product> productMainSaleList(SqlSessionTemplate session) {
		return session.selectList("product.productMainSaleList");
	}

	@Override
	public List<Reviews> selectReviews(SqlSessionTemplate session, String pdCode, int cPage, int numPerpage) {
		return session.selectList("product.selectReviews",pdCode,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int reviewsCount(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.reviewsCount",pdCode);
	}

	@Override
	public Member orderMember(SqlSessionTemplate session, String userId) {
		return session.selectOne("product.orderMember",userId);
	}

	@Override
	public Product productOrderDetail(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.productOrderDetail",pdCode);
	}

	@Override
	public List<Product> searchProduct(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectList("product.searchProduct",param);
	}

	@Override
	public int searchProductCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("product.searchProductCount",param);
	}

	@Override
	public int insertOrder(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("product.insertOrder",param);
	}

	@Override
	public int insertOrderDetail(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.insert("product.insertOrderDetail",param2);
	}

	@Override
	public List<Reviews> selectReviews2(SqlSessionTemplate session, String pdCode) {
		return session.selectList("product.selectReviews2",pdCode);
	}

	@Override
	public int reviewsSum(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.reviewsSum",pdCode);
	}

	@Override
	public double reviewsSum2(SqlSessionTemplate session, String pdCode) {
		return session.selectOne("product.reviewsSum2",pdCode);
	}

	@Override
	public int addCart(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("product.addCart",param);
	}

	@Override
	public int insertReviewEnd(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("product.insertReviewEnd",param);
	}

	@Override
	public int rvIs(SqlSessionTemplate session, int rvNo) {
		return session.update("product.rvIs",rvNo);
	}

	@Override
	public Cart selectCart(SqlSessionTemplate session, String optNo) {
		return session.selectOne("product.selectCart",optNo);
	}

	@Override
	public int updateAmount(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.update("product.updateAmount",param2);
	}

}
