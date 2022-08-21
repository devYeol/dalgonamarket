package com.dal.dalgona.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;
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
		 @RequestParam(value="categoryName", defaultValue="") String categoryName,
		 @RequestParam(value="searchSeq", defaultValue="최신순") String searchSeq,
		 @RequestParam(value="searchOrder", defaultValue="DESC") String searchOrder,
         @RequestParam(defaultValue = "1") int cPage,
         @RequestParam(defaultValue = "20") int numPerpage) {
      Map<String,Object> param=new HashMap();
	  param.put("categoryName", categoryName);
	  param.put("searchOrder", searchOrder);
	  List<Product> list = new ArrayList();
	  if (searchSeq.equals("인기순")) {
		  param.put("searchSeq", searchSeq);
		  list = service.selectProductsPlusPop(param);
	  } else {
		  param.put("searchSeq", searchSeq);
		  list = service.selectProductsPlus(param);
	  }
	  long listCounts = list.size();
      log.debug("{}",list);
      mv.addObject("categoryName", categoryName);
      mv.addObject("searchSeq", searchSeq);
      mv.addObject("searchOrder", searchOrder);
      mv.addObject("products", list);
      mv.addObject("listCounts",listCounts);
      mv.setViewName("/product/productList");
      return mv;
   }
   
   @RequestMapping("/product/productDetail/{productCode}")   
   public String storeDetail(@PathVariable long productCode, Model model, HttpSession session) throws Exception{   
      Product p=service.selectProduct(productCode);
      List<ProductOption> op=service.optionList(productCode);
      List<Review> review=service.reviewList(productCode);
      List<Qna> qna=service.qnaList(productCode);
      Member m = (Member) session.getAttribute("loginMember");     
      int likesCheck=0;
      int likesCount=service.likesCount(productCode);     
      if(m!=null) {
    	  String memberId=m.getMemberId();
    	  likesCheck= service.selLikes(productCode, memberId);
//    	  log.debug("{}체크용",likeCheck);
      }
      double star=0.0;
      if(review.size()!=0) {
	      star=service.starAvg(productCode);
//	      log.debug("{}별점",star);
      }
      
      
//      log.debug("{}찜수",likesCount);     
//      log.debug("{}",op);
//      log.debug("{}",review);
//      log.debug("{}",qna);
      
      
      model.addAttribute("pro",p);
      model.addAttribute("op",op);
      model.addAttribute("review",review);
      model.addAttribute("qna",qna);
      model.addAttribute("likesCheck",likesCheck);
      model.addAttribute("likesCount",likesCount);
      model.addAttribute("star",star);
      
      
      return "product/productDetail";
   }

   
   
   
   @RequestMapping("/review/reviewWrite.do")
   public String review( 
         @RequestParam(value="productCode") long productCode,
         @RequestParam(value="reviewContent") String reviewContent,
         @RequestParam(value="reviewStar", required = false) int reviewStar,
         @RequestParam(value = "reviewImage", required = false) MultipartFile reviewImage,   
         HttpServletRequest rs, HttpSession session, Model model)  throws IllegalStateException, IOException {
	     Member m = (Member) session.getAttribute("loginMember");
	     String memberId="";
   
	     String reviewImagePath="";      
         String path = rs.getServletContext().getRealPath("/resources/upload/review/");
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
            String pathReview = path + reviewImageFile.getName();
            
            String target = "resources";
            int target_num = pathReview.indexOf(target) - 1;
            reviewImagePath = pathReview.substring(target_num);
         }

//         log.debug("리뷰이미지{}",reviewImagePath);
             
      String msg="";
      String loc="";
       if(m !=null) {
    	  memberId = m.getMemberId();
          Review review=Review.builder().memberId(memberId).productCode(productCode)
               .reviewContent(reviewContent).reviewImage(reviewImagePath)
               .reviewDate(new Date()).reviewStar(reviewStar).review(null).build();
          
          service.reviewWrite(review);
               
         msg="등록완료";
         loc="/product/productDetail/"+productCode;
      }else {         
         msg="로그인이 필요합니다";   
         loc="/loginpage";      
      }
       
       model.addAttribute("msg",msg);
       model.addAttribute("loc",loc);
    
//       return "redirect:/product/productDetail/"+productCode;
       return "common/msg";
   }
      
   
   @RequestMapping("/qna/qnawWrite.do/{productCode}")//
   public String qnawWrite(@PathVariable long productCode, Model model){
      model.addAttribute("productCode",productCode);
      return "product/qnawWrite";
   }
   
   
   @RequestMapping("/qna/qnawWriteEnd.do")//
   public void qnawWriteEnd(
         @RequestParam(value="qnaTitle") String qnaTitle,
         @RequestParam(value="qnaContent") String qnaContent,
         @RequestParam(value="productCode") long productCode,
         Model model,HttpSession session){
      Member m = (Member) session.getAttribute("loginMember");     
      Product p=service.selectProduct(productCode);       
      Qna q=Qna.builder().qnaDate(new Date()).member(m).product(p).qnaContent(qnaContent).qnaTitle(qnaTitle).build();         
      int result=service.qnaWrite(q);
     
     
//      String msg="";
//      String loc="";
//      if(m !=null) {
//    	 Qna q=Qna.builder().qnaDate(new Date()).member(m).product(p).qnaContent(qnaContent).qnaTitle(qnaTitle).build();         
//         int result=service.qnaWrite(q);
//         msg="등록완료";
//         loc="/product/productDetail/"+p.getProductCode();
//      }else {         
//         msg="등록실패";   
//         loc="/product/productDetail/"+p.getProductCode();      
//      }   
//      model.addAttribute("msg",msg);
//      model.addAttribute("loc",loc);
//         
//      return "common/msg";
   }
   @RequestMapping("/qna/qnaView.do")
   public ModelAndView qnaView(long qnaCode, ModelAndView mv) {
      Qna q=service.qnaSelectOne(qnaCode);
//      System.out.println(q);
      mv.addObject("qna",service.qnaSelectOne(qnaCode));
      mv.setViewName("product/qnaView");
      return mv;
   }
   
   @RequestMapping("/product/search.do")
   public String search(@RequestParam(value="keyword") String keyword, Model m) {
      
      System.out.println("keyword : " + keyword);
      List<Product> p = service.searchList(keyword);
      
      m.addAttribute("products", p);
      System.out.println("keyword : " + p);
      
      return "product/productList";
   }
   
   @RequestMapping("/product/likes")
   @ResponseBody
   public String likes(long productCode, String likes, HttpServletRequest request, Model model,
		   HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {	   
	    Member m = (Member) session.getAttribute("loginMember");
	    String memberId="";
	    Product p=service.selectProduct(productCode);
	    
//	    log.debug("{}",m);
	    
	    String msg="";
	    String loc="";
	    
	    if (m != null) {	    	
	    	System.out.println("찜하기 회원");
		    memberId = m.getMemberId();
		    service.likes(productCode, likes, memberId);        
	    } else {
//	    	msg="로그인이 필요합니다";   
//	        loc="/loginpage";
	    }
	   
	    model.addAttribute("msg",msg);
	    model.addAttribute("loc",loc);
	    return memberId;
   }
   
   	@RequestMapping("/product/reviewDelete.do")
	@ResponseBody
	public boolean deleteReview(long reviewCode, HttpServletResponse response) throws IOException {
		Long result = service.deleteByReviewCode(reviewCode);
		return result > 0;
	}
   	
   	@RequestMapping("/product/qnaDelete.do")
	@ResponseBody
	public boolean deleteQna(long qnaCode, HttpServletResponse response) throws IOException {
		Long result = service.deleteByQnaCode(qnaCode);
		return result > 0;
	}
   	
   	@RequestMapping("/product/selectUpdateReview.do")
	public String selectUpdateProduct(long reviewCode, Model model) {
	
   		Review r = service.selectOneReview(reviewCode);
		model.addAttribute("r", r);		
		
		return "product/reviewUpdate";
	}
   	
    @RequestMapping("/product/updateReview.do")
    public void reviewUpdate( 
          @RequestParam(value="productCode") long productCode,
          @RequestParam(value="reviewContent") String reviewContent,
          @RequestParam(value="memberId") String memberId,
          @RequestParam(value="reviewStar", required = false) int reviewStar,
          @RequestParam(value="reviewCode", required = false) long reviewCode,
          @RequestParam(value="beforReviewImage") String beforReviewImage,//이전 리뷰 이미지
          @RequestParam(value = "reviewImage", required = false) MultipartFile reviewImage,//업데이트 리뷰이미지   
          HttpServletRequest rs, HttpSession session, Model model)  throws Exception,IllegalStateException, IOException {
    		
    	
		String path = rs.getServletContext().getRealPath(beforReviewImage);	 
//		log.debug("패스 : {}",path);
		
		File f = null;
			
		String updatePath = rs.getServletContext().getRealPath("/resources/upload/review/");
		File uploadDir = new File(updatePath);
		
		int random = (int) (Math.random() * 10000);
				
		Review review=Review.builder().reviewCode(reviewCode).memberId(memberId).productCode(productCode)
	               .reviewContent(reviewContent).reviewDate(new Date())
	               .reviewStar(reviewStar).review(null).build();
	
		String rename="";
		if(reviewImage.isEmpty()) {  
			
			String target = "resources";
//			String updateReviewFile = path;
			int target_num = updatePath.indexOf(target) - 1;
			String reviewPath = path.substring(target_num);;
			review.setReviewImage(reviewPath);
//			log.debug(" 리뷰경로 : {}",reviewPath);
		}
		if(!reviewImage.isEmpty()) {
			f = new File(path);
			File reviewImageFile = new File(updatePath);
	
			String originalFilename = reviewImage.getOriginalFilename();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			rename = "review_" + random + ext;
			
			reviewImageFile = new File(updatePath + "/" + rename);
			reviewImage.transferTo(reviewImageFile);
			
			String updatefileName = updatePath + reviewImageFile.getName();
			
			// 이미지주소자르기 썸네일
			String target = "resources";
			int target_num = updatefileName.indexOf(target) - 1;
			String reviewImagePath = updatefileName.substring(target_num);
			review.setReviewImage(reviewImagePath);
//			log.debug(reviewImagePath);
			
//			log.debug("여기까지 : {}",review);
			
			
		}

		try {
			service.updateReview(review);
		
			//이전 파일 지우는 로직
			if(f != null) {
				//db를 거치고나서 만약 db가 수정이 완료되면 밑에 폴더삭제
		      uploadFileDelete(f);
			}
		}catch(RuntimeException e) {
			uploadFileDelete(new File(updatePath+"/"+rename));
		}   
    	
    	
    }
    
  //파일삭제메소드
  	private void uploadFileDelete(File f) {
  		if(f != null) {
  	        if(f.exists()) {
  	            if(f.delete()) {
  	            	System.out.println("파일삭제 성공!");
  	            }else {
  			    	System.out.println("파일삭제 실패!");
  		        }
  		    }
  		}
  	}
  	
    
	@GetMapping("/product/categoryList")
	public ModelAndView categoryList(ModelAndView mv,
			@RequestParam(value="categoryName") String categoryName,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "20") int numPerpage) {	
		
		System.out.println(categoryName);
		List<Product> list = service.categoryList(categoryName);
		mv.addObject("products", list);
		mv.setViewName("/product/productList");
		
		return mv;
  }

	
   	@RequestMapping("/product/adminSearch.do")
   	public ModelAndView adminSearch(@RequestParam(value="adminKeyword",defaultValue = "")String adminKeyword,ModelAndView mv) {
	   	 System.out.println("adminKeyword : " + adminKeyword);
	     List<Product> products = service.adminSearchList(adminKeyword);
	     
	     mv.addObject("products", products);
	     mv.setViewName("admin/adminManageProduct");
	     System.out.println("keyword : " + products);
	     return mv;
   	}
   
   

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   
}