package com.dal.dalgona.working.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.service.KCLService;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({"loginMember"})
@Slf4j
public class KCLController {
	
	@Autowired
	private KCLService service;

	@RequestMapping("/login")
	public String login() {
		return "member/login/loginPage";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginId(Member m,Model model) {
		
		Member loginMember=service.login(m);
		
		String viewName="redirect:/";
		
		if(loginMember!=null) {
			//로그인 성공
			model.addAttribute("loginMember", loginMember);
		}else {
			//로그인 실패
			model.addAttribute("msg","로그인실패");
			model.addAttribute("loc","/");
			viewName="common/msg";
		}
		log.debug(viewName);
		return viewName;
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
