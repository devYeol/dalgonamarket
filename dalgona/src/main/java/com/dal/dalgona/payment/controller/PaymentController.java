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
	
	@RequestMapping("/payment")
	public String paymentTest(HttpSession session) {
		
		Member memberId = (Member) session.getAttribute("loginMember");
		
		return "order/payment/payment";
	}

}
