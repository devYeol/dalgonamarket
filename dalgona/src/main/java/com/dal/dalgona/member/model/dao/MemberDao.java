package com.dal.dalgona.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;

public interface MemberDao {

//	List<Product> selectProduct(SqlSessionTemplate session );
	
	List<Cart> cartList(SqlSessionTemplate session,Member m );
	
	void delete(SqlSessionTemplate session,long productCode);
	
	int sumMoney(SqlSessionTemplate session,Member m );


//	List<Product> zzimList(SqlSessionTemplate session );

//	List<Product> orderList(SqlSessionTemplate session );
	
	/* 충열 */
	
	Member login(SqlSessionTemplate session, Member m);
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	int idCheck(SqlSessionTemplate session, String memberId);
	
	Member findId(SqlSessionTemplate session, String memberEmail)throws Exception;
	
	int findIdCheck(SqlSessionTemplate session, String memberEmail)throws Exception;
}
