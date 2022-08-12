package com.dal.dalgona.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface ProductDao {

	Product selectProduct(SqlSession session, long productCode);
	
	List<Review> reviewList(SqlSession session);
	
	List<Qna> qnaList(SqlSession session);
	
	int reviewWrite(SqlSession session,Review r);
	
	

}
