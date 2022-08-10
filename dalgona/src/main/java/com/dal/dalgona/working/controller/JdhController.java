package com.dal.dalgona.working.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dal.dalgona.common.CreateRndNum;
import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.working.model.service.JdhService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JdhController {
	
	@Autowired
	private JdhService service;
	
//	@Autowired
//	BCryptPasswordEncoder bc; // config 내부 bean으로 등록된 bcrypt 가져오기
	
//	@RequestMapping("/payment")
//	public String paymentTest() {
//		return "order/payment/payment";
//	}
	
	@RequestMapping("/paymentSuccess")
	public String paymentSuccess() {
		return "order/payment/paymentSuccess";
	}
	
	@RequestMapping("/paymentFail")
	public String paymentFail() {
		return "order/payment/paymentFail";
	}
	
	// save 테스트
	@RequestMapping("/JDHinsertTest")
	@ResponseBody // jsp 없을 시
	public Member jdhInsertTest() {
		
		Member m=Member.builder()
						.memberId("admin")
						.memberPwd("1234!")
						.memberName("관리자")
						.memberBirth("1999-01-01")
						.memberGender("여")
						.memberPhone("01012341234")
						.memberEmail("admin@dalgona.com")
						.memberEnrollDate(new Date())
						.build();
		
		Member result=service.jdhInsertTest(m);
		
		log.debug("dd");
		
		return result;
		
	}
	
	@GetMapping("/payment")
	public String payment(HttpSession session, Model model) {
						// 스프링 시큐리티로 접속했을 때 가져올 수 있음
//						@AuthenticationPrincipal KCLServiceImpl user) {
		
		Cart cart=(Cart)session.getAttribute("cart");
		
		model.addAttribute("cart", cart);
		
		String rndNum=CreateRndNum.rndNum();
		
		model.addAttribute("rndNum", rndNum);
		
		return "order/payment/payment";
		
	}
	
	// 결제 성공
	@RequestMapping("/order/payment/paymentComplete")
	public ResponseEntity<String> paymentComplete
			(HttpSession session, OrderDetail orderDetail, long totalPrice) throws IOException {
//							@AuthenticationPrincipal LoginMember user) throws IOException {
		
		// 1. 아임포트 API키, SECRET키로 토큰 생성
		// 2. 토큰으로 결제 완료된 주문정보 가져오기
		// 3. DB에서 실제 계산 될 금액 가져오기
		// 4. 결제 완료 금액과 실제 계산 금액이 다를 경우 결제취소
		// 5. 결제에러시 결제취소
		
		String token=service.getToken();
		log.debug("토큰값 : "+token);
		
		// 결제 완료된 금액
//		int amount = service.paymentInfo(service.getImpUid(), token);
		
		return new ResponseEntity<>(HttpStatus.OK);
		
	}
	
	// 토큰 생성 확인용
	public void testToken() throws IOException {
		
		String token=service.getToken();
		log.debug("토큰값 : "+token);
		
	}
	
	
//	@RequestMapping("/jdhEnrollTest")
//	public String enroll() {
//		return "member/enroll/enrollPage";
//	}
//	
//	@RequestMapping("/enrollTestEnd")
//	public String enrollEnd(Member m,Model model) {
//		
//		int result=service.insertMember(m);
//		String msg="";
//		String loc="";
//		if(result>0) {
//			msg="회원가입 성공";
//			loc="/";
//		}else {
//			msg="회원가입 실패";
//			loc="/member/enroll";
//		}
//		model.addAttribute("msg",msg);
//		model.addAttribute("loc",loc);
//		
//		return "common/msg";
//	}

}