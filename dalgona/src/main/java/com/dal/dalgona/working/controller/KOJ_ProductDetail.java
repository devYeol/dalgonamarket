package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KOJ_ProductDetail {
	
	@RequestMapping("/product/productDetail")
	public String storeDetail() {
		return "product/productDetail";
	}

}
