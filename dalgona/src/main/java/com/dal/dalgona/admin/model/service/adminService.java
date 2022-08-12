package com.dal.dalgona.admin.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

public interface adminService {

	Product insertProduct(Product p);
	
	List<ProductOption> insertProduct(List<ProductOption> options); 
	
	Product selectOneProduct(Long pro);
	
	List<ProductOption> selectOneOption(Product p);
	
	Product updateProduct(Product po);
	
	List<ProductOption> updateOption(Product p);
}
