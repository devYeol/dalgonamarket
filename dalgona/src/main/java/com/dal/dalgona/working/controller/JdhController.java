package com.dal.dalgona.working.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.service.JdhService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JdhController {
	
	@Autowired
	private JdhService service;
	
//	@Autowired
//	BCryptPasswordEncoder bc; // config 내부 bean으로 등록된 bcrypt 가져오기
	
	@RequestMapping("/payment")
	public String paymentTest() {
		return "order/payment/payment";
	}
	
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