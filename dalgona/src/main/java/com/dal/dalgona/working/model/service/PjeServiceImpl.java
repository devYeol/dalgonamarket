package com.dal.dalgona.working.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.dal.dalgona.working.model.dao.PjeDao;
import com.dal.dalgona.working.model.dao.PjeDaoJpa;
import com.dal.dalgona.working.model.dao.ProductOrderJpa;

@Service
public class PjeServiceImpl implements PjeService {
	@Autowired
	private PjeDaoJpa daoJpa;
	
	@Autowired
	private PjeDao dao;
	
	@Autowired
	private ProductOrderJpa orderDao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return daoJpa.findAll(pagerequest);
	}

	@Override
	public List<Member> searchMembers(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.searchMembers(session, param);
	}
	
	@Override
	public int searchMembersCount(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.searchMembersCount(session, param);
	}

	public Page<ProductOrder> searchOrders(PageRequest pagerequest) {
		// TODO Auto-generated method stub
		return orderDao.findAll(pagerequest);
	}
	
	public ProductOrder adminOrderPermit(Long orderCode) {
		ProductOrder poUp=orderDao.findByOrderCode(orderCode);
		if (poUp.getOrderStatus().equals("배송대기")) {
			poUp.setOrderStatus("배송중");
		}
		return orderDao.save(poUp);
	}
	
	public ProductOrder adminOrderCancel(Long orderCode) {
		ProductOrder poUp=orderDao.findByOrderCode(orderCode);
		if (poUp.getOrderStatus().equals("배송대기")) {
			poUp.setOrderStatus("주문취소");
		}
		return orderDao.save(poUp);
	}

	@Override
	public List<OrderDetail> selectOrderDetail() {
		// TODO Auto-generated method stub
		return dao.selectOrderDetail(session);
	}
	
	
}
