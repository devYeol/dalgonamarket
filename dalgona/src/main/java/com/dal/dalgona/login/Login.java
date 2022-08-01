package com.dal.dalgona.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Login {

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
	
}
