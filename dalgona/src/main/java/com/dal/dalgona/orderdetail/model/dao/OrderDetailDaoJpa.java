package com.dal.dalgona.orderdetail.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.OrderDetail;

@Repository
public interface OrderDetailDaoJpa extends JpaRepository<OrderDetail, Long>{
//	List<OrderDetail> findAll();
//	List<OrderDetail> findByOrderCode();
}
