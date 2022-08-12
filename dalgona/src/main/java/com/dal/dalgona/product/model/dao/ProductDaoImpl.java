package com.dal.dalgona.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;


@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Override
	public Product selectProduct(SqlSession session,long productCode) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProduct",productCode);
	}

	@Override
	public List<Review> reviewList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("review.reviewList");
	}

	@Override
	public List<Qna> qnaList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("qna.qnaList");
	}

	@Override
	public int reviewWrite(SqlSession session, Review r) {
		// TODO Auto-generated method stub
		return session.insert("review.insertreview",r);
	}


	
	
}
