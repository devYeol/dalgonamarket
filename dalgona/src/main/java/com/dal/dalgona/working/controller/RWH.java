package com.dal.dalgona.working.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;


@Controller
public class RWH {
	
//	@Autowired
//	RwhService service;
	
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
	public String insertProduct(@RequestParam(value="productCode") long product_Code,
			  					@RequestParam(value="productAmount") int product_Ampont,
			  					@RequestParam(value="productContent") String product_Content,
			  					@RequestParam(value="productDate") Date produnt_Date,
			  					@RequestParam(value="productImage") String product_Image,
			  					@RequestParam(value="productPrice") int product_Price,
			  					@RequestParam(value="productThumb") String product_Tumb,
			  					@RequestParam(value="categoryCode") String category_Code,
			  					@RequestParam(value="productName") String product_Name,
			  					String[] optionName,
			  					int[] optionPrice
			  					) {
		
		
									/*
									 * Product p =
									 * Product.builder().productCode(product_Code).productAmount(product_Ampont).
									 * productContent(product_Content)
									 * .productDate(produnt_Date).productImage(product_Image).productPrice(
									 * product_Price).productThumb(product_Tumb) .productName(product_Name).build();
									 */		
		List<ProductOption> options=new ArrayList();
		
		/*
		 * for(int i=0;i<optionName.length;i++) {
		 * options.add(ProductOption.builder().oprionName(optionName[i]).optionPrice(
		 * optionPrice[i]).product(p).build()); }
		 */
		
		//service.inserProduct(p);
		
		
		  return "admin/adminManageProduct";
	}
	 
	
}
