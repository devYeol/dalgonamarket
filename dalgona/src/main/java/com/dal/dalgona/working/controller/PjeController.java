
package com.dal.dalgona.working.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.service.PjeServiceImpl;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")

@Controller

@Slf4j
public class PjeController {

	@Autowired
	private PjeServiceImpl service;

	// 회원관리 페이지 이동
	@RequestMapping("adminManageMember.do")
	public ModelAndView adminManageMember(ModelAndView mv,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "25") int numPerpage) {
		PageRequest pagerequest = PageRequest.of(cPage - 1, numPerpage,Sort.by(Sort.Direction.ASC, "memberEnrollDate"));
		Page<Member> list = service.selectMembers(pagerequest);
		mv.addObject("members", list.getContent());
		mv.addObject("pageBar", PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageMember.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}
	
	// 회원관리 검색기능
	@RequestMapping("adminSearchMember.do")
	public ModelAndView adminSearchMember(ModelAndView mv, 
			@RequestParam(value = "searchType") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, 
			@RequestParam(value = "searchGen", defaultValue = "") String searchGen,
			@RequestParam(defaultValue = "1") int cPage, 
			@RequestParam(defaultValue = "25") int numPerpage) {
		log.debug(searchType + " " + keyword + " " + searchGen);
		Map<String,Object> param=new HashMap();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		param.put("searchGen", searchGen);
		param.put("cPage", cPage);
		param.put("numPerpage", numPerpage);
		List<Member> list=service.searchMembers(param);
		int totalData=service.searchMembersCount(param);
		log.debug(""+totalData);
		mv.addObject("members", list);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("searchGen", searchGen);
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(totalData, numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}

}
