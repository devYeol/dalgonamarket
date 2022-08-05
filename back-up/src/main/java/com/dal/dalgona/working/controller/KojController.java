//package com.dal.dalgona.working.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.dal.dalgona.common.model.vo.Product;
//import com.dal.dalgona.working.model.service.KojService;
//
//@Controller
//public class KojController {
//	
//	@Autowired
//	private KojService service;
//	
//	@RequestMapping("/product/productDetail")	
//	public String storeDetail(@PathVariable String productCode, @PathVariable String optionCode,Model model ) {
//		
//		//List<Product> proList=service.productList(productCode,optionCode);
//		return "product/productDetail";
//	}
//
//}
