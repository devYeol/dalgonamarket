package com.dal.dalgona.mswcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MswController {

	
	@RequestMapping("/msw/msw")
	public String msw() {
		return "/msw/msw";
	}
}
