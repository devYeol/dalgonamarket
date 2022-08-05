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
						.memberId("user01")
						.memberPwd("1234!")
						.memberName("김유저")
						.memberBirth("1999-01-01")
						.memberGender("남")
						.memberPhone("01012345678")
						.memberEmail("user01@dalgona.com")
						.memberEnrollDate(new Date())
						.build();
		
		Member result=service.jdhInsertTest(m);
		
		return result;
		
	}
	
	
	
	
	
	
	

}