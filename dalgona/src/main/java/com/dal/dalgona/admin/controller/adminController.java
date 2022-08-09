package com.dal.dalgona.admin.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.admin.model.service.adminService;
import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
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
		List<Product> list=service.selectProducts();
		mv.addObject("products",list);
		mv.setViewName("admin/adminManageProduct");
		return mv;
	}
	
	// 상품등록버튼
//	@ResponseBody
	@RequestMapping("/enrollProductTest")
	public String insertStudent() {
		Product p=Product.builder().productAmount(10).productContent("이것은 달고나").productDate(new Date())
				.productPrice(1000).productName("달고나").build();
		service.insertProduct(p);
		return "redirect:adminManageProduct.do";
	}
	
	// 상품관리 - 삭제기능
	@RequestMapping("adminDeleteProduct.do")
	@ResponseBody
	public boolean deleteProduct(long productCode, HttpServletResponse response) throws IOException{
		Long result=service.deleteByProductCode(productCode);
		return result>0;
	}
	
	// 상품관리 - 선택삭제기능
	@RequestMapping("adminDeleteSelect.do")
	@ResponseBody
	public boolean adminDeleteSelect(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String[] deleteArr=request.getParameterValues("deleteArr[]");
		boolean result=false;
		for(int i=0; i<deleteArr.length; i++) {
//				log.debug(deleteArr[i]);
			service.deleteByProductCode(Long.parseLong(deleteArr[i]));
		}
		result=true;
		return result;
	}
	
	// 주문관리 페이지 이동
	@RequestMapping("adminManageOrder.do")
	public String adminManageOrder() {
		return "admin/adminManageOrder";
	}
	
	// 페이지테스트
	@RequestMapping("/adminManageProduct.do")
	public ModelAndView adminManageProduct(ModelAndView mv,
			@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage) {
		PageRequest pagerequest=PageRequest.of(cPage-1, numPerpage, Sort.by(Sort.Direction.DESC,"productCode"));
		Page<Product> list=service.selectProducts(pagerequest);
		mv.addObject("products",list.getContent());
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageProduct");
		return mv;
	}
}
