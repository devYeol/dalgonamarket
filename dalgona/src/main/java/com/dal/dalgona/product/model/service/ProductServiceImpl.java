package com.dal.dalgona.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.product.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Product> selectProducts() {
		// TODO Auto-generated method stub
		return dao.selectProducts(session);
	}
	
	
	@Override
	public List<ProductOption> optionList(long productCode) {
		// TODO Auto-generated method stub
		return dao.optionList(session,productCode);
	}


	@Override
	public Product selectProduct(long productCode) {
		// TODO Auto-generated method stub
		return dao.selectProduct(session,productCode);
	}

	@Override
	public List<Review> reviewList(long productCode) {
		// TODO Auto-generated method stub
		return dao.reviewList(session,productCode);
	}

	@Override
	public List<Qna> qnaList(long productCode) {
		// TODO Auto-generated method stub
		return dao.qnaList(session,productCode);
	}

	@Override
	public int reviewWrite(Review r) {
		// TODO Auto-generated method stub
	 	return dao.reviewWrite(session,r);
	}
	

	@Override
	public int qnaWrite(Qna q) {
		// TODO Auto-generated method stub
		return dao.qnaWrite(session,q);
	}

	@Override
	public Qna qnaSelectOne(long qnaCode) {
		// TODO Auto-generated method stub
		return dao.qnaSelectOne(session,qnaCode);
	}


	@Override
	public double starAvg(long qnaCode) {
		// TODO Auto-generated method stub
		return dao.starAvg(session,qnaCode);
	}
	

	@Override
	public void likes(long productCode, String likes, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", memberId);
	    map.put("product", productCode);
	    if(likes.equals("on")) {
	        dao.addLikes(session,map);
	    } else {
	        dao.deleteLikes(session,map);
	    }
		
	}
	

	//검색
	@Override public List<Product> searchList(String keyword) {
	  
		return dao.searchList(session,keyword);
	}


	@Override
	public int selLikes(long productCode, String memberId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", memberId);
	    map.put("product", productCode);
		return dao.selLikes(session,map);
	}


	@Override
	public int likesCount(long productCode) {
		// TODO Auto-generated method stub
		return dao.likesCount(session,productCode);
	}

	
	
	
	
}
