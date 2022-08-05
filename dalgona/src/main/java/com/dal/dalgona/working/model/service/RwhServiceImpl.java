package com.dal.dalgona.working.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.working.model.dao.CategoryDao;
import com.dal.dalgona.working.model.dao.OptionDao;
import com.dal.dalgona.working.model.dao.RwhDao;

@Service
public class RwhServiceImpl implements RwhService{
	
	@Autowired
	private RwhDao productDao;
	
	@Autowired
	private OptionDao optionDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public Category insertCategory(Category cate) {
		return categoryDao.save(cate);
	}
	
	@Override
	public Product insertProduct(Product p) {
		return productDao.save(p);
	}
	
	@Override
	public List<ProductOption> insertProduct(List<ProductOption> options){
		
		return optionDao.saveAll(options);
	}
	
	@Override
	public Category selectCategory(String categoryName){
		return categoryDao.findByCategoryName(categoryName);
	}
	
}
