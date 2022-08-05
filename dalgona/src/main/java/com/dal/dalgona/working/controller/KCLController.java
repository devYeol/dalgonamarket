package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KCLController {

	@RequestMapping("/login")
	public String login() {
		return "member/login/loginPage";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		return "member/login/findIdPage";
	}
	
	@RequestMapping("/findPw")
	public String findPw() {
		return "member/login/findPwPage";
	}
	
	@RequestMapping("/enroll")
	public String enroll() {
		return "member/enroll/enrollPage";
	}
	
	@RequestMapping("/address")
	public String address() {
		return "member/mypage/address";
	}
	@RequestMapping("/infochange")
	public String infochange() {
		return "member/mypage/infochange";
	}
	@RequestMapping("/changePage")
	public String changePage() {
		return "member/mypage/changePage";
	}
}
