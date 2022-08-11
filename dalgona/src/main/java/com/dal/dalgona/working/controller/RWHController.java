/*
 * package com.dal.dalgona.working.controller;
 * 
 * import java.io.File; import java.io.IOException; import java.util.ArrayList;
 * import java.util.Date; import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.bind.annotation.RestController; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import com.dal.dalgona.common.model.vo.Category; import
 * com.dal.dalgona.common.model.vo.Product; import
 * com.dal.dalgona.common.model.vo.ProductOption; import
 * com.dal.dalgona.working.model.service.RwhService;
 * 
 * import lombok.extern.slf4j.Slf4j;
 * 
 * 
 * @Controller
 * 
 * @Slf4j public class RWHController {
 * 
 * @Autowired private RwhService service;
 * 
 * //category
 * 
 * @RequestMapping("/categoryDemo")
 * 
 * @ResponseBody public Category insertCategory() { Category cate =
 * Category.builder().categoryName("기타").build(); Category
 * result=service.insertCategory(cate);
 * 
 * return result;
 * 
 * }
 * 
 * //상품등록 페이지에서 name명 가져와서 매개변수에 집어넣음
 * 
 * @RequestMapping("/insertProduct.do") public String insertProduct(
 * 
 * @RequestParam(value="productAmount") int product_Ampont,
 * 
 * @RequestParam(value="productContent") String product_Content,
 * 
 * @RequestParam(value="thumbnail") MultipartFile thumbnail,
 * 
 * @RequestParam(value="detailedImage") MultipartFile detailedImage,
 * 
 * @RequestParam(value="productPrice") int product_Price,
 * 
 * @RequestParam(value="productName") String product_Name, String categoryName,
 * String[] optionName, int[] optionPrice, HttpServletRequest rs,Model model )
 * throws IllegalStateException, IOException { //이부분 category로 조회 Category
 * c=service.selectCategory(categoryName); log.debug("{}",c);
 * 
 * //저장경로 가져옴 String path =
 * rs.getServletContext().getRealPath("/resources/upload/product/"); File
 * uploadDir = new File(path); //폴더없으면생성 if(!uploadDir.exists())
 * uploadDir.mkdirs();
 * 
 * File thumbnailFile=new File(path); File detailedImageFile=new File(path);
 * 
 * if(!(thumbnail.isEmpty() && detailedImage.isEmpty())) {
 * 
 * String originalFilename = thumbnail.getOriginalFilename(); String ext =
 * originalFilename.substring(originalFilename.lastIndexOf(".")); String
 * secondFilename = detailedImage.getOriginalFilename(); String exts =
 * secondFilename.substring(secondFilename.lastIndexOf(".")); int random =(int)
 * (Math.random()*10000); String rename = "admin_" + random+ext; String
 * secondRename = "admin_" + random+exts;
 * 
 * thumbnailFile = new File(path + "/" + rename);
 * thumbnail.transferTo(thumbnailFile); detailedImageFile = new File(path + "/"
 * + secondRename); detailedImage.transferTo(detailedImageFile);
 * 
 * }
 * 
 * String aa = path+thumbnailFile.getName();
 * 
 * //이미지주소자르기 썸네일 String target = "resources"; int target_num =
 * aa.indexOf(target)-1; String thumbnailPath = aa.substring(target_num);
 * //이미지주소 자르기 상세이미지 int target_num1 = aa.indexOf(target)-1; String detailedPath
 * = aa.substring(target_num);
 * 
 * Product p = Product.builder().productAmount(product_Ampont)
 * .productContent(product_Content) .productPrice(product_Price)
 * .productName(product_Name) .productThumb(thumbnailPath)
 * .productImage(detailedPath) .productDate(new Date()).category(c).build();
 * 
 * List<ProductOption> options= new ArrayList(); //option을 for문돌려 컬럼안에 집어넣음
 * for(int i=0;i<optionName.length;i++) {
 * options.add(ProductOption.builder().product(p).oprionName(optionName[i]).
 * optionPrice(optionPrice[i]).build()); }
 * 
 * p.setOptionCode(options);
 * 
 * log.debug("{}",p); log.debug("{}",options);
 * 
 * String oriName = thumbnail.getOriginalFilename();
 * 
 * Product pro = service.insertProduct(p); //product insert List<ProductOption>
 * resultOption=service.insertProduct(options); //option을 보내주는구문
 * 
 * String msg = ""; String loc = "";
 * 
 * if(pro != null) { msg = "상품등록 완료!"; loc = "/admin/adminManageProduct.do";
 * }else { msg = "상품등록 실패!"; loc = "/admin/adminEnrollProduct.do"; }
 * model.addAttribute("msg",msg); model.addAttribute("loc",loc); return
 * "common/msg"; }
 * 
 * // @GetMapping("/admin/adminManageProduct.do") // public String
 * productList(Model model) { // List<Product> result = service.productList();
 * // model.addAttribute("pro",result); // return "admin/adminManageProduct"; //
 * }
 * 
 * //상품수정하기
 * 
 * @RequestMapping("/selectUpdateProduct.do") public String
 * selectUpdateProduct(Long pro, Model model){ //카테고리 가져오기
 * System.out.println(pro); Product p = service.selectOneProduct(pro); Category
 * c = service.selectOneCate(p); ProductOption po = service.selectOneOption(p);
 * 
 * log.debug("{}",c); log.debug("{}",p); log.debug("{}",po);
 * 
 * model.addAttribute("p",p); model.addAttribute("c",c);
 * model.addAttribute("po",po); return "admin/selectUpdateProduct"; }
 * 
 * 
 * 
 * }
 */