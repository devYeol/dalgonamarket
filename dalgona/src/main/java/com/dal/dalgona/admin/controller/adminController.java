package com.dal.dalgona.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.admin.model.service.adminService;
import com.dal.dalgona.common.model.vo.Product;

@RequestMapping("/admin")
@Controller
public class adminController {
	@Autowired
	adminService service;
	
	// 관리자 메인 이동
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 상품등록 페이지 이동
	@RequestMapping("adminEnrollProduct.do")
	public String adminEnrollProduct() {
		return "admin/adminEnrollProduct";
	}
	
	// 상품관리 페이지 이동
	@RequestMapping("adminManageProduct.do")
	public ModelAndView adminManageProduct(ModelAndView mv) {
//		PageRequest pageRequest = PageRequest.of(0, 5);
//		Page<Product> list=service.selectProducts(pageRequest);
//		mv.addObject("products",list);
		mv.setViewName("admin/adminManageProduct");
		return mv;
	}
	
	// 상품관리 - 삭제기능
	@RequestMapping("adminDeleteProduct.do")
	@ResponseBody
	public boolean deleteProduct(long productCode, HttpServletResponse response) throws IOException{
		Long result=service.deleteByProductCode(productCode);
		return result>0;
	}
	
	// 주문관리 페이지 이동
	@RequestMapping("adminManageOrder.do")
	public String adminManageOrder() {
		return "admin/adminManageOrder";
	}
}
