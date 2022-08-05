package com.dal.dalgona.admin.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;

@Repository
public interface adminDao extends JpaRepository<Product, Integer> {
	List<Product> findAll();
}
