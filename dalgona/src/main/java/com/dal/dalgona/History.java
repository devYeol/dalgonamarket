package com.dal.dalgona;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class History {
	
	@RequestMapping("/rwh/")
	public String rwh() {
		return "rwh";
	}
	
}
