package com.dal.dalgona.working.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.dao.PjeDao;

@Service
public class PjeService {
	@Autowired
	private PjeDao dao;
	
	public void insertProduct(Product p) {
		dao.saveAndFlush(p);
	}
}
