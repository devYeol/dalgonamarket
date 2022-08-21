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
	
	double starAvg(long qnaCode);
	//찜	
	void likes(long productCode,String likes,String memberId);	
	//검색
	List<Product> searchList(String keyword);

	int selLikes(long productCode,String memberId) throws Exception;
	
	int likesCount(long productCode);
	
	long deleteByReviewCode(long reviewCode);
	
	long deleteByQnaCode(long qnaCode);
	
	Review selectOneReview(long reviewCode);
	
	int deletebyProduct(long pro);

//	int insertOptionCode(ProductOption option);
	
	int updateReview(Review review) throws Exception;
	
	List<Product> categoryList(String categoryName);
	
	List<Product> adminSearchList(String adminkeyword);
}
