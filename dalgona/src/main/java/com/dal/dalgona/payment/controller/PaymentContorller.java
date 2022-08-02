package com.dal.dalgona.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentContorller {
	
	@RequestMapping("/payment")
	public String paymentTest() {
		return "payment/payment";
	}
	
	@RequestMapping("/paymentSuccess")
	public String paymentSuccess() {
		return "payment/paymentSuccess";
	}
	
	@RequestMapping("/paymentFail")
	public String paymentFail() {
		return "payment/paymentFail";
	}

}