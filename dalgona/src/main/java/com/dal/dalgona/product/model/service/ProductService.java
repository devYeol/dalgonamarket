package com.dal.dalgona.product.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface ProductService {
	
	Product selectProduct(long productCode);
	
	List<Review> reviewList();
	
	List<Qna> qnaList();
	
	int reviewWrite(Review r);
	
	int qnaWrite(Qna q);
	

}
