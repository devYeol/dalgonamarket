package com.dal.dalgona.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Mypage_rwh {

	@RequestMapping("/mypage/rwh")
	public String rwh() {
 		return "mypage/rwh";
	}
	
	@RequestMapping("/sang")
	public String sang() {
		return "sang";
	}
	
	@RequestMapping("/mypage/zzim")
	public String zzim(){
		return "mypage/zzim";
	}
	
}
