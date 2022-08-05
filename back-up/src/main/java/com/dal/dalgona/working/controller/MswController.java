package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MswController {

	@RequestMapping("/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}
	
}




@Controller
class Msw2Controller {
	@RequestMapping("/product/productList")
	public String productList() {
		return "/product/productList";
	}
}
