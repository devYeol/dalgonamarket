package com.dal.dalgona.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class adminController {
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("adminEnrollProduct.do")
	public String adminEnrollProduct() {
		return "admin/adminEnrollProduct";
	}
	
	@RequestMapping("adminManageProduct.do")
	public String adminManageProduct() {
		return "admin/adminManageProduct";
	}
}
