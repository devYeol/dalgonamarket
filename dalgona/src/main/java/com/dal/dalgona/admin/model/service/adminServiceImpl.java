package com.dal.dalgona.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.dal.dalgona.admin.model.dao.adminDao;
import com.dal.dalgona.category.model.dao.CategoryDao;
import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.option.model.dao.OptionDao;
import com.dal.dalgona.working.model.dao.PjeDao;

@Service
public class adminServiceImpl implements adminService{
	
	@Autowired
	adminDao dao;
	
	@Autowired
	PjeDao memberdao;
	
	/* 중언 */
	
	public List<Product> selectProducts() {
		return dao.findAll(Sort.by(Sort.Direction.DESC,"productCode"));
	}
	
	public Long deleteByProductCode(long productCode) {
		return dao.deleteByProductCode(productCode);
	}
	
	/*
	 * public void insertProduct(Product p) { dao.saveAndFlush(p); }
	 */
	
	public Page<Product> selectProducts(PageRequest pagerequest) {
		return dao.findAll(pagerequest);
	}
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return memberdao.findAll(pagerequest);
	}
	
	/* 원희 */
	@Autowired
	private SqlSessionTemplate session;

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
		Product result = dao.save(p);
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
	
	//productCode로 불러오기
	@Override
	public Product selectOneProduct(Long pro) {
		return dao.findByProductCode(pro);
	}

	@Override
	public Category selectOneCate(Product p) {
		return categoryDao.findByProducts(p);
	}

	@Override
	public ProductOption selectOneOption(Product p) {
		// TODO Auto-generated method stub
		return optionDao.findByProduct(p);
	}
}
