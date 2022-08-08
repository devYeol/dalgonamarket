package com.dal.dalgona.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.dal.dalgona.admin.model.dao.adminDao;
import com.dal.dalgona.common.model.vo.Product;

@Service
public class adminService {
	@Autowired
	adminDao dao;
	
	public List<Product> selectProducts() {
		return dao.findAll(Sort.by(Sort.Direction.DESC,"productCode"));
	}
	
	public Long deleteByProductCode(long productCode) {
		return dao.deleteByProductCode(productCode);
	}
}
