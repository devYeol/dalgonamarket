package com.dal.dalgona.product.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface ProductDaoJpa extends JpaRepository<Product, Long>{
}
