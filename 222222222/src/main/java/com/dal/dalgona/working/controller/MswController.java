package com.dal.dalgona.working.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dal.dalgona.working.model.service.MswService;
import com.dal.dalgona.working.model.vo.Msw;

@Controller
@RequestMapping("/member")
public class MswController {

	@Autowired
	private MswService service;

	@RequestMapping("/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}

	@GetMapping("/mypage/cart")
	public String cart(Model m) {
		List<Msw> cartList = service.cartList();
		m.addAttribute("cartList", cartList);
		return "member/mypage/cart";
	}


	@RequestMapping("/mypage/zzim") //찜
	public String zzim(Model m) {
		List<Msw> zzimList = service.zzimList();
		m.addAttribute("zzimList",zzimList);
		return "member/mypage/zzim";
	}

	@RequestMapping("/mypage/productOrder") //구매내역
	public String productOrder(Model m) {
		List<Msw> orderList = service.orderList();
		m.addAttribute("orderList",orderList);
		return "member/mypage/productOrder";
	}
	
	@RequestMapping("/baesong") //배송
	public String baesong() {
		return "/member/baesong";
	}
}

@Controller
class MswController2 { //검색 리스트
	@RequestMapping("/product/productList")
	public String productList() {
		return "/product/productList";
	}
}
