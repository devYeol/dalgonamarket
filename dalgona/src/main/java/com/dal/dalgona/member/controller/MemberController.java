package com.dal.dalgona.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.member.model.service.MemberService;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@SessionAttributes({ "loginMember" })
public class MemberController {

	@Autowired
	private MemberService service;

	@Value(value = "${spring.mail.username}")
	private String adminEmail;

	@GetMapping("/member/mypage/mypageMain")
	public String mypageMain() {
		return "member/mypage/mypageMain";
	}

	@RequestMapping(value="/member/mypage/cartInsert")
	public String cartInsert(Model mo,HttpSession session,
			@RequestParam(value="selAmount",required=false )int selAmount,
			Product p) 
			throws Exception {
		Member m= (Member) session.getAttribute("loginMember");
//		Likes l=service.selectLikes(likesCode);
		System.out.println(m);
		System.out.println(p);
		String msg="" ,loc="";
		log.debug("{1}",m);
		log.debug("{1}",p);
		Gson gson=new Gson();
	
		if(m!=null) {
			
			String Mjson =gson.toJson(m); 
			String Pjson =gson.toJson(p); 
//			String Ljson =gson.toJson(l);
			Cart c =Cart.builder().member(m).product(p).build();
			String Cjson =gson.toJson(c); 
			int result=service.cartInsert(c);
			System.out.println(c);
			msg="장바구니에 등록 되었습니다";
			loc="/member/mypage/cart";
		}else {
			msg="로그인 후 이용해주세요";
			loc="/member/login/loginPage";
		}
		
		log.debug("{2}",m);
		log.debug("{2}",p);
		mo.addAttribute("msg",msg);
		mo.addAttribute("loc",loc);
		return "common/msg";
	}
		
	

	@RequestMapping(value="/member/mypage/cart") // 장바구니
	public ModelAndView cart(ModelAndView mv, HttpSession session,
			Product p) {
		Member memberId = (Member) session.getAttribute("loginMember");
		if (memberId != null) {
			List<Cart> cartList = service.cartList(memberId); // 장바구니 정보
			System.out.println("cart :" + cartList);
			service.selectProduct(p);
			int sumMoney = service.sumMoney(memberId);// 장바구니 전체 금액 호출
			System.out.println("sumMoney :" + sumMoney);
			int selAmount=1; //상품 개수
			int fee = 2500; // 배송료
			System.out.println("allMoney :" + (fee + sumMoney));
			mv.addObject("sumMoney",sumMoney);
			mv.addObject("sA",selAmount);
			mv.addObject("fee",fee);
			mv.addObject("product",p);
			mv.addObject("allSum", fee + sumMoney); // 체크된 장바구니 상품 + 배송비
			mv.addObject("cartList",cartList);
			mv.addObject("count", cartList.size());
			mv.setViewName("member/mypage/cart");
			return mv;
		} else {
			return new ModelAndView("member/login/loginPage");
		}

	}
	
//	@RequestMapping(value="/member/mypage/cartInsert")
//	public String cartInsert(Model mo,HttpSession session,
//			@RequestParam(value="product")Product productCode) 
//			throws Exception {
//		Member m= (Member) session.getAttribute("loginMember");
//		Product p=service.selectProduct(productCode);
////		Likes l=service.selectLikes(likesCode);
//		System.out.println(m);
//		System.out.println(p);
//		String msg="" ,loc="";
//		log.debug("{1}",m);
//		log.debug("{1}",p);
//		Gson gson=new Gson();
//	
//		if(m!=null) {
//			
//			String Mjson =gson.toJson(m); 
//			String Pjson =gson.toJson(p); 
////			String Ljson =gson.toJson(l);
//			Cart c =Cart.builder().member(m).product(p).build();
//			String Cjson =gson.toJson(c); 
//			int result=service.cartInsert(c);
//			System.out.println(c);
//			msg="장바구니에 등록 되었습니다";
//			loc="redirect:/member/mypage/cart/"+p.getProductCode();
//		}else {
//			msg="로그인 후 이용해주세요";
//			loc="/member/login/loginPage";
//		}
//		
//		log.debug("{2}",m);
//		log.debug("{2}",p);
//		mo.addAttribute("msg",msg);
//		mo.addAttribute("loc",loc);
//		return "common/msg";
//	}
	  
	
	@RequestMapping(value="/payment/Move.do") //장바구니 -> 구매내역
	public String paymentInsert(Model mo,HttpSession session,
			Product productCode,
			@RequestParam(value="selAmount",required=false )int selAmount)
			throws Exception {
		Member m= (Member) session.getAttribute("loginMember");
		Product p=service.selectProduct(productCode);
		Cart c = service.selectCart(productCode);
		DeliveryLocation selectsDL=service.selectDelivery(m);
		System.out.println(m);
		System.out.println(p);
		System.out.println(selectsDL);
		log.debug("{1}",m);
		log.debug("{1}",p);
//		Gson gson=new Gson();
//			String Mjson =gson.toJson(m); 
//			String Pjson =gson.toJson(p); 
		mo.addAttribute("pro",p);
		mo.addAttribute("DL",selectsDL);
		mo.addAttribute("cart",c);
		
		return "payment/paymentCart";
	}
	

	@RequestMapping("/member/delete.do") //개별 삭제(한 개 row만 삭제
	 public String delete(@RequestParam long cartCode) {
      service.delete(cartCode);
       return "redirect:/member/mypage/cart";
   }

//	 장바구니 - 선택삭제기능
	@RequestMapping("/member/selectDelete.do") 
	@ResponseBody
	public boolean selectdelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.selectDelete(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}

//	@RequestMapping("/member/deleteAll.do") // 장바구니 전체 삭제
//	public String deleteAll(HttpSession session) {
//		Member memberId = (Member) session.getAttribute("loginMember");
//		if (memberId != null) {
//			service.deleteAll(memberId);
//		}
//		return "redirect:/member/mypage/cart";
//	}

	@RequestMapping("/member/mypage/productOrderList") // 구매내역
	public String orderDetail(Model mo,HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		System.out.println("id :"+ memberId);
		List<OrderDetail> orderDetailList = service.orderList(memberId);
		int selAmount=1;
		System.out.println("orderDetailList :"+orderDetailList);
		System.out.println("selAmount :"+selAmount);
		mo.addAttribute("orderDetailList", orderDetailList);
		mo.addAttribute("sA", selAmount);
		
		return "member/mypage/productOrderList";
		
	}
	
	//구매내역 - 선택삭제
	@RequestMapping("/member/orderListDelete.do") 
	@ResponseBody
	public boolean orderListDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.orderListDelete(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}

	@RequestMapping("/member/mypage/zzim") // 찜
	public String zzim(Model mo, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		List<Likes> zzimList = service.zzimList(memberId);
		System.out.println("찜 :"+zzimList);
		mo.addAttribute("zzimList", zzimList);
		return "member/mypage/zzim";
		
	}

//	 찜 - 선택삭제기능
	@RequestMapping("/member/zzimSelectDelete.do") 
	@ResponseBody
	public boolean zzimSelectDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.zzimSelectDelete(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}
	
	@RequestMapping("/member/zzimDelete.do") //개별 삭제(한 개 row만 삭제
	public String zzimDelete(@RequestParam long likesCode) {
		service.zzimDelete(likesCode);
		return "redirect:/member/mypage/zzim";
	}
	
	 @RequestMapping("/member/mypage/address")
	   public ModelAndView address(HttpSession session,ModelAndView mv) {
		   Member memberId=(Member)session.getAttribute("loginMember");
		   List<DeliveryLocation> selectDl =service.selectDL(memberId);
		   System.out.println(selectDl);
		   mv.addObject("selectDl",selectDl);
		   mv.setViewName("member/mypage/address");
		   return mv;
	   }
	
	
	
	
//	
	@RequestMapping("/member/mypage/shippingset")
	public String shippingset() {
		return "member/mypage/shippingset";

	}

//		
	@RequestMapping("/member/mypage/addressadd")
	public String addressadd() {
		return "member/mypage/addressadd";
	}

//	
	@RequestMapping("/baesong") // 배송
	public String baesong() {
		return "/member/baesong";
	}
	
	/* 충열 */
	   @RequestMapping("/loginpage")
	   public String login() {
	      return "member/login/loginPage";
	   }
	   
	   @RequestMapping(value="/member/loginEnd", method = RequestMethod.POST)
	   public String loginId(Member m,Model model) {
	      
//	      Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      
	      Member loginMember=service.login(m);
	      
	      String view="redirect:/";
	      
	      if(loginMember!=null) {
	         model.addAttribute("loginMember",loginMember);
	      }else {
	         model.addAttribute("msg","로그인 실패");
	         model.addAttribute("loc","/loginpage");
	         view="common/msg";
	      }
	      return view;
	   }
	   
	   @RequestMapping("/member/logout")
	   public String logout(SessionStatus status) {
	      if(!status.isComplete()) {
	         status.setComplete();
	      }
	      return "redirect:/";
	   }

	   @RequestMapping("/member/enroll")
	   public String enroll() {
	      return "member/enroll/enrollPage";
	   }
	   
	   @RequestMapping("/member/enrollEnd")
	   public String enrollEnd(Member m,Model model) {
	      
	      int result=service.insertMember(m);
	      String msg="";
	      String loc="";
	      if(result>0) {
	         msg="회원가입 성공";
	         loc="/";
	      }else {
	         msg="회원가입 실패";
	         loc="/member/enroll";
	      }
	      model.addAttribute("msg",msg);
	      model.addAttribute("loc",loc);
	      
	      return "common/msg";
	   }
	   
	   @RequestMapping(value="/idCheck", method = RequestMethod.POST)
	   @ResponseBody
	   public int idCheck(@RequestParam("memberId") String memberId) {
	      return service.idCheck(memberId);
	   }
	   
	   @RequestMapping("/authmail")
	   @ResponseBody
	   public Boolean sendmail(String email,HttpSession session) {
	      session.setAttribute("emailKey",service.authSendEmail(adminEmail,email));
	      return true;
	   }
	   
	   @RequestMapping("/checkauthkey")
	   @ResponseBody
	   public Boolean checkEmailAuthKey(String key,HttpSession session) {
	      Boolean result=key.equals((String)session.getAttribute("emailKey"));
	      if(result) session.removeAttribute("emailKey");
	      return result;
	   }
	   
	   @RequestMapping(value="/member/findIdView", method=RequestMethod.GET)
	   public String findIdView() throws Exception {
	      return "member/login/findIdPage";
	   }
	   
	   @RequestMapping(value="/member/findId", method=RequestMethod.POST)
	   public String findId(Member m,Model model) throws Exception {
	      System.out.println(m.getMemberEmail());
	      if(service.findIdCheck(m.getMemberEmail())==0) {
	         model.addAttribute("msg","없는 이메일 입니다. 이메일을 다시 확인해주세요.");
	         return "member/login/findIdPage";
	      }else {
	         m=service.findId(m.getMemberEmail());
	         model.addAttribute("member",m);
	         return "member/login/findIdEnd";
	      }
	   }
	   
	   @RequestMapping(value="/member/findPwView", method=RequestMethod.GET)
	   public String findPwView() throws Exception {
	      return "member/login/findPwPage";
	   }
	   
