package com.dal.dalgona.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public double starAvg(SqlSession session, long qnaCode) {
		// TODO Auto-generated method stub
		return session.selectOne("review.starAvg",qnaCode);
	}

	//상품검색
	public List<Product> searchList(SqlSession session, String keyword){
		System.out.println("searchList ::" + keyword);
		return session.selectList("product.searchProduct",keyword);
	}

	@Override
	public Long deleteByProduct(Product p) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void addLikes(SqlSession session,Map<String, Object> map) {
		session.insert("likes.addLikes", map);
		
	}

	@Override
	public void deleteLikes(SqlSession session,Map<String, Object> map) {
		session.insert("likes.deleteLikes", map);
		
	}

	@Override
	public int selLikes(SqlSession session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selLikes", map);
	}

	@Override
	public int likesCount(SqlSession session, long productCode) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.likesCount", productCode);
	}

	@Override
	public long deleteByReviewCode(SqlSession session, long reviewCode) {
		// TODO Auto-generated method stub
		return session.delete("review.delReview",reviewCode);
	}

	@Override
	public Review selectOneReview(SqlSession session, long reviewCode) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectOneReview",reviewCode);
	}

	@Override
	public int updateReview(SqlSession session, Review review) {
		// TODO Auto-generated method stub
		return session.update("review.updateReview",review);
	}

	@Override
	public int deleteByProductOption(SqlSession session,long ppp) {
		return session.delete("productOption.deleteOption", ppp);
	}
	
	
	/*
	 * @Override public int insertOptionCode(SqlSession session, ProductOption
	 * option) { return session.insert("productOption.insertOption", option); }
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
}
