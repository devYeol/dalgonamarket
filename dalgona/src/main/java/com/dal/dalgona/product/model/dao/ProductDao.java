package com.dal.dalgona.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface ProductDao {
	List<Product> selectProducts(SqlSession session);
	
	Product selectProduct(SqlSession session, long productCode);
	
	List<ProductOption> optionList(SqlSession session, long productCode);
	
	List<Review> reviewList(SqlSession session,long productCode);
	
	List<Qna> qnaList(SqlSession session,long productCode);
	
	int reviewWrite(SqlSession session,Review r);
	
	int qnaWrite(SqlSession session,Qna q);
	
	Qna qnaSelectOne(SqlSession session,long qnaCode);
	
	Review starAvg(SqlSession session,long qnaCode);
	
	

}
