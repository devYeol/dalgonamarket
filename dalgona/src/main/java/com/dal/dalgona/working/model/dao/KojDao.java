package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface KojDao {
	
	Product selectProduct(SqlSession session, long productCode);
	
	List<Review> reviewList(SqlSession session);
	
	List<Qna> qnaList(SqlSession session);

}
