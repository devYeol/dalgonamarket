package com.dal.dalgona.working.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.working.model.service.RwhService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class RWH {
	
	@Autowired
	private RwhService service;
	
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
	
	//category
	@RequestMapping("/categoryDemo")
	@ResponseBody
	public Category insertCategory() {
		Category cate = Category.builder().categoryName("기타").build();
		/*Category cate2 = Category.builder().categoryCode(3).categoryName("초코").build();
		Category cate3 = Category.builder().categoryCode(4).categoryName("젤리").build();
		Category cate4 = Category.builder().categoryCode(5).categoryName("완구").build();
		Category cate5 = Category.builder().categoryCode(6).categoryName("기타").build();*/
		Category result=service.insertCategory(cate);
		
		return result;
		
	}
	
	//상품등록 페이지에서 name명 가져와서 매개변수에 집어넣음
	@RequestMapping("/insertProduct") 
	public String insertProduct(
			  					@RequestParam(value="productAmount") int product_Ampont,
			  					@RequestParam(value="productContent") String product_Content,
			  					MultipartFile[] upfile,
			  					@RequestParam(value="productPrice") int product_Price,
			  					@RequestParam(value="productName") String product_Name,
			  					String categoryName,
			  					String[] optionName,
			  					int[] optionPrice
			  					) {
									
		Category c=service.selectCategory(categoryName);
		log.debug("{}",c);

		Product p = Product.builder().productAmount(product_Ampont).
				productContent(product_Content).productPrice(
				product_Price).productName(product_Name).category(c).build();
									 		
		List<ProductOption> options= new ArrayList();
		
		
		  for(int i=0;i<optionName.length;i++) {
			  options.add(ProductOption.builder().oprionName(optionName[i]).optionPrice(
			  optionPrice[i]).product(p).build());
		  }
		  
		 log.debug("{}",p);
		 log.debug("{}",options);
		 
		
		//service.insertProduct(p);
		
		
		return "admin/adminManageProduct";
		
	}
	 
	
}
