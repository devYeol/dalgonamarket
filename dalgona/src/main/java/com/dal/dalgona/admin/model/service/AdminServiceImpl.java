package com.dal.dalgona.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.dal.dalgona.admin.model.dao.AdminDao;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.option.model.dao.OptionDao;
import com.dal.dalgona.product.model.dao.ProductDao;
import com.dal.dalgona.qna.model.dao.QnaDao;
import com.dal.dalgona.qna.model.dao.QnaDaoJpa;
import com.dal.dalgona.review.model.dao.ReviewDao;
import com.dal.dalgona.review.model.dao.ReviewDaoJpa;
import com.dal.dalgona.working.model.dao.PjeDaoJpa;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao dao;
	
	@Autowired
	PjeDaoJpa memberDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@Autowired
	QnaDao qnaDao;
	
	@Autowired
	SqlSessionTemplate session;
	

	@Autowired
	private OptionDao optionDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ReviewDaoJpa reviewDaoJpa;
	
	@Autowired
	private QnaDaoJpa qnaDaoJpa;
	
	public List<Product> selectProducts() {
		return dao.findAll(Sort.by(Sort.Direction.DESC,"productCode"));
	}
	
	@Transactional
	public Long deleteByProductCode(Long productCode) {
		System.out.println("productCode : " + productCode );
//		Long result = optionDao.deleteByProduct(selectOneProduct(productCode));
//		result = qnaDaoJpa.deleteByProduct(selectOneProduct(productCode));
		return dao.deleteByProductCode(productCode);
		
	}
	
	/*
	 * public void insertProduct(Product p) { dao.saveAndFlush(p); }
	 */
	
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
	
	//productCode로 불러오기
	@Override
	public Product selectOneProduct(Long pro) {
		return dao.findByProductCode(pro);
	}

	@Override
	public List<ProductOption> selectOneOption(Product p) {
		// TODO Auto-generated method stub
		return optionDao.findByProduct(p);
	}
	
	@Override
	public Product updateProduct(Product po) {
		Product update = dao.save(po);
		return update;
	}

	@Override
	public List<ProductOption> updateOption(List<ProductOption> list) {
		List<ProductOption> optionUpdate = optionDao.saveAll(list);
		return optionUpdate;
	}

	@Override
	public List<Review> selectReviewsTop8() {
		// TODO Auto-generated method stub
		return reviewDao.selectReviewsTop8(session);
	}
	
	@Override
	public List<Qna> selectQnasTop8() {
		// TODO Auto-generated method stub
		return qnaDao.selectQnasTop8(session);
	}
	
	// JPA
	
	public Page<Product> selectProducts(PageRequest pagerequest) {
		return dao.findAll(pagerequest);
	}
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return memberDao.findAll(pagerequest);
	}

//	public List<Review> selectReviews() {
//		return reviewDaoJpa.findTop7ByReviewDate();
//	}
//	
//	public List<Qna> selectQnas() {
//		return qnaDao.findAll();
//	}

	public List<ProductOption> save(List<ProductOption> options) {
		List<ProductOption> result=new ArrayList();
		for(ProductOption po : options) {
			result.add(optionDao.save(po));	
		}
		return result;
	}

	

	
	


	
}
