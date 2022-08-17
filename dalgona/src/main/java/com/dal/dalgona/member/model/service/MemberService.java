package com.dal.dalgona.member.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface MemberService {

	int cartInsert(Cart c);

	Product selectProduct(Product productCode);

	Likes selectLikes(long likesCode);
	
	List<Cart> cartList(Member memberId); 
	
	Cart selectCart(Product productCode);

	void delete(long cartCode); //장바구니 선택삭제

	long selectDelete(long cartCode);
	
//	void deleteAll(Member memberId); //전체 삭제
	
	int sumMoney(Member memberId); //총 금액 

	List<Likes> zzimList(Member memberId);

	long zzimSelectDelete(long likesCode); //찜 선택삭제
	
//	void zzimDelete(long likesCode);

	long zzimDelete(long likesCode);

	List<OrderDetail> orderList(Member memberId);
	
	long orderListDelete(long orderCode); //구매내역 선택삭제

	List<DeliveryLocation>selectDL(Member memberId);

	DeliveryLocation selectDelivery(Member memberId);
	
	
	
	
	
	
	
	
	
	
	
	/* 충열 */
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int idCheck(String memberId);
	
	String authSendEmail(String senderEmail, String receiver);
	
	Member findId(String memberEmail) throws Exception;
	
	int findIdCheck(String memberEmail) throws Exception;
	
	int findPwCheck(Member m) throws Exception;
	
	String findPw(String senderEmail, String receiver);
	
	void findPwChange(Member m, String newPw);
	
	int infoUpdate(Member m) throws Exception;

	void deleteMember(String memberId);
	
	Member pwck(Member m);
	
	int pwUpdateCheck(Member m);
	
	int pwUpdateEnd(String memberId, String memberPwd1);
}
