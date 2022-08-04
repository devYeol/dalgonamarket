package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RWH {
	
	@RequestMapping("/mypage/rwh")
	public String rwh() {
 		return "mypage/rwh";
	}
	
	@RequestMapping("/sang")
	public String sang() {
		return "sang";
	}
	
	@RequestMapping("/mypage/zzim")
	public String zzim(){
		return "mypage/zzim";
	}
	
	@RequestMapping("/mypage/cart")
	public String cart() {
		return "mypage/cart";
	
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
