package com.dal.dalgona.payment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dal.dalgona.common.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "loginMember" })
public class PaymentController {
	
//	@Autowired
//	private PaymentService paymentService;
	
	@RequestMapping("/payment")
	public String paymentTest(HttpSession session) {
		
		Member memberId = (Member) session.getAttribute("loginMember");
		
		return "order/payment/payment";
	}
	
//	@ResponseBody
//	@PostMapping("/order/payment")
//	public ResponseEntity<String> payment(HttpSession session, ProductOrder productOrder, long totalPrice) throws IOException { // 총금액 컬럼 생성할지 생각해보기
////			@AuthenticationPrincipal SecurityService loginUser) throws IOException {
//	    
//	    Cart cart = (Cart) session.getAttribute("cart");
//	    
//	    long orderPriceCheck = paymentService.orderPriceCheck(cart);
//	    
//	    System.out.println("계산금액 = " + totalPrice + " 실제 계산해야할 금액 = " + orderPriceCheck );
//	    
//	    if(orderPriceCheck == totalPrice) {
//	    	paymentService.order(session, cart, productOrder);
//	        session.removeAttribute("cartList");
//	    }
//	 
//	    return new ResponseEntity<>(HttpStatus.OK);
//	    
//	}
	
	// 결제 성공
//	@RequestMapping("/order/payment/paymentComplete")
//	public ResponseEntity<String> paymentComplete
//			(HttpSession session, ProductOrder productOrder, long totalPrice) throws IOException {
////							@AuthenticationPrincipal LoginMember user) throws IOException {
//		
//		// 1. 아임포트 API키, SECRET키로 토큰 생성
//		// 2. 토큰으로 결제 완료된 주문정보 가져오기
//		// 3. DB에서 실제 계산 될 금액 가져오기
//		// 4. 결제 완료 금액과 실제 계산 금액이 다를 경우 결제취소
//		// 5. 결제에러시 결제취소
//		
//		String token=service.getToken();
//		log.debug("토큰값 : "+token);
//		
//		// 결제 완료된 금액
//		int amount = service.paymentInfo(productOrder.getImpUid(), token);
//		
//		try {
//	        
//			Cart cart = (Cart) session.getAttribute("cartList");
//	        // 실제 계산 금액 가져오기
//	        long orderPriceCheck = service.orderPriceCheck(cart);
//	        
//		    if (orderPriceCheck != amount) {
//		    	service.payMentCancle(token, productOrder.getImpUid(), amount, "결제 금액 오류");
//		    	return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
//		    }
//	        
//	        service.order(cartList, orderInfo, user);
//	        session.removeAttribute("cartList");
//	        
//	        return new ResponseEntity<>("주문이 완료되었습니다", HttpStatus.OK);
//	        
//	    } catch (Exception e) {
//	        service.payMentCancle(token, productOrder.getImpUid(), amount, "결제 에러");
//	        return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
//	    }
//		
//		return new ResponseEntity<>(HttpStatus.OK);
//		
//	}

}
