package com.dal.dalgona.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int cartInsert(SqlSessionTemplate session,Cart c){
		return session.insert("cart.cartInsert",c);
	}
	
	@Override
	public Product selectProduct(SqlSession session,Product productCode) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProduct",productCode);
	}
	
//	@Override
//	public Likes selectLikes(SqlSession session, long likesCode) {
//		// TODO Auto-generated method stub
//		return session.selectOne("likes.selectLikes",likesCode);
//	}
	
	@Override
	public int countCart(SqlSessionTemplate session,Product productCode,Member m ) {
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("productCode", productCode);
		map.put("m", m);
		return session.selectOne("cart.countCart",map);
	}
	@Override
	public void modifyCart(SqlSessionTemplate session,Cart c){
		
		session.update("cart.modifyCart",c);
	}
	
	
	@Override
	public void updateCart(SqlSessionTemplate session,Cart c) {
		// TODO Auto-generated method stub
		 session.update("cart.updateCart",c);
	}
	
	@Override
	public List<Cart> cartList(SqlSessionTemplate session,Member memberId){
		return session.selectList("cart.cartList",memberId);
	}

	@Override
	public Cart selectCart(SqlSessionTemplate session,Product productCode) {
		return session.selectOne("cart.selectCart",productCode);
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
	public long zzimSelectDelete(SqlSessionTemplate session,long likesCode) {
		return session.delete("likes.zzimSelectDelete",likesCode);
	}
	@Override
	public long zzimDelete(SqlSessionTemplate session,long likesCode) {
		return session.delete("likes.zzimDelete",likesCode);
	}
//	@Override
//	public void zzimDelete(SqlSessionTemplate session,long zzimCode) {
//		session.delete("likes.zzimDelete",zzimCode);
//	}
	
//	@Override
//	public void deleteAll(SqlSessionTemplate session ,Member memberId) {
//		session.delete("cart.deleteAll",memberId);
//	}

	@Override
	public List<Likes> zzimList(SqlSessionTemplate session,Member memberId){
		return session.selectList("likes.zzimList",memberId);
	}

	@Override
	public long zzimSelectDelete1(SqlSessionTemplate session,long productCode) {
		return session.insert("cart.cartInsert",productCode);
	}

	
	
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

	@Override
	public DeliveryLocation selectDelivery(SqlSessionTemplate session,Member memberId) {
		return session.selectOne("deliveryLocation.selectDelivery",memberId);
	}

	@Override
	public int addressInsert(SqlSessionTemplate session,DeliveryLocation dl) {
		return session.insert("deliveryLocation.addressInsert",dl);
	}

	@Override
	public void addressDelete(SqlSessionTemplate session,long addressCode) {
		session.insert("deliveryLocation.addressDelete",addressCode);
	}
	
	
	
	
	public List<Product> orderList(SqlSessionTemplate session) {
		return session.selectList("cart.orderList");
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
	
	@Override
	public int infoUpdate(SqlSessionTemplate session, Member m) {
		
		return session.update("member.infoUpdate", m);
	}
	
	@Override
	public void deleteMember(SqlSessionTemplate session, String memberId) {
		
		session.delete("member.deleteMember", memberId);
	}
	
	@Override
	public Member pwck(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.passwordCheck", m);
	}
	
	@Override
	public int pwUpdateCheck(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.pwUpdateCheck", m);
	}
	
	@Override
	public int pwUpdateEnd(SqlSessionTemplate session, String memberId, String memberPwd1) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("memberPwd", memberPwd1);
		
		return session.update("member.pwUpdateEnd", map);
	}
}
 