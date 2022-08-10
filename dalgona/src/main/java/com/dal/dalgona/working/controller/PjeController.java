package com.dal.dalgona.working.controller;

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

import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.service.PjeService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
public class PjeController {
	@Autowired
	private PjeService service;
	
	// 회원관리 페이지 이동
	@RequestMapping("adminManageMember.do")
	public ModelAndView adminManageMember(ModelAndView mv,
			@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="25") int numPerpage) {
		PageRequest pagerequest=PageRequest.of(cPage-1, numPerpage, Sort.by(Sort.Direction.ASC,"memberEnrollDate"));
		Page<Member> list=service.selectMembers(pagerequest);
		mv.addObject("members",list.getContent());
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}
	
	@RequestMapping("adminSearchMember.do")
	public ModelAndView adminManageMember(ModelAndView mv,
			@RequestParam(value="searchType") String searchType,
			@RequestParam(value="keyword") String keyword,
			@RequestParam(value="searchGen") String searchGen,
			@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="25") int numPerpage
			) {
		log.debug(searchType+" "+keyword+" "+searchGen);
		PageRequest pagerequest=PageRequest.of(cPage-1, numPerpage, Sort.by(Sort.Direction.ASC,"memberEnrollDate"));
//		Page<Member> list=service.searchMembers(pagerequest, searchType, keyword, searchGen);
//		mv.addObject("members",list.getContent());
//		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}
	
}
