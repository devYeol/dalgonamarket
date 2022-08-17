package com.dal.dalgona.payment.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.dal.dalgona.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "loginMember" })
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
//	@RequestMapping("/payment")
//	public String paymentTest(HttpSession session) {
//		
//		Member memberId = (Member) session.getAttribute("loginMember");
//		
//		return "order/payment/payment";
//	}
	
	@RequestMapping("/changeAddress.do")
	public String changeAddress() {
		return "order/payment/changeAddress";
	}
	
	@RequestMapping("/payment")
	public String order(HttpSession session, Model model) {
		
		Member memberId = (Member) session.getAttribute("loginMember");
		log.debug("user : {}", memberId);
 
		Cart cartList = (Cart) session.getAttribute("cartList");

		return "order/payment/payment";
		
	}
	
	@RequestMapping("/product/payment.do")
	public String paymentProduct(Product p, ProductOrder po, DeliveryLocation dl 
			, HttpSession session, Model model
			,@RequestParam(value="selAmount", required = false ) int selAmount
			,@RequestParam(value="selectedOpt", required = false) String selectedOpt
			,@RequestParam(value="productName", required = false ) String productName
			) {
		
		Member memberId = (Member) session.getAttribute("loginMember");
		
//		log.debug("{}",p);
//		log.debug("{}",po);
//		log.debug("{}",dl);
		log.debug("{}",productName);
		log.debug("{}",selAmount);
		log.debug("{}",selectedOpt);
		
		model.addAttribute("product", p);
		model.addAttribute("productOption", selectedOpt);
		model.addAttribute("selAmount", selAmount);
		
//		dl=service.selectaddrBase(m); //여기서 기본배송지 선택해서
//		po=ProductOrder.builder().orderDate(new Date()).orderStatus("디폴").selectLocation(dl).build();
		po=ProductOrder.builder().orderStatus("주문대기").build();
//		Product p;
		int selsu=selAmount;
		String op="";
		
		OrderDetail od=OrderDetail.builder().productOrder(po).orderOption(op).orderAmount(selsu).product(p).build();
		
		log.debug("{}",op);
		log.debug("{}",od);
		
//		paymentService.insertOrderDetail(od);
		
		return "order/payment/paymentProduct";
		
	}
	
	@ResponseBody
	@PostMapping("/order/paymentCart")
	public ResponseEntity<String> payment(HttpSession session, ProductOrder productOrder, long totalPrice) throws IOException {
		
		Member memberId = (Member) session.getAttribute("loginMember");
	    
	    Cart cartList = (Cart) session.getAttribute("cartList");
	 
	    return new ResponseEntity<>(HttpStatus.OK);
	    
	}
	
	// 결제 성공
	@RequestMapping("/order/payment/paymentComplete")
	public ResponseEntity<String> paymentComplete
			(HttpSession session, ProductOrder productOrder, long totalPrice) throws IOException {
//							@AuthenticationPrincipal LoginMember user) throws IOException {
		
		// 1. 아임포트 API키, SECRET키로 토큰 생성
		// 2. 토큰으로 결제 완료된 주문정보 가져오기
		// 3. DB에서 실제 계산 될 금액 가져오기
		// 4. 결제 완료 금액과 실제 계산 금액이 다를 경우 결제취소
		// 5. 결제에러시 결제취소
		
		String token=paymentService.getToken();
		log.debug("토큰값 : {}", token);
		
		// 결제 완료된 금액
		int amount = paymentService.productOrder(productOrder.getImpUid(), token);
		
		try {
	        
			Cart cart = (Cart) session.getAttribute("cartList");
	        // 실제 계산 금액 가져오기
	        long orderPriceCheck = paymentService.orderPriceCheck(cart);
	        
		    if (orderPriceCheck != amount) {
//		    	paymentService.payMentCancle(token, productOrder.getImpUid(), amount, "결제 금액 오류");
		    	return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
		    }
	        
		    paymentService.order(cart, productOrder, session);
	        session.removeAttribute("cartList");
	        
	        return new ResponseEntity<>("주문이 완료되었습니다", HttpStatus.OK);
	        
	    } catch (Exception e) {
//	    	paymentService.payMentCancle(token, productOrder.getImpUid(), amount, "결제 에러");
	        return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
	    }
		
//		return new ResponseEntity<>(HttpStatus.OK);
		
	}

}
