package com.dal.dalgona.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.admin.model.service.adminServiceImpl;
import com.dal.dalgona.common.PageFactroyNoBootStrap;
import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
public class adminController {

	@Autowired
	adminServiceImpl service;

	/* 중언 */

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
	@RequestMapping("adminDeleteProduct.do")
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
//				log.debug(deleteArr[i]);
			service.deleteByProductCode(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}

	// 주문관리 페이지 이동
	@RequestMapping("adminManageOrder.do")
	public String adminManageOrder() {
		return "admin/adminManageOrder";
	}

	// 페이지테스트
	@RequestMapping("adminManageProduct.do")
	public ModelAndView adminManageProduct(ModelAndView mv, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage) {
		PageRequest pagerequest = PageRequest.of(cPage - 1, numPerpage, Sort.by(Sort.Direction.DESC, "productCode"));
		Page<Product> list = service.selectProducts(pagerequest);
		mv.addObject("products", list.getContent());
		mv.addObject("pageBar",
				PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageProduct");
		return mv;
	}

	/* 원희 */

	// category
	@RequestMapping("/categoryDemo")
	@ResponseBody
	public Category insertCategory() {
		Category cate = Category.builder().categoryName("기타").build();
		Category result = service.insertCategory(cate);

		return result;

	}

	// 상품등록 페이지에서 name명 가져와서 매개변수에 집어넣음
	@RequestMapping("/insertProduct.do")
	public String insertProduct(@RequestParam(value = "productAmount") int product_Ampont,
			@RequestParam(value = "productContent") String product_Content,
			@RequestParam(value = "thumbnail") MultipartFile thumbnail,
			@RequestParam(value = "detailedImage") MultipartFile detailedImage,
			@RequestParam(value = "productPrice") int product_Price,
			@RequestParam(value = "productName") String product_Name, String categoryName, String[] optionName,
			int[] optionPrice, HttpServletRequest rs, Model model) throws IllegalStateException, IOException {
		// 이부분 category로 조회
		Category c = service.selectCategory(categoryName);
		log.debug("{}", c);

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
			String secondRename = "admin_" + random + exts;

			thumbnailFile = new File(path + "/" + rename);
			thumbnail.transferTo(thumbnailFile);
			detailedImageFile = new File(path + "/" + secondRename);
			detailedImage.transferTo(detailedImageFile);

		}

		String aa = path + thumbnailFile.getName();

		// 이미지주소자르기 썸네일
		String target = "resources";
		int target_num = aa.indexOf(target) - 1;
		String thumbnailPath = aa.substring(target_num);
		// 이미지주소 자르기 상세이미지
		int target_num1 = aa.indexOf(target) - 1;
		String detailedPath = aa.substring(target_num);

		Product p = Product.builder().productAmount(product_Ampont).productContent(product_Content)
				.productPrice(product_Price).productName(product_Name).productThumb(thumbnailPath)
				.productImage(detailedPath).productDate(new Date()).category(c).build();

		List<ProductOption> options = new ArrayList();
		// option을 for문돌려 컬럼안에 집어넣음
		for (int i = 0; i < optionName.length; i++) {
			options.add(
					ProductOption.builder().product(p).oprionName(optionName[i]).optionPrice(optionPrice[i]).build());
		}

		p.setOptionCode(options);

		log.debug("{}", p);
		log.debug("{}", options);

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

//		@GetMapping("/admin/adminManageProduct.do")
//		public String productList(Model model) {
//				List<Product> result = service.productList();
//				model.addAttribute("pro",result);
//			return "admin/adminManageProduct";
//		}

	// 상품수정하기
	@RequestMapping("/selectUpdateProduct.do")
	public String selectUpdateProduct(Long pro, Model model) {
		// 카테고리 가져오기
		System.out.println(pro);
		Product p = service.selectOneProduct(pro);
		Category c = service.selectOneCate(p);
		ProductOption po = service.selectOneOption(p);
		
		log.debug("{}", c);
		log.debug("{}", p);
		log.debug("{}", po);
		
		model.addAttribute("p", p);
		model.addAttribute("c", c);
		model.addAttribute("po", po);
		
		return "admin/selectUpdateProduct";
	}
	
	// 멤버관련
	@RequestMapping("adminManageMember.do")
	public ModelAndView adminManageMember(ModelAndView mv,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "25") int numPerpage) {
		PageRequest pagerequest = PageRequest.of(cPage - 1, numPerpage,
				Sort.by(Sort.Direction.ASC, "memberEnrollDate"));
		Page<Member> list = service.selectMembers(pagerequest);
		mv.addObject("members", list.getContent());
		mv.addObject("pageBar",
				PageFactroyNoBootStrap.getPageBar(list.getTotalElements(), numPerpage, cPage, "adminManageProduct.do"));
		mv.setViewName("admin/adminManageMember");
		return mv;
	}
}
