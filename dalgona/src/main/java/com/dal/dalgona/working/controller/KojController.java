package com.dal.dalgona.working.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.Qna;
import com.dal.dalgona.common.model.vo.Review;
import com.dal.dalgona.working.model.service.KojServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KojController {
	
	@Autowired
	private KojServiceImpl service;
	
	
	@RequestMapping("/product/productDetail/{productCode}")	
	public String storeDetail(@PathVariable long productCode, Model model) {	
		Product p=service.selectProduct(productCode);
		List<Review> review=service.reviewList();
		List<Qna> qna=service.qnaList();
		model.addAttribute("pro",p);
		model.addAttribute("review",review);
		return "product/productDetail";
	}
	
	
//	@RequestMapping("/review/reviewWrite.do")
//	public String reviewWrite(Review r, MultipartFile upFile,Model m,HttpServletRequest rs) {
//			
//		String path=rs.getServletContext().getRealPath("/resources/upload/review/");
//		File uploadDir=new File(path);
//		
//		if(!uploadDir.exists()) uploadDir.mkdirs();
//		
//		if(!upFile.isEmpty()) {
//			//리네임드처리하기
//			String originalFilename=upFile.getOriginalFilename();
//			String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
//			//리네임 명칭을 정할값 설정
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//			int rndNum=(int)(Math.random()*10000);
//			String rename=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
//						
//			//업로드처리하기
//			try {
//				upFile.transferTo(new File(path+rename));
//			}catch(IOException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		r.setFiles(files);
//		String msg="";
//		String loc="";
//		try {
//			service.reviewWrite(r);
//			msg="게시글입력성공";	
//			loc="/board/boardList.do";
//		}catch(RuntimeException e) {
//			msg="게시글입력실패";	
//			loc="/board/boardWrite.do";			
//		}
//		
//		m.addAttribute("msg",msg);
//		m.addAttribute("loc",loc);
//	
//		return "common/msg";
//	}
	
}
