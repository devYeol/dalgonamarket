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
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.dal.dalgona.orderdetail.model.dao.OrderDetailDaoJpa;
import com.dal.dalgona.productorder.model.dao.ProductOrderJpa;
import com.dal.dalgona.working.model.dao.PjeDao;
import com.dal.dalgona.working.model.dao.PjeDaoJpa;

@Service
public class PjeServiceImpl implements PjeService {
	@Autowired
	private PjeDaoJpa daoJpa;
	
	@Autowired
	private PjeDao dao;
	
	@Autowired
	private ProductOrderJpa orderDao;
	
	@Autowired
	private OrderDetailDaoJpa odJpa;
	
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
	
//	public Page<ProductOrder> searchOrderStatus(PageRequest pagerequest) {
//		// TODO Auto-generated method stub
//		return orderDao.findByOrderStatus(pagerequest);
//	}
	
	public ProductOrder adminOrderPermit(Long orderCode) {
		ProductOrder poUp=orderDao.findByOrderCode(orderCode);
		if (poUp.getOrderStatus().equals("주문대기")) {
			poUp.setOrderStatus("배송중");
		} else {
			return null;
		}
		return orderDao.save(poUp);
	}
	
//	public List<OrderDetail> adminPermitList(Long orderCode) {
//		return odJpa.findByOrderCode();
//	}
	
	public ProductOrder adminOrderCancel(Long orderCode) {
		ProductOrder poUp=orderDao.findByOrderCode(orderCode);
		if (poUp.getOrderStatus().equals("주문대기")) {
			poUp.setOrderStatus("주문취소");
		}
		return orderDao.save(poUp);
	}
	
	public ProductOrder selectProductOrder(Long orderCode) {
		return orderDao.findByOrderCode(orderCode);
	}

	@Override
	public List<OrderDetail> selectOrderDetails() {
		// TODO Auto-generated method stub
		return dao.selectOrderDetails(session);
	}

	@Override
	public List<OrderDetail> selectOrderDetailsCode(long orderCode) {
		// TODO Auto-generated method stub
		return dao.selectOrderDetailsCode(session, orderCode);
	}

	@Override
	public int minusProductAmount(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.minusProductAmount(session, param);
	}
	
	// ProductOrderStatus Count Methods
	public long countAll() {
		return orderDao.count();
	}
	public long countStandbyStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
	public long countCancelStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
	public long countShippingStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
	public long countArrivalStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
	public long countRefundReqStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
	public long countRefundOverStatus(String orderStatus) {
		return orderDao.countByOrderStatus(orderStatus);
	}
	
}
