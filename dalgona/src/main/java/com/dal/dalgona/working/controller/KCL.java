package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KCL {

	@RequestMapping("/login")
	public String login() {
		return "common/loginPage";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		return "common/findIdPage";
	}
	
	@RequestMapping("/findPw")
	public String findPw() {
		return "common/findPwPage";
	}
	
	@RequestMapping("/enroll")
	public String enroll() {
		return "common/enrollPage";
	}
	
	@RequestMapping("/address")
	public String address() {
		return "common/address";
	}
	@RequestMapping("/infochange")
	public String infochange() {
		return "common/infochange";
	}
	@RequestMapping("/changePage")
	public String changePage() {
		return "common/changePage";
	}
}
