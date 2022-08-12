package com.dal.dalgona.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MemberDao {

    void cartInsert(SqlSessionTemplate session,Cart c );
	
	List<Cart> cartList(SqlSessionTemplate session,Member m );
	
	void updateCart(SqlSessionTemplate session ,Cart c);
	
//	void delete(SqlSessionTemplate session,int cartCode);
	
	long delete(SqlSessionTemplate session,long cartCode);

	void deleteAll(SqlSessionTemplate session,Member MemberId);
	
	int sumMoney(SqlSessionTemplate session,Member m );

	List<Likes> zzimList(SqlSessionTemplate session ,Member memberId);

	List<Product> orderList(SqlSessionTemplate session );
	
	/* 충열 */
	
	Member login(SqlSessionTemplate session, Member m);
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	int idCheck(SqlSessionTemplate session, String memberId);
	
	Member findId(SqlSessionTemplate session, String memberEmail)throws Exception;
	
	int findIdCheck(SqlSessionTemplate session, String memberEmail)throws Exception;
	
	int findPwCheck(SqlSessionTemplate session, Member m)throws Exception;
	
	int findPwChange(SqlSessionTemplate session, Member m, String newPw);
}
