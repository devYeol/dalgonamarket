package com.dal.dalgona.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale.Category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	// Shop페이지이동
	@GetMapping("/product/productList")
	public ModelAndView productList(ModelAndView mv,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "20") int numPerpage) {
		List<Product> list = service.selectProducts();
		mv.addObject("products", list);
		mv.setViewName("/product/productList");
		return mv;
	}
	
	@RequestMapping("/product/productDetail/{productCode}")	
	public String storeDetail(@PathVariable long productCode, Model model) {	
		Product p=service.selectProduct(productCode);
		List<ProductOption> op=service.optionList(productCode);
		List<Review> review=service.reviewList(productCode);
		List<Qna> qna=service.qnaList(productCode);
		
//		Review star=service.starAvg(productCode);
//		log.debug("{}",star);
		
//		log.debug("{}",op);
//		log.debug("{}",review);
		
		
		
		model.addAttribute("pro",p);
		model.addAttribute("op",op);
		model.addAttribute("review",review);
		model.addAttribute("qna",qna);
//		model.addAttribute("star",star);
		
		
		return "product/productDetail";
	}
	
	
	
	
	@RequestMapping("/review/reviewWrite.do")
	public String review( 
			@RequestParam(value="productCode") long productCode,
			@RequestParam(value="reviewContent") String reviewContent,
			@RequestParam(value="reviewStar", required = false) int reviewStar,
			@RequestParam(value = "reviewImage", required = false) MultipartFile reviewImage,	
			HttpServletRequest rs, HttpSession session)  throws IllegalStateException, IOException {
		Member m = (Member) session.getAttribute("loginMember");
		String memberId = m.getMemberId();
		
		
		
		String reviewImagePath="";		
			String path = rs.getServletContext().getRealPath("/resources/upload/product/review/");
			File uploadDir = new File(path);
			if (!uploadDir.exists())
				uploadDir.mkdirs();
			File reviewImageFile = new File(path);
	
			if (!(reviewImage.isEmpty())) {
	
				String originalFilename = reviewImage.getOriginalFilename();
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));		
				int random = (int) (Math.random() * 10000);
				String rename = "review_" + random + ext;
				
				reviewImageFile = new File(path + "/" + rename);
				reviewImage.transferTo(reviewImageFile);
			}
			
			String aa = path + reviewImageFile.getName();
	
			// 이미지주소자르기 썸네일
			String target = "resources";
			int target_num = aa.indexOf(target) - 1;
			reviewImagePath = aa.substring(target_num);
			log.debug("리뷰이미지{}",reviewImagePath);
			
		
		Review review=Review.builder().memberId(memberId).productCode(productCode)
				.reviewContent(reviewContent).reviewImage(reviewImagePath).reviewDate(new Date()).reviewStar(reviewStar).review(null).build();
		
		log.debug("{}",review);

	    service.reviewWrite(review);
	 
	    return "redirect:/product/productDetail/"+productCode;
	}
		
	
	@RequestMapping("/qna/qnawWrite.do/{productCode}")//
	public String qnawWrite(@PathVariable long productCode, Model model){
		model.addAttribute("productCode",productCode);
		return "product/qnawWrite";
	}
	
	
	@RequestMapping("/qna/qnawWriteEnd.do")//
	public String qnawWriteEnd(
			@RequestParam(value="qnaTitle") String qnaTitle,
			@RequestParam(value="qnaContent") String qnaContent,
			@RequestParam(value="productCode") long productCode,
			Model model,HttpSession session){
		Member m = (Member) session.getAttribute("loginMember");
		
		Product p=service.selectProduct(productCode);	
		String msg="";
		String loc="";
		if(m !=null) {
			Qna q=Qna.builder().qnaDate(new Date()).member(m).product(p).qnaContent(qnaContent).qnaTitle(qnaTitle).build();			
			int result=service.qnaWrite(q);
			msg="등록완료";
			loc="/product/productDetail/"+p.getProductCode();
		}else {			
			msg="등록실패";	
			loc="/product/productDetail/"+p.getProductCode();		
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
			
		return "common/msg";
	}
	@RequestMapping("/qna/qnaView.do")
	public ModelAndView qnaView(long qnaCode, ModelAndView mv) {
		Qna q=service.qnaSelectOne(qnaCode);
		System.out.println(q);
		mv.addObject("qna",service.qnaSelectOne(qnaCode));
		mv.setViewName("product/qnaView");
		return mv;
	}
	
	@RequestMapping("/product/payment.do")
	public String payment(Product p, ProductOrder po,DeliveryLocation dl 
			, HttpSession session, Model model
			,@RequestParam(value="selAmount", required = false ) int[] selAmount
			,@RequestParam(value="selectedOpt", required = false) String selectedOpt
			,@RequestParam(value="productName", required = false ) String productName
			) 
	{
		Member m = (Member) session.getAttribute("loginMember");
		log.debug("{}",p);
//		log.debug("{}",po);
//		log.debug("{}",dl);
		log.debug("{}",productName);
		log.debug("{}",selAmount);
		log.debug("{}",selectedOpt);
		
//		dl=service.selectaddrBase(m);//여기서 기본배송지 선택해서
//		po=ProductOrder.builder().orderDate(new Date()).orderStatus("디폴").selectLocation(dl).build();
//		Product p;
//		int selsu=1;
//		String op="바보";
//		OrderDetail od=OrderDetail.builder().productOrder(po).orderOption(op).orderAmount(selsu).product(p).build();		
//		log.debug("{}",op);
		return "order/payment/payment";
	}
	
	//검색
		@RequestMapping("/product/search.do")
		public String search(@RequestParam(value="keyword") String keyword, Model m) {
			
			System.out.println("keyword : " + keyword);
			List<Product> p = service.searchList(keyword);
			
			m.addAttribute("products", p);
			System.out.println("keyword : " + p);
			
			return "product/productList";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
