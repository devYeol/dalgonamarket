package com.dal.dalgona.working.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.service.JDHMemberService;

@Controller
public class JDHController {
	
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
	
	
	@Autowired
	private JDHMemberService service;
	
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
		
		return result;
		
	}
	
	
	
	
	
	
	

}