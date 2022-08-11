package com.dal.dalgona.option.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

@Repository
public interface OptionDao extends JpaRepository<ProductOption, Long> {

	ProductOption findByProduct(Product p);
}
