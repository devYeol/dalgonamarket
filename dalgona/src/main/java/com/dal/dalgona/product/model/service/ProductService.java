package com.dal.dalgona.product.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface ProductService {
	List<Product> selectProducts();
	
	Product selectProduct(long productCode);
	
	List<ProductOption> optionList(long productCode);
	
	List<Review> reviewList(long productCode);
	
	List<Qna> qnaList(long productCode);
	
	int reviewWrite(Review r);
	
	int qnaWrite(Qna q);
	
	Qna qnaSelectOne(long qnaCode);
	
	Review starAvg(long qnaCode);
	

}
