package com.dal.dalgona.working.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.working.model.dao.CategoryDao;
import com.dal.dalgona.working.model.dao.OptionDao;
import com.dal.dalgona.working.model.dao.RwhDao;

@Service
public class RwhServiceImpl implements RwhService {

	
	@Autowired
	private SqlSessionTemplate session;
	 

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

	// 상품등록
	@Override
	public Product insertProduct(Product p) {
		Product result = productDao.save(p);
		return result;
	}

	// 상품등록할때 추가해야할 옵션 집어넣기위해서 db에서 가져옴
	@Override
	public List<ProductOption> insertProduct(List<ProductOption> options) {
		return optionDao.saveAll(options);
	}

	// category안에 있는 내용물 가져옴
	@Override
	public Category selectCategory(String categoryName) {
		return categoryDao.findByCategoryName(categoryName);
	}

	@Override
	public List<Product> productList() {
		return productDao.findAll();
	}
	
	
	

}
