package com.dal.dalgona.admin.model.dao;

import javax.transaction.Transactional;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface adminDao extends JpaRepository<Product, Long> {
//	Page<Product> findAll(Pageable pagable);
	
	@Transactional
	Long deleteByProductCode(long productCode);
}
