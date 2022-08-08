package com.dal.dalgona.working.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dal.dalgona.working.model.vo.Msw;

@Controller
@RequestMapping("/member")
public class MswController {
	
//	@Autowired
//	private MswService service;

	@RequestMapping("/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}
	
//	@RequestMapping(value="/mypage/cart",method=RequestMethod.GET)
//	@RequestMapping("/mypage/cart")
//	@GetMapping("/mypage/cart")
//	public String cart(Model m) {
////		System.out.println("되컨?");
////		List<Msw> cartList =service.cartList();
////		System.out.println("되컨2?");
////		m.addAttribute("cartList",cartList);
////		System.out.println(cartList);
//		return "member/mypage/cart";
////		${path }/member/mypage/mypageMain
//	}
	
	
	@RequestMapping("/baesong")
	public String baesong() {
		return "/member/baesong";
	}
}




/*
 * class Msw2Controller {
 * 
 * @RequestMapping("/product/productList") public String productList() { return
 * "/product/productList"; } }
 */
