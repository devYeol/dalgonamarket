package com.dal.dalgona.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dal.dalgona.admin.model.dao.adminDao;
import com.dal.dalgona.common.model.vo.Product;

@Service
public class adminService {
	@Autowired
	adminDao dao;
	
//	public Page<Product> selectProducts(PageRequest pageRequest) {
//		return dao.findAll(pageRequest);
//	}
	
	public Long deleteByProductCode(long productCode) {
		return dao.deleteByProductCode(productCode);
	}
}
