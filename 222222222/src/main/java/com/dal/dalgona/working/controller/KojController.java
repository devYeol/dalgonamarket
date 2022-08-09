package com.dal.dalgona.working.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.working.model.service.KojServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KojController {
	
	@Autowired
	private KojServiceImpl service;
	
	@RequestMapping("/product/productDetail/{productCode}")	
	public String storeDetail(@PathVariable long productCode, Model model) {
		Product p=service.selectProduct(productCode);
		List<Review> review=service.reviewList();
		List<Qna> qna=service.qnaList();
		model.addAttribute("pro",p);
		model.addAttribute("review",review);
		return "product/productDetail";
	}

}
