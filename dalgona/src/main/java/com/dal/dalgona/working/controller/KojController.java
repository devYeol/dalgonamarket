/*
 * package com.dal.dalgona.working.controller;
 * 
 * import java.io.File; import java.io.IOException; import
 * java.text.SimpleDateFormat; import java.util.Date; import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import com.dal.dalgona.common.model.vo.Product; import
 * com.dal.dalgona.common.model.vo.Qna; import
 * com.dal.dalgona.common.model.vo.Review; import
 * com.dal.dalgona.working.model.service.KojServiceImpl;
 * 
 * import lombok.extern.slf4j.Slf4j;
 * 
 * @Controller
 * 
 * @Slf4j public class KojController {
 * 
 * @Autowired private KojServiceImpl service;
 * 
 * 
 * @RequestMapping("/product/productDetail/{productCode}") public String
 * storeDetail(@PathVariable long productCode, Model model) { Product
 * p=service.selectProduct(productCode); List<Review>
 * review=service.reviewList(); List<Qna> qna=service.qnaList();
 * model.addAttribute("pro",p); model.addAttribute("review",review); return
 * "product/productDetail"; }
 * 
 * 
 * // @RequestMapping("/review/reviewWrite.do")//memberId,productCode // public
 * String reviewWrite( // @RequestParam(value="loginmember") String loginmember,
 * // @RequestParam(value="productCode") long productCode,
 * // @RequestParam(value="reviewContent") String reviewContent,
 * // @RequestParam(value="reviewImage") MultipartFile reviewImage,
 * // @RequestParam(value="reviewStar") int reviewStar, // HttpServletRequest
 * rs,Model model // ) throws IllegalStateException, IOException { // // // //
 * // String
 * path=rs.getServletContext().getRealPath("/resources/upload/review/"); // File
 * uploadDir=new File(path); // // if(!uploadDir.exists()) uploadDir.mkdirs();
 * // // if(!reviewImage.isEmpty()) { // //???????????????????????? // String
 * originalFilename=reviewImage.getOriginalFilename(); // String
 * ext=originalFilename.substring(originalFilename.lastIndexOf(".")); // //?????????
 * ????????? ????????? ?????? // SimpleDateFormat sdf=new
 * SimpleDateFormat("yyyyMMdd_HHmmssSSS"); // int
 * rndNum=(int)(Math.random()*10000); // String
 * rename=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext; // // //?????????????????????
 * // try { // reviewImage.transferTo(new File(path+rename)); //
 * }catch(IOException e) { // e.printStackTrace(); // } // } // Review
 * r=Review.builder().memberId(loginmember).productCode(productCode) //
 * .reviewContent(reviewContent).reviewDate(new Date()) //
 * .reviewImage("???????????????").reviewStar(reviewStar).build(); // String msg=""; //
 * String loc=""; // try { // service.reviewWrite(r); // msg="?????????????????????"; //
 * loc="/product/productDetail/{productCode}"; // }catch(RuntimeException e) {
 * // msg="?????????????????????"; // loc="/product/productDetail/{productCode}"; // } // //
 * model.addAttribute("msg",msg); // // return "common/msg"; // }
 * 
 * 
 * // @RequestMapping("/qna/qnawWrite.do")// // public String qnawWrite(){ // //
 * // }
 * 
 * 
 * 
 * 
 * }
 */