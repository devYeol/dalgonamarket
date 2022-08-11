package com.dal.dalgona.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@GetMapping("/product/productList")
	public String productList() {
		return "product/productList";
	}
	
	@RequestMapping("/product/productDetail/{productCode}")	
	public String storeDetail(@PathVariable long productCode, Model model) {	
		Product p=service.selectProduct(productCode);
		List<Review> review=service.reviewList();
		List<Qna> qna=service.qnaList();
		model.addAttribute("pro",p);
		model.addAttribute("review",review);
		return "product/productDetail";
	}
	
	
//	@RequestMapping("/review/reviewWrite.do")//memberId,productCode
//	public String reviewWrite(
//			@RequestParam(value="loginmember") String loginmember,
//			@RequestParam(value="productCode") long productCode,
//			@RequestParam(value="reviewContent") String reviewContent,
//			@RequestParam(value="reviewImage") MultipartFile reviewImage,
//			@RequestParam(value="reviewStar") int reviewStar,												
//			HttpServletRequest rs,Model model
//			) throws IllegalStateException, IOException {
//			
//						
//	
//			
//		String path=rs.getServletContext().getRealPath("/resources/upload/review/");
//		File uploadDir=new File(path);
//		
//		if(!uploadDir.exists()) uploadDir.mkdirs();
//		
//		if(!reviewImage.isEmpty()) {
//			//리네임드처리하기
//			String originalFilename=reviewImage.getOriginalFilename();
//			String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
//			//리네임 명칭을 정할값 설정
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//			int rndNum=(int)(Math.random()*10000);
//			String rename=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
//						
//			//업로드처리하기
//			try {
//				reviewImage.transferTo(new File(path+rename));
//			}catch(IOException e) {
//				e.printStackTrace();
//			}
//		}
//		Review r=Review.builder().memberId(loginmember).productCode(productCode)
//				.reviewContent(reviewContent).reviewDate(new Date())
//				.reviewImage("이미지주소").reviewStar(reviewStar).build();
//		String msg="";
//		String loc="";
//		try {
//			service.reviewWrite(r);
//			msg="게시글입력성공";	
//			loc="/product/productDetail/{productCode}";
//		}catch(RuntimeException e) {
//			msg="게시글입력실패";	
//			loc="/product/productDetail/{productCode}";			
//		}
//		
//		model.addAttribute("msg",msg);
//	
//		return "common/msg";
//	}
	
	
//	@RequestMapping("/qna/qnawWrite.do")//
//	public String qnawWrite(){
//	
//	
//	}
}
