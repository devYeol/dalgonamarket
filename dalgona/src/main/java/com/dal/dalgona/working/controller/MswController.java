package com.dal.dalgona.working.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MswController {

	@RequestMapping("/product/productList")
	public String msw() {
		return "/product/productList";
	}
	
}
