package com.dal.dalgona.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dal.dalgona.common.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class addressController {

	@RequestMapping("/member/mypage/addressadd")
	public String addressAdd() {
		return "member/mypage/addressadd";
	}

//	@RequestMapping("/member/enrollEnd")
//	public String addressAddEnd(Member m, Model model) {
//
//		int result = service.insertMember(m);
//		String msg = "";
//		String loc = "";
//		if (result > 0) {
//			msg = "회원가입 성공";
//			loc = "/";
//		} else {
//			msg = "회원가입 실패";
//			loc = "/member/enroll";
//		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("loc", loc);
//
//		return "common/msg";
//	}

}
