package com.dal.dalgona.productorder.model.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.dal.dalgona.common.model.vo.ProductOrder;

public interface ProductOrderJpa extends JpaRepository<ProductOrder, Long>{
	List<ProductOrder> findAll();
	// Page<ProductOrder> findByOrderStatus(PageRequest pageRequest);
	ProductOrder findByOrderCode(Long orderCode);
	ProductOrder save(ProductOrder poUp);
	long count();
	long countByOrderStatus(String orderStatus);
}
