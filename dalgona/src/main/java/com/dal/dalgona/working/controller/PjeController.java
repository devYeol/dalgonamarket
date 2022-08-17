
package com.dal.dalgona.working.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;
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
		mv.addObject("members", list);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("searchGen", searchGen);
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(totalData, numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}
	
	// 주문내역 불러오기
	@RequestMapping("adminManageOrder.do")
	public ModelAndView adminManageOrder(ModelAndView mv,
			@RequestParam(defaultValue = "1") int cPage, 
			@RequestParam(defaultValue = "25") int numPerpage,
			@RequestParam(value = "orderCode", defaultValue = "0") long orderCode
			) {
		PageRequest pagerequest = PageRequest.of(cPage - 1, numPerpage,Sort.by(Sort.Direction.ASC, "orderDate"));
		Page<ProductOrder> list=service.searchOrders(pagerequest);
		if (orderCode != 0) {
			ProductOrder order=service.selectProductOrder(orderCode);
			List<OrderDetail> orderDetails=service.selectOrderDetailsCode(orderCode);
			mv.addObject("order",order);
			mv.addObject("orderDetails",orderDetails);
//			log.debug("{}",order);
		}
		// log.debug("{}",list);
		mv.addObject("productOrders",list.getContent());
		mv.addObject("pageBar", PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageOrder.do"));
		mv.setViewName("admin/adminManageOrder");
		return mv;
	}
	
	@RequestMapping("adminOrderPermit.do")
	@ResponseBody
	public String adminOrderPermit(long orderCode, HttpServletResponse response) throws IOException {
		ProductOrder result = service.adminOrderPermit(orderCode);
		return result.getOrderStatus();
	}
	
	@RequestMapping("adminOrderCancel.do")
	@ResponseBody
	public String adminOrderCancel(long orderCode, HttpServletResponse response) throws IOException {
		ProductOrder result = service.adminOrderCancel(orderCode);
		return result.getOrderStatus();
	}

}
