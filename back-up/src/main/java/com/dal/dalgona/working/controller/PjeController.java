package com.dal.dalgona.working.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.service.PjeService;

@RequestMapping("/admin")
@Controller
public class PjeController {
	@Autowired
	private PjeService service;
	
//	@ResponseBody
	@RequestMapping("/enrollProductTest")
	public String insertStudent() {
		Product p=Product.builder().productAmount(10).productContent("이것은 달고나").productDate(new Date())
				.productPrice(1000).productName("달고나").build();
		
		service.insertProduct(p);
		return "redirect:adminManageProduct.do";
	}
}
