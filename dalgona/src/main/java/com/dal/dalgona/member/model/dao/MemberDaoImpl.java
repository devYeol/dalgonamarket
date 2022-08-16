package com.dal.dalgona.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;

@Repository
public class MemberDaoImpl implements MemberDao {

//	@Override
//	public List<Product> selectProduct(SqlSessionTemplate session){
//		return session.selectList("cart.selectProduct");
//	}
	
	@Override
	public void cartInsert(SqlSessionTemplate session,Cart c) {
		session.insert("cart.cartInsert",c);
	}
	
	@Override
	public List<Cart> cartList(SqlSessionTemplate session,Member memberId){
		return session.selectList("cart.cartList",memberId);
	}
	
	@Override
	public int sumMoney(SqlSessionTemplate session,Member memberId){
		return session.selectOne("cart.sumMoney",memberId);
	}
	@Override
	public void delete(SqlSessionTemplate session,long cartCode) {
		session.delete("cart.delete",cartCode);
	}
	
	@Override
	public long selectDelete(SqlSessionTemplate session,long cartCode) {
		return session.delete("cart.selectDelete",cartCode);
	}
	@Override
	public long zzimSelectDelete(SqlSessionTemplate session,long zzimCode) {
		return session.delete("likes.zzimSelectDelete",zzimCode);
	}
	@Override
	public void zzimDelete(SqlSessionTemplate session,long zzimCode) {
		 session.delete("likes.zzimDelete",zzimCode);
	}
	
//	@Override
//	public void deleteAll(SqlSessionTemplate session ,Member memberId) {
//		session.delete("cart.deleteAll",memberId);
//	}

	@Override
	public  void updateCart(SqlSessionTemplate session ,Cart c) {
		session.update("cart.updateCart",c);
	}

	@Override
	public List<Likes> zzimList(SqlSessionTemplate session,Member memberId){
		return session.selectList("likes.zzimList",memberId);
	}
//
	@Override
	public List<OrderDetail> orderList(SqlSessionTemplate session,Member memberId){
		return session.selectList("orderDetail.orderList",memberId);
	}

	@Override
	public long orderListDelete(SqlSessionTemplate session,long orderCode) {
		return session.delete("orderDetail.orderListDelete",orderCode);
	}
	
	@Override
	public List<DeliveryLocation>selectDL(SqlSessionTemplate session,Member memberId){
		return session.selectList("deliveryLocation.selectDL",memberId);
	}
	
	
	/* 충열 */
	
	@Override
	public Member login(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMember",m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember",m);
	}
	
	@Override
	public int idCheck(SqlSessionTemplate session, String memberId) {
		return session.selectOne("member.idCheck", memberId);
	}
	
	@Override
	public Member findId(SqlSessionTemplate session, String memberEmail) {
		return session.selectOne("member.findId", memberEmail);
	}
	
	@Override
	public int findIdCheck(SqlSessionTemplate session, String memberEmail) {
		return session.selectOne("member.findIdCheck", memberEmail);
	}
	
	@Override
	public int findPwCheck(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.findPwCheck", m);
	}
	
	@Override
	public int findPwChange(SqlSessionTemplate session, Member m, String newPw) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", m.getMemberEmail());
		map.put("memberId", m.getMemberId());
		map.put("memberPwd", newPw);
		return session.update("member.findPwChange", map);
	}
}
