package com.dal.dalgona.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface MemberDao {

	int cartInsert(SqlSessionTemplate session,Cart c);
	
	Product selectProduct(SqlSession session, Product productCode);

//	Likes selectLikes(SqlSession session, long likesCode);
	
	int countCart(SqlSessionTemplate session,Product productCode,Member m );
	
	void modifyCart(SqlSessionTemplate session,Cart c);
	
	void updateCart(SqlSessionTemplate session,Cart c);
	
	List<Cart> cartList(SqlSessionTemplate session,Member memberId );

	Cart selectCart(SqlSessionTemplate session,Product productCode);
	
	void delete(SqlSessionTemplate session,long cartCode); //장바구니 한 개 로우 삭제
	
	long selectDelete(SqlSessionTemplate session,long cartCode); //장바구니 삭제

//	void deleteAll(SqlSessionTemplate session,Member MemberId);
	
	int sumMoney(SqlSessionTemplate session,Member memberId );

	List<Likes> zzimList(SqlSessionTemplate session ,Member memberId);
	
	long zzimSelectDelete1(SqlSessionTemplate session,long productCode);

	long zzimSelectDelete(SqlSessionTemplate session,long likesCode); //찜 선택삭제

//	void zzimDelete(SqlSessionTemplate session,long zzimCode); //장바구니 삭제

	long zzimDelete(SqlSessionTemplate session,long likesCode); //장바구니 삭제

	List<OrderDetail> orderList(SqlSessionTemplate session,Member memberId);
	
	DeliveryLocation selectDelivery(SqlSessionTemplate session,Member memberId);
	
	long orderListDelete(SqlSessionTemplate session,long orderCode); //구매내역 선택삭제

	List<DeliveryLocation>selectDL(SqlSessionTemplate session,Member memberId);
	
	int addressInsert(SqlSessionTemplate session,DeliveryLocation dl);
	
	void addressDelete(SqlSessionTemplate session,long addressCode);
	
	
	
	
	
	
	
	
	
	
	/* 충열 */
	
	Member login(SqlSessionTemplate session, Member m);
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	int idCheck(SqlSessionTemplate session, String memberId);
	
	Member findId(SqlSessionTemplate session, String memberEmail) throws Exception;
	
	int findIdCheck(SqlSessionTemplate session, String memberEmail) throws Exception;
	
	int findPwCheck(SqlSessionTemplate session, Member m) throws Exception;
	
	int findPwChange(SqlSessionTemplate session, Member m, String newPw);
	
	int infoUpdate(SqlSessionTemplate session, Member m) throws Exception;
	
	void deleteMember(SqlSessionTemplate session, String memberId);
	
	Member pwck(SqlSessionTemplate session, Member m);
	
	int pwUpdateCheck(SqlSessionTemplate session, Member m);
	
	int pwUpdateEnd(SqlSessionTemplate session, String memberId, String memberPwd1);
}
