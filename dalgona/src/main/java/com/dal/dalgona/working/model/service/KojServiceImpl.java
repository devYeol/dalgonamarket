/*
 * package com.dal.dalgona.working.model.service;
 * 
 * import java.util.List;
 * 
 * import org.mybatis.spring.SqlSessionTemplate; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.dal.dalgona.common.model.vo.Product; import
 * com.dal.dalgona.common.model.vo.Qna; import
 * com.dal.dalgona.common.model.vo.Review; import
 * com.dal.dalgona.working.model.dao.KojDao;
 * 
 * @Service public class KojServiceImpl implements KojService {
 * 
 * @Autowired private KojDao dao;
 * 
 * @Autowired private SqlSessionTemplate session;
 * 
 * @Override public Product selectProduct(long productCode) { // TODO
 * Auto-generated method stub return dao.selectProduct(session,productCode); }
 * 
 * @Override public List<Review> reviewList() { // TODO Auto-generated method
 * stub return dao.reviewList(session); }
 * 
 * 
 * @Override public List<Qna> qnaList() { // TODO Auto-generated method stub
 * return dao.qnaList(session); }
 * 
 * @Override public int reviewWrite(Review r) { // TODO Auto-generated method
 * stub return dao.reviewWrite(session,r); }
 * 
 * 
 * 
 * 
 * }
 */