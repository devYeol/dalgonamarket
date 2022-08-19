package com.dal.dalgona.option.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

@Repository
public interface OptionDao extends JpaRepository<ProductOption, Long> {

	List<ProductOption> findByProduct(Product p);
	
	List<ProductOption> save(Product p);
	
	List<ProductOption> save(List<ProductOption> options);
//	List<ProductOption> findByProduct(List<ProductOption> list);
	
	//Long deleteByProduct(Product p);
	
//	@Query("delete from ProductOption p  WHERE p.product=:ppp")
//	Long deleteByProductOption(Product ppp);
}