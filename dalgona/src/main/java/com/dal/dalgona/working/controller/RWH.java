package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RWH {
	
	@RequestMapping("/member/mypage/rwh")
	public String rwh() {
 		return "/member/mypage/rwh";
	}
	
	@RequestMapping("/sang")
	public String sang() {
		return "sang";
	}
	
	@RequestMapping("/member/mypage/zzim")
	public String zzim(){
		return "/member/mypage/zzim";
	}
	
	@RequestMapping("/member/mypage/cart")
	public String cart() {
		return "/member/mypage/cart";
	
	}
	@RequestMapping("/mypage/addressadd")
	public String addressadd() {
		return "mypage/addressadd";
		
	}
	@RequestMapping("/mypage/shippingset")
	public String shippingset() {
		return "mypage/shippingset";
		
	}
}
