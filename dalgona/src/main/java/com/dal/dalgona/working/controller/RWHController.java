package com.dal.dalgona.working.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.working.model.service.RwhService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class RWHController {
	
	@Autowired
	private RwhService service;

	@RequestMapping("/mypage/addressadd")
	public String addressadd() {
		return "mypage/addressadd";
		
	}
	@RequestMapping("/mypage/shippingset")
	public String shippingset() {
		return "mypage/shippingset";
		
	}
	
	//category
	@RequestMapping("/categoryDemo")
	@ResponseBody
	public Category insertCategory() {
		Category cate = Category.builder().categoryName("기타").build();
		Category result=service.insertCategory(cate);
		
		return result;
		
	}
	
	//상품등록 페이지에서 name명 가져와서 매개변수에 집어넣음
	@RequestMapping("/insertProduct.do") 
	public String insertProduct(
			  					@RequestParam(value="productAmount") int product_Ampont,
			  					@RequestParam(value="productContent") String product_Content,
			  					@RequestParam(value="thumbnail") MultipartFile thumbnail,
			  					@RequestParam(value="detailedImage") MultipartFile detailedImage,
			  					@RequestParam(value="productPrice") int product_Price,
			  					@RequestParam(value="productName") String product_Name,
			  					String categoryName,
			  					String[] optionName,
			  					int[] optionPrice,
			  					HttpServletRequest rs,Model model
			  					) throws IllegalStateException, IOException {
		//이부분 category로 조회
		Category c=service.selectCategory(categoryName);
		log.debug("{}",c); 

		
		String path = rs.getServletContext().getRealPath("/resources/upload/product/");
		File uploadDir = new File(path);
		//폴더없으면생성
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		File thumbnailFile = new File(path + "/" + thumbnail.getOriginalFilename());
		thumbnail.transferTo(thumbnailFile);
		File detailedImageFile = new File(path + "/" + detailedImage.getOriginalFilename());
		detailedImage.transferTo(detailedImageFile);
	
		String thumbnailFile1 = path+thumbnailFile;
		 log.debug("{}",thumbnailFile1);
		//System.out.println(thumbnailFile1);
		
		List<ProductOption> options= new ArrayList();
		
		//여기에
		Product p = Product.builder().productAmount(product_Ampont)
									 .productContent(product_Content)
									 .productPrice(product_Price)
									 .productName(product_Name)
									 .productThumb(thumbnail.getOriginalFilename())
									 .productImage(detailedImage.getOriginalFilename())
									 .productDate(new Date()).category(c).optionCode(options).build();
		  
		 log.debug("{}",p);
		 log.debug("{}",options);
		 
		 String oriName = thumbnail.getOriginalFilename();
		
		Product pro = service.insertProduct(p);
		
		String msg = "";
		String loc = "";
		
		if(pro != null) {
			msg = "상품등록 완료!";
			loc = "/admin/adminManageProduct.do";
		}else {
			msg = "상품등록 실패!";
			loc = "/admin/adminEnrollProduct.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	 
	@GetMapping("/admin/adminManageProduct.do")
	public String productList(Model model) {
			List<Product> result = service.productList();
			model.addAttribute("pro",result);
		return "admin/adminManageProduct";
	}
	
}
