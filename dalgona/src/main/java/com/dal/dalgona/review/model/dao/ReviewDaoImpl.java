package com.dal.dalgona.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public List<Review> selectReviewsTop8(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReviewsTop8");
	}

}
