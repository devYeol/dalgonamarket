package com.dal.dalgona.working.model.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dal.dalgona.common.model.vo.ProductOrder;

public interface ProductOrderJpa extends JpaRepository<ProductOrder, Long>{
	List<ProductOrder> findAll();
	ProductOrder findByOrderCode(Long orderCode);
	ProductOrder save(ProductOrder poUp);
}
