package com.dal.dalgona.admin.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface adminDao extends JpaRepository<Product, Long> {
	List<Product> findAll();
	
	/* 중언 */
	
	@Transactional
	Long deleteByProductCode(long productCode);
	
	Product saveAndFlush(Product p);
	
	/* 원희 */
	
	Product save(Product p); 
		
	Product findByProductCode(Long pro);
	 
}
