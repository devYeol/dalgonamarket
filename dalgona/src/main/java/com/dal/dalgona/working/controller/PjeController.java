package com.dal.dalgona.working.controller;

import java.io.IOException;
import java.util.Date;

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

import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.service.PjeService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
public class PjeController {
	@Autowired
	private PjeService service;
	
	// 상품등록버튼
//	@ResponseBody
	@RequestMapping("/enrollProductTest")
	public String insertStudent() {
		Product p=Product.builder().productAmount(10).productContent("이것은 달고나").productDate(new Date())
				.productPrice(1000).productName("달고나").build();
		service.insertProduct(p);
		return "redirect:adminManageProduct.do";
	}
	
	// 회원관리 페이지 이동
	@RequestMapping("/adminManageMember.do")
	public String adminManageMember() {
		return "admin/adminManageMember";
	}
	
	// 페이지테스트
	@RequestMapping("/pagingTest.do")
	public ModelAndView adminManageProduct(ModelAndView mv,
			@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="10") int numPerpage) {
		PageRequest pagerequest=PageRequest.of(cPage-1, numPerpage, Sort.by(Sort.Direction.DESC,"productCode"));
		Page<Product> list=service.selectProducts(pagerequest);
		mv.addObject("products",list.getContent());
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "pagingTest.do"));
		mv.setViewName("admin/pagingTest");
		return mv;
	}
	
	@RequestMapping("adminDeleteSelect.do")
	@ResponseBody
	public boolean deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String[] deleteArr=request.getParameterValues("deleteArr[]");
		boolean result=false;
		for(int i=0; i<deleteArr.length; i++) {
//			log.debug(deleteArr[i]);
			service.deleteByProductCode(Long.parseLong(deleteArr[i]));
		}
		result=true;
		return result;
	}
}
