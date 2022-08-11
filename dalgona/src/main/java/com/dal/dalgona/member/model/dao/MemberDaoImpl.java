package com.dal.dalgona.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

@Repository
public class MemberDaoImpl implements MemberDao {

//	@Override
//	public List<Product> selectProduct(SqlSessionTemplate session){
//		return session.selectList("cart.selectProduct");
//	}
	
	@Override
	public List<Cart> cartList(SqlSessionTemplate session,Member m){
		return session.selectList("cart.cartList",m);
	}
	
	@Override
	public int sumMoney(SqlSessionTemplate session,Member m){
		return session.selectOne("cart.sumMoney",m);
	}
	@Override
	public void delete(SqlSessionTemplate session,int cartCode) {
		session.delete("cart.delete",cartCode);
	}
	
	@Override
	public void deleteAll(SqlSessionTemplate session ,Member memberId) {
		session.delete("cart.deleteAll",memberId);
	}

	@Override
	public List<Product> zzimList(SqlSessionTemplate session){
		return session.selectList("cart.zzimList");
	}
//
	@Override
	public List<Product> orderList(SqlSessionTemplate session){
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
}
