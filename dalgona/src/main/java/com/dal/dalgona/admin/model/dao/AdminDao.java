package com.dal.dalgona.admin.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface AdminDao extends JpaRepository<Product, Long> {
	List<Product> findAll();
	
	@Transactional
	Long deleteByProductCode(long productCode);
	
	Product saveAndFlush(Product p);
	
	Product save(Product p); 
		
	Product findByProductCode(Long pro);
	
}
