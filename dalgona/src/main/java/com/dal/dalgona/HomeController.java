package com.dal.dalgona;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.product.model.service.ProductServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
//	@Autowired
//	private HomeService service;
	
	@Autowired
	private ProductServiceImpl service;
	
	@RequestMapping("/")
	public ModelAndView index(ModelAndView mv) {
	//	List<OrderDetail> orderDetail = service.selectOrderDetail();
		List<Product> topBuy=service.selectTopBuy();
		List<Product> topZzim=service.selectTopZzim();
		mv.addObject("topBuy",topBuy);
		mv.addObject("topZzim",topZzim);
		mv.setViewName("index");
		return mv;
	}
	
}