	   @RequestMapping(value="/member/findPw", method=RequestMethod.POST)
	   public String findPw(Member m, Model model) throws Exception {
	      System.out.println(m.getMemberId()+m.getMemberEmail());
	      if(service.findPwCheck(m)==0) {
	         model.addAttribute("msg","아이디와 이메일을 다시 확인해주세요.");
	         return "member/login/findPwPage";
	      }else {
	         String newPw=service.findPw(adminEmail,m.getMemberEmail());
	         service.findPwChange(m,newPw);
	         model.addAttribute("member",m);
	         
	         return "member/login/findPwEnd";
	      }      
	   }
	 
	   
	   @RequestMapping("/infochange")
	   public String infochange() {
	      return "member/mypage/infochange";
	   }
	   @RequestMapping("/member/mypage/changePage")
	   public String changePage(HttpSession session,Model model) {
		   
		   Member memberId = (Member) session.getAttribute("loginMember");
		   model.addAttribute("member",memberId);
		   
	      return "member/mypage/changePage";
	   }
	   
	   @RequestMapping("/member/mypage/pwChck")
	   public String pwdCheck(Member m,Model model) {
		   
		   System.out.println(m);
		   
		   Member pwck=service.pwck(m);
		   String view="member/mypage/infoUpdate";
		      
		   if(pwck!=null) {
		      model.addAttribute("member",pwck);
		   }else {
		      model.addAttribute("msg","일치하지 않는 비밀번호입니다.");
		      model.addAttribute("loc","/member/mypage/changePage");
		      view="common/msg";
		   }
		   return view;
	   }
		/*
		 * @RequestMapping("/member/mypage/infochange") public String
		 * infochange(HttpSession session,Model model) {
		 * 
		 * Member memberId = (Member) session.getAttribute("loginMember");
		 * model.addAttribute("member",memberId); System.out.println(memberId);
		 * 
		 * return "member/mypage/infochange"; }
		 */
	   
	   @RequestMapping("/member/mypage/infoUpdate")
	   public String infoUpdate(RedirectAttributes rttr, HttpSession session, SessionStatus status, Member m, Model model) throws Exception {
		   
		   service.infoUpdate(m);
		   
		   session.setAttribute("member",m);
		   session.invalidate();
		   rttr.addFlashAttribute("msg","회원정보가 수정되었습니다. 다시 로그인해주세요.");
		   
		   if(!status.isComplete()) {
		         status.setComplete();
		      }
		   
		   return "redirect:/";
	   }
	   
	   @RequestMapping("/member/mypage/withdraw")
	   public String deleteMember(SessionStatus status, HttpSession session, RedirectAttributes rttr, String memberId) {
		   
		   service.deleteMember(memberId);
		   session.invalidate();
		   rttr.addFlashAttribute("msg","정상적으로 탈퇴되었습니다.");
		   
		   if(!status.isComplete()) {
		         status.setComplete();
		      }
		   
		   return "redirect:/";
	   }
	   
	   @RequestMapping("/member/mypage/pwUpdate")
	   public String pwUpdateView(HttpSession session, Model model) {
		   
		   Member memberId = (Member) session.getAttribute("loginMember");
		   model.addAttribute("member",memberId);
		   
		   return "member/mypage/pwUpdate";
	   }
	   
	   @RequestMapping("/member/mypage/pwUpdateCheck")
	   @ResponseBody
	   public int pwUpdateCheck(Member m) {
		   //System.out.println(m);
		   return service.pwUpdateCheck(m);
	   }
	   
	   @RequestMapping("/member/mypage/pwUpdateEnd")
	   public String pwUpdateEnd(String memberId, String memberPwd1, RedirectAttributes rttr, HttpSession session, SessionStatus status) {
		   
		   service.pwUpdateEnd(memberId, memberPwd1);
		   session.invalidate();
		   rttr.addFlashAttribute("msg","비밀번호 수정이 완료되었습니다. 다시 로그인해주세요.");
		   
		   if(!status.isComplete()) {
		         status.setComplete();
		      }
		   
		   return "redirect:/";
	   }
	  
}
