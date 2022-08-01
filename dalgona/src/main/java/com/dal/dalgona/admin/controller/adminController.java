package com.dal.dalgona.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class adminController {
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain2";
	}
}
