package com.dal.dalgona.working.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.ProductOption;

@Repository
public interface OptionDao extends JpaRepository<ProductOption, Long> {

}
