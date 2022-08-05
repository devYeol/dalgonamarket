package com.dal.dalgona.working.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dal.dalgona.working.model.service.KojService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KojController {
	
	@Autowired
	private KojService service;
	
	@RequestMapping("/product/productDetail/{productCode}")	
	public String storeDetail(@PathVariable long productCode, Model model) {
		//service.selectProduct(productCode);
		return "product/productDetail";
	}

}
