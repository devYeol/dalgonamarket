package com.dal.dalgona.working.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dal.dalgona.common.model.vo.Product;

@Controller
public class RWH {
	
	@RequestMapping("/member/mypage/rwh")
	public String rwh() {
 		return "/member/mypage/rwh";
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
	
	@RequestMapping("/insertProduct") 
	public String insertProduct(@RequestParam(value="productCode") String product_Code,
			  					@RequestParam(value="productAmount") int product_Ampont,
			  					@RequestParam(value="productContent") String product_Content,
			  					@RequestParam(value="productDate") Date produnt_Date,
			  					@RequestParam(value="productImage") String product_Image,
			  					@RequestParam(value="productPrice") int product_Price,
			  					@RequestParam(value="productThumb") String product_Tumb,
			  					/* @RequestParam(value="categoryCode") String category_Code, */
			  					@RequestParam(value="productName") String product_Name) {
		
		Product p = Product.builder().productCode(product_Code).productAmount(product_Ampont).productContent(product_Content)
					.productDate(produnt_Date).productImage(product_Image).productPrice(product_Price).productThumb(product_Tumb)
					.productName(product_Name).build();
		  return "admin/adminManageProduct";
	}
	 
	
}
