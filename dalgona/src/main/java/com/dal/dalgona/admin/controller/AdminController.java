package com.dal.dalgona.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.admin.model.service.AdminServiceImpl;
import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
public class AdminController {

	@Autowired
	AdminServiceImpl service;

	// 관리자 메인 이동
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}

	// 상품등록 페이지 이동
	@RequestMapping("adminEnrollProduct.do")
	public String adminEnrollProduct() {
		return "admin/adminEnrollProduct";
	}

	// 상품관리 페이지 이동
//	@RequestMapping("adminManageProduct.do")
//	public ModelAndView adminManageProduct(ModelAndView mv) {
//		List<Product> list=service.selectProducts();
//		mv.addObject("products",list);
//		mv.setViewName("admin/adminManageProduct");
//		return mv;
//	}

	// 상품등록버튼
//	@ResponseBody
	@RequestMapping("/enrollProductTest")
	public String insertStudent() {
		Product p = Product.builder().productAmount(10).productContent("이것은 달고나").productDate(new Date())
				.productPrice(1000).productName("달고나").build();
		service.insertProduct(p);
		return "redirect:adminManageProduct.do";
	}

	// 상품관리 - 삭제기능
	@RequestMapping("/adminDeleteProduct.do")
	@ResponseBody
	public boolean deleteProduct(long productCode, HttpServletResponse response) throws IOException {
		Long result = service.deleteByProductCode(productCode);
		return result > 0;
	}

	// 상품관리 - 선택삭제기능
	@RequestMapping("adminDeleteSelect.do")
	@ResponseBody
	public boolean adminDeleteSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.deleteByProductCode(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}

	// 주문관리 페이지 이동
