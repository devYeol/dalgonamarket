package com.dal.dalgona.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("/store/storeDetail")
	public String storeDetail() {
		return "store/storeDetail";
	}

}
