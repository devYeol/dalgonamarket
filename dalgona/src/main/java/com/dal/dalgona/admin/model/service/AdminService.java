package com.dal.dalgona.admin.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface AdminService {

	Product insertProduct(Product p);
	
	List<ProductOption> insertProduct(List<ProductOption> options); 
	
	Product selectOneProduct(Long pro);
	
	List<ProductOption> selectOneOption(Product p);
	
	Product updateProduct(Product po);
	
	List<ProductOption> updateOption(List<ProductOption> list);
	
	List<Review> selectReviewsTop8();
	
	List<Qna> selectQnasTop8();
}
