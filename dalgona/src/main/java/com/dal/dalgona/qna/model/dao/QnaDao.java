package com.dal.dalgona.qna.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;

@Repository
public interface QnaDao extends JpaRepository<Qna, Long>{
	
	Long deleteByProduct(Product p);
}
