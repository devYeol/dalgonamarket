package com.dal.dalgona.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface RwhDao  extends JpaRepository<Product, Long>{
	
	 Product save( Product p); 
	
	
}
