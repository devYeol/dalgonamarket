package com.dal.dalgona.admin.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

public interface adminService {

	Product insertProduct(Product p);
	
	List<ProductOption> insertProduct(List<ProductOption> options); 
	
//	Category selectCategory(String categoryName);
//	
//	Category insertCategory(Category cate);
	
	Product selectOneProduct(Long pro);
	
//	Category selectOneCate(Product p);
	
	ProductOption selectOneOption(Product p);
}
