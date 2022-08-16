package com.dal.dalgona.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;


@Repository
public class ProductDaoImpl implements ProductDao {
	@Override
	public List<Product> selectProducts(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProducts");
	}
	
	@Override
	public Product selectProduct(SqlSession session,long productCode) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProduct",productCode);
	}
	

	@Override
	public List<ProductOption> optionList(SqlSession session, long productCode) {
		// TODO Auto-generated method stub
		return session.selectList("productOption.selectOption",productCode);
	}

	@Override
	public List<Review> reviewList(SqlSession session,long productCode) {
		// TODO Auto-generated method stub
		return session.selectList("review.reviewList",productCode);
	}

	@Override
	public List<Qna> qnaList(SqlSession session,long productCode) {
		// TODO Auto-generated method stub
		return session.selectList("qna.qnaList",productCode);
	}

	@Override
	public int reviewWrite(SqlSession session, Review r) {
		// TODO Auto-generated method stub
		return session.insert("review.insertReview",r);
	}

	@Override
	public int qnaWrite(SqlSession session, Qna q) {
		// TODO Auto-generated method stub
		return session.insert("qna.insertQna",q);
	}

	@Override
	public Qna qnaSelectOne(SqlSession session, long qnaCode) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQna",qnaCode);
	}

	@Override
	public Review starAvg(SqlSession session, long qnaCode) {
		// TODO Auto-generated method stub
		return session.selectOne("review.starAvg",qnaCode);
	}
	
	
	
}
