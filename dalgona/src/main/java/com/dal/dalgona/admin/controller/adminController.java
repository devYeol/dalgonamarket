package com.dal.dalgona.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.admin.model.service.adminService;
import com.dal.dalgona.common.model.vo.Product;

@RequestMapping("/admin")
@Controller
public class adminController {
	@Autowired
	adminService service;
	
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("adminEnrollProduct.do")
	public String adminEnrollProduct() {
		return "admin/adminEnrollProduct";
	}
	
	@RequestMapping("adminManageProduct.do")
	public ModelAndView adminManageProduct(ModelAndView mv) {
		List<Product> list=service.selectProducts();
		return mv;
	}
	
	@RequestMapping("adminManageOrder.do")
	public String adminManageOrder() {
		return "admin/adminManageOrder";
	}
}
