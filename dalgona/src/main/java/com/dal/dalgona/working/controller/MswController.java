package com.dal.dalgona.working.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.service.MswService;

@Controller
@RequestMapping("/member")
public class MswController {

	@Autowired
	private MswService service;

	@GetMapping("/ajax.do") //장바구니
	public String getProduct(Model mo) {
		List<Product> p = service.selectProduct();
		mo.addAttribute("p", p);
		return "redirect:/";
	}
	
	@GetMapping("/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}

//	@GetMapping("/mypage/cart") //장바구니
//	@ResponseBody
//	public ModelAndView cart(String id,ModelAndView mw) {
//		mw.addObject("cartList",service.cartList(id));
//		mw.setViewName("mypage/cart");
//		return mw;
//	}
	
	@GetMapping("/mypage/cart") //장바구니
	public String cart(Model mo) {
		List<Product> cartList = service.cartList();
		mo.addAttribute("cartList", cartList);
		return "member/mypage/cart";
	}
//	
//	@RequestMapping(value = "/mypage/cart/{productId)") //장바구니
//	public @ResponseBody String  cart(@PathVariable
//			("productCode") String productCode,
//			HttpSession session ) {
//		Member m=(Member)session.getAttribute("loginMember");
//		String userId = m.getMemberId(); 
//		
//		Cart c =new Cart();
////		c.setMemberId(userId);
//		
//		return "member/mypage/cart";
//	}


	@GetMapping("/mypage/zzim") //찜
	public String zzim(Model mo) {
		List<Product> zzimList = service.zzimList();
		mo.addAttribute("zzimList",zzimList);
		return "member/mypage/zzim";
	}

	@GetMapping("/mypage/productOrderList") //구매내역
	public String productOrder(Model mo) {
		List<Product> orderList = service.orderList();
		mo.addAttribute("orderList",orderList);
		return "member/mypage/productOrderList";
	}
	
	
	@GetMapping("/mypage/shippingset")
	public String shippingset() {
		return "member/mypage/shippingset";
		
	}
	
	@GetMapping("/mypage/addressadd")
	public String addressadd() {
		return "member/mypage/addressadd";
		
	}
	
	@GetMapping("/baesong") //배송
	public String baesong() {
		return "/member/baesong";
	}
}

@Controller
class MswController2 { //검색 리스트
	@GetMapping("/product/productList")
	public String productList() {
		return "product/productList";
	}
}
