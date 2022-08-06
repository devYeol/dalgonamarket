package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;

@Controller
@RequestMapping("/member")
public class MswController {

	@RequestMapping("/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}
	
	@RequestMapping("/baesong")
	public String baesong() {
		return "/member/baesong";
	}
}



@Controller
class Msw2Controller {
	@RequestMapping("/product/productList")
	public String productList() {
		return "/product/productList";
	}
}