//	@RequestMapping("adminManageOrder.do")
//	public String adminManageOrder() {
//		return "admin/adminManageOrder";
//	}

	// 페이지테스트
	@RequestMapping("adminManageProduct.do")
	public ModelAndView adminManageProduct(ModelAndView mv, 
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage) {
		PageRequest pagerequest = PageRequest.of(cPage - 1, numPerpage, Sort.by(Sort.Direction.DESC, "productCode"));
		Page<Product> list = service.selectProducts(pagerequest);
		mv.addObject("products", list.getContent());
		mv.addObject("pageBar",PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageProduct");
		return mv;
	}

	// 상품등록 페이지에서 name명 가져와서 매개변수에 집어넣음
	@RequestMapping("/insertProduct.do")
	public String insertProduct(@RequestParam(value = "productAmount") int product_Ampont,
								@RequestParam(value = "productContent") String product_Content,
								@RequestParam(value = "thumbnail") MultipartFile thumbnail, 
								@RequestParam(value = "detailedImage") MultipartFile detailedImage, 
								@RequestParam(value = "productPrice") int product_Price,
								@RequestParam(value = "productName") String product_Name,
								@RequestParam(value = "categoryName") String categoryName, String[] optionName,
								int[] optionPrice, HttpServletRequest rs, Model model) throws IllegalStateException, IOException {
		// 저장경로 가져옴
		String path = rs.getServletContext().getRealPath("/resources/upload/product/");
		File uploadDir = new File(path);
		// 폴더없으면생성
		if (!uploadDir.exists())
			uploadDir.mkdirs();

		File thumbnailFile = new File(path);
		File detailedImageFile = new File(path);

		if (!(thumbnail.isEmpty() && detailedImage.isEmpty())) {

			String originalFilename = thumbnail.getOriginalFilename();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String secondFilename = detailedImage.getOriginalFilename();
			String exts = secondFilename.substring(secondFilename.lastIndexOf("."));
			int random = (int) (Math.random() * 10000);
			String rename = "admin_" + random + ext;
			String secondRename = "admin_second_" + random + exts;

			thumbnailFile = new File(path + "/" + rename);
			thumbnail.transferTo(thumbnailFile);
			detailedImageFile = new File(path + "/" + secondRename);
			detailedImage.transferTo(detailedImageFile);

		}

		String fileName = path + thumbnailFile.getName();

		// 이미지주소자르기 썸네일
		String target = "resources";
		int target_num = fileName.indexOf(target) - 1;
		String thumbnailPath = fileName.substring(target_num);
		// 이미지주소 자르기 상세이미지
		String aa2 = path + detailedImageFile.getName();
		int target_num1 = aa2.indexOf(target) - 1;
		String detailedPath = aa2.substring(target_num1);

		Product p = Product.builder().productAmount(product_Ampont).productContent(product_Content)
				.productPrice(product_Price).productName(product_Name).productThumb(thumbnailPath)
				.productImage(detailedPath).productDate(new Date()).categoryName(categoryName).build();

		List<ProductOption> options = new ArrayList();
		// option을 for문돌려 컬럼안에 집어넣음
		for (int i = 0; i < optionName.length; i++) {
			options.add(
					ProductOption.builder().product(p).optionName(optionName[i]).optionPrice(optionPrice[i]).build());
		}

		p.setOptionCode(options);

//		log.debug("{}", p);
//		log.debug("{}", options);

		String oriName = thumbnail.getOriginalFilename();

		Product pro = service.insertProduct(p); // product insert
		List<ProductOption> resultOption = service.insertProduct(options); // option을 보내주는구문

		String msg = "";
		String loc = "";

		if (pro != null) {
			msg = "상품등록 완료!";
			loc = "/admin/adminManageProduct.do";
		} else {
			msg = "상품등록 실패!";
			loc = "/admin/adminEnrollProduct.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}

	@RequestMapping("/selectUpdateProduct.do")
	public String selectUpdateProduct(long pro, Model model) {
		// 카테고리 가져오기
//		System.out.println(pro);
		Product p = service.selectOneProduct(pro);
		List<ProductOption> po = service.selectOneOption(p);
	
		log.debug("{}", p);
//		log.debug("{}", po);
		
		model.addAttribute("p", p);
		model.addAttribute("po", po);
		
		return "admin/selectUpdateProduct";
	}
	
//	상품업데이트
	@SuppressWarnings("unused")
	@RequestMapping("/updateProduct.do")
	public String updateProduct(@RequestParam(value = "productCode") long Product_Code , 
								@RequestParam(value = "productAmount") int product_Ampont,
								@RequestParam(value = "productContent") String product_Content,
								@RequestParam(value = "beforeThumbnail") String beforeThumbnail,
								@RequestParam(value = "beforedetailedImage") String beforedetailedImage, //이전 썸네일이미지,상세이미지 
								@RequestParam(value = "thumbnail" ,required = false ) MultipartFile thumbnail,//업데이트 될 썸네일이미지
								@RequestParam(value = "detailedImage" ,required = false ) MultipartFile detailedImage, //업데이트 될 상세이미지
								@RequestParam(value = "productPrice") int product_Price,
								@RequestParam(value = "productName") String product_Name,
								@RequestParam(value = "categoryName") String categoryName, long[] optionCode, String[] optionName,
								int[] optionPrice, HttpServletRequest rs, Model model) throws IllegalStateException, IOException {
		//upload폴더에서 삭제(썸네일)
		System.out.println(product_Content);
		String path = rs.getServletContext().getRealPath(beforeThumbnail);
	    File f = new File(path);
	    String path2 = rs.getServletContext().getRealPath(beforedetailedImage);
	    File f2 = new File(path2);
		log.debug("{}",f);
		log.debug("{}",f2);
		String updatePath = rs.getServletContext().getRealPath("/resources/upload/product/");
		System.out.println("updatePath : " + updatePath);
		File uploadDir = new File(updatePath);
		System.out.println("uploadDir : " + uploadDir);
		int random = (int) (Math.random() * 10000);
		
		// 이미지주소 자르기 상세이미지
		Product po = Product.builder().productCode(Product_Code).productAmount(product_Ampont).productContent(product_Content)
				.productPrice(product_Price).productName(product_Name).productDate(new Date()).categoryName(categoryName).build();
		
		String rename="",secondRename="";
		//파일 분기처리 -> 둘다 널이 아닐때 썸네일만 널아닐때 상세만 널아닐때 둘다 널일때
		//둘다 널일때?
		if(thumbnail != null) {
			
			File thumbnailFile = new File(updatePath);
			System.out.println("thumbnailFile : " + thumbnailFile);
			
			String originalFilename = thumbnail.getOriginalFilename();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			System.out.println("originalFilename : " + originalFilename);
			
			rename = "admin_" + random + ext;
			
			thumbnailFile = new File(updatePath + "/" + rename);
			thumbnail.transferTo(thumbnailFile);
			
			String updatefileName = updatePath + thumbnailFile.getName();
			
			// 이미지주소자르기 썸네일
			String target = "resources";
			int target_num = updatefileName.indexOf(target) - 1;
			String thumbnailPath = updatefileName.substring(target_num);
			po.setProductThumb(thumbnailPath);
				
		}
		if(detailedImage != null) {
			
			File detailedImageFile = new File(updatePath);
			System.out.println("detailedImageFile : " + detailedImageFile);
			
			String secondFilename = detailedImage.getOriginalFilename();
			String exts = secondFilename.substring(secondFilename.lastIndexOf("."));
			System.out.println("secondFilename : " + secondFilename);
			
			secondRename = "admin_second_" + random + exts;
			
			detailedImageFile = new File(updatePath + "/" + secondRename);
			detailedImage.transferTo(detailedImageFile);
			
			String updatefileName = updatePath + detailedImageFile.getName();
			
			// 이미지주소자르기 썸네일
			String target = "resources";
			String updatedetailFile = updatePath +  detailedImageFile.getName();
			int target_num1 = updatefileName.indexOf(target) - 1;
			String detailedPath = updatedetailFile.substring(target_num1);
			po.setProductImage(detailedPath);
		}
		
		

		
		List<ProductOption> option = new ArrayList(); 
//		 option을 for문돌려 컬럼안에 집어넣음
		for (int i = 0; i < optionName.length; i++) {
			option.add(
					ProductOption.builder().product(po).optionCode(optionCode[i]).optionName(optionName[i]).optionPrice(optionPrice[i]).build());
		}
		
		log.debug("option : ",option);
		log.debug("{}",option);
		po.setOptionCode(option);
		log.debug("{}",po);
			
		try {
			Product p = service.updateProduct(po);
			List<ProductOption> uo = service.updateOption(option); 
			//이전 파일 지우는 로직
			if(f != null) {
				//db를 거치고나서 만약 db가 수정이 완료되면 밑에 폴더삭제
		      uploadFileDelete(f);
			}
			if(f2 != null) {
				uploadFileDelete(f2);
			}
		}catch(RuntimeException e) {
			uploadFileDelete(new File(updatePath+"/"+rename));
			uploadFileDelete(new File(updatePath+"/"+secondRename));
		}
//		log.debug("{}",uo); 
//		log.debug("{}",p);

		log.debug("{}",product_Name);
		return "redirect:adminManageProduct.do";
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
	
}
