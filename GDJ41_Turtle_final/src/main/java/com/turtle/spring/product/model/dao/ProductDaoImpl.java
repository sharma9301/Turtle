package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.board.model.vo.Reviews;
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
	public List<Reviews> selectReivews(SqlSessionTemplate session, String pdCode) {
		return session.selectList("product.selectReivews",pdCode);
	}
}
