package com.dal.dalgona.working.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

@Service
public interface RwhService {
	
	
	List<ProductOption> insertProduct(List<ProductOption> options); 
	
	Product insertProduct(Product p);
	
	Category selectCategory(String categoryName);
	
	Category insertCategory(Category cate);
	
	
}
