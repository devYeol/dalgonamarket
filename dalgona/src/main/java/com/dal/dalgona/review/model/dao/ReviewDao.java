package com.dal.dalgona.review.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dal.dalgona.common.model.vo.Review;

public interface ReviewDao extends JpaRepository<Review, Long>{
	List<Review> findAll();
}
