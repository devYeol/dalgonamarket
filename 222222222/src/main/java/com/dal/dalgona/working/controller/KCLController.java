package com.dal.dalgona.working.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.service.KCLService;

@Controller
@SessionAttributes({"loginMember"})
public class KCLController {
	
	@Autowired
	private KCLService service;

	@Value(value = "${spring.mail.username}")
	private String adminEmail;
	
	@RequestMapping("/member/login")
	public String login() {
		return "member/login/loginPage";
	}
	
	@RequestMapping(value="/member/loginEnd", method = RequestMethod.POST)
	public String loginId(Member m,Model model) {
		
		Member loginMember=service.login(m);

		String view="redirect:/";
		
		if(loginMember!=null) {
			model.addAttribute("loginMember",loginMember);
		}else {
			model.addAttribute("msg","로그인 실패");
			model.addAttribute("loc","/login");
			view="common/msg";
		}
		return view;
	}
	
	@RequestMapping("/member/logout")
	public String logout(SessionStatus status) {
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		return "member/login/findIdPage";
	}
	
	@RequestMapping("/findPw")
	public String findPw() {
		return "member/login/findPwPage";
	}
	
	@RequestMapping("/member/enroll")
	public String enroll() {
		return "member/enroll/enrollPage";
	}
	
	@RequestMapping("/member/enrollEnd")
	public String enrollEnd(Member m,Model model) {
		
		int result=service.insertMember(m);
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입 성공";
			loc="/";
		}else {
			msg="회원가입 실패";
			loc="/member/enroll";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
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
	
	@RequestMapping("/authmail")
	@ResponseBody
	public Boolean sendmail(String email,HttpSession session) {
		session.setAttribute("emailKey",service.authSendEmail(adminEmail,email));
		return true;
	}
	
	@RequestMapping("/checkauthkey")
	@ResponseBody
	public Boolean checkEmailAuthKey(String key,HttpSession session) {
		Boolean result=key.equals((String)session.getAttribute("emailKey"));
		if(result) session.removeAttribute("emailKey");
		return result;
		
	}
	
	
}
