package com.dal.dalgona.option.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

@Repository
public interface OptionDao extends JpaRepository<ProductOption, Long> {

	List<ProductOption> findByProduct(Product p);
	
	List<ProductOption> save(Product p);
	
	Long deleteByProduct(Product p);
	
	
}