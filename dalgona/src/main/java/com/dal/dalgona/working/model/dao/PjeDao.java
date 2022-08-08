package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface PjeDao extends JpaRepository<Product, Integer> {
	Product saveAndFlush(Product p);
	
	List<Product> findAll();
}
