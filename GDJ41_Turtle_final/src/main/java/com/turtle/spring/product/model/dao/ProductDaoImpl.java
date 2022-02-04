package com.turtle.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.turtle.spring.product.model.vo.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> productList(SqlSessionTemplate session, int cPage, int numPerpage){
		return session.selectList("product.productList",null,
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
	public Product productDetail(SqlSessionTemplate session, String pcCode) {
		return session.selectOne("product.selectProductOne",pcCode);
	}
}
