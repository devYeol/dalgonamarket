package com.dal.dalgona.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;

public interface ProductDao {
	List<Product> selectProducts(SqlSession session);
	
	List<Product> selectProductsPlus(SqlSession session, Map<String, Object> param);
	
	int selectProductsPlusCount(SqlSession session, Map<String, Object> param);
	
	List<Product> selectProductsPlusPop(SqlSession session, Map<String, Object> param);
	
	int selectProductsPlusPopCount(SqlSession session, Map<String, Object> param);
	
	List<Product> selectTopBuy(SqlSession session);
	
	List<Product> selectTopZzim(SqlSession session);
	
	Product selectProduct(SqlSession session, long productCode);
	
	List<ProductOption> optionList(SqlSession session, long productCode);
	
	List<Review> reviewList(SqlSession session,long productCode);
	
	List<Qna> qnaList(SqlSession session,long productCode);
	
	int reviewWrite(SqlSession session,Review r);
	
	int qnaWrite(SqlSession session,Qna q);
	
	Qna qnaSelectOne(SqlSession session,long qnaCode);
	
	double starAvg(SqlSession session,long qnaCode);
	
	Long deleteByProduct(Product p);
	
	//검색
	List<Product> searchList(SqlSession session, String keyword);
	
	void addLikes(SqlSession session,Map<String, Object> map);
	
	void deleteLikes(SqlSession session,Map<String, Object> map);
	
	int selLikes(SqlSession session,Map<String, Object> map) throws Exception;
	
	int likesCount(SqlSession session,long productCode);
	
	long deleteByReviewCode(SqlSession session,long reviewCode);
	
	Review selectOneReview(SqlSession session,long reviewCode);
	
	int updateReview(SqlSession session,Review review);

	int deleteByProductOption(SqlSession session,long ppp);

//	int insertOptionCode(SqlSession session, ProductOption option);
	
	long deleteByQnaCode(SqlSession session,long qnaCode);
	
	List<Product> categoryList(SqlSession session,String categoryName);
	
	List<Product> adminSearchList(SqlSession session, String adminKeyword);



}
