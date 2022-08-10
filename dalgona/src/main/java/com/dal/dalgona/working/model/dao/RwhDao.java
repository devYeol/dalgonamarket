package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface RwhDao  extends JpaRepository<Product, Long>{
	
	 Product save(Product p); 
	
	 Product findByProductCode(Long pro);
	 
//	 Product save();
//	 List<Product> findAll();
	
	
}
