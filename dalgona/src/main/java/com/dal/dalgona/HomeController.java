package com.dal.dalgona;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
//	@Autowired
//	private HomeService service;
	
	@RequestMapping("/")
	public String index() {
	//	List<OrderDetail> orderDetail = service.selectOrderDetail();
		
		return "index";
	}
	
}
