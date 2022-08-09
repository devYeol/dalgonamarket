package com.dal.dalgona.working.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.service.MswService;

@Controller
@RequestMapping("/member")
public class MswController {

	@Autowired
	private MswService service;

	@GetMapping("/ajax.do") //
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
	
//	@RequestMapping("/mypage/cart") //장바구니
//	public ModelAndView cart(ModelAndView mv,HttpSession session ) {
//		String memberId = (String)session.getAttribute("memberId"); 
//		Map<String,Object>map=new HashMap<String,Object>();
//		List<Product>cartList =service.cartList(memberId); //장바구니 정보
//		int sumMoney =service.sumMoney(memberId);// 장바구니 전체 금액 호출
//		int fee = 2000; //배송료
//		map.put("cartList", cartList);
//		map.put("count", cartList.size());
//		map.put("sumMoney", sumMoney);
//		map.put("fee", fee); 
//		map.put("allSum", sumMoney); // 체크된 장바구니 상품 + 배송비
//		mv.addObject("map",map);
//		mv.setViewName("member/mypage/cart");
//		return mv;
//		
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
