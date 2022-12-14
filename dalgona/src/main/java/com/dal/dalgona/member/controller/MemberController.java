package com.dal.dalgona.member.controller;

import java.io.IOException;
import java.util.List;

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
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.dal.dalgona.member.model.service.MemberService;
import com.dal.dalgona.product.model.service.ProductService;
import com.dal.dalgona.working.model.service.PjeServiceImpl;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@SessionAttributes({ "loginMember" })
public class MemberController {


	@Autowired
	private MemberService service;

	 @Autowired
	  private ProductService pservice;
	 
	 @Autowired
	
	@Value(value = "${spring.mail.username}")
	private String adminEmail;


	@RequestMapping(value="/member/mypage/cartInsert")
	public String cartInsert(Model mo,HttpSession session,
			@RequestParam(value="selAmount",required=false )int selAmount,
			Product p) 
			throws Exception {
		Member m= (Member) session.getAttribute("loginMember");
		String msg="" ,loc="";
		if(m!=null) {
			Cart c =Cart.builder().member(m).product(p).cartAmount(selAmount).build();
			System.out.println(c);
			//		int result=service.cartInsert(c);
			
			int count = service.countCart(c.getProduct(),m);
			if(count == 0) {
				System.out.println("count: "+count);
				service.cartInsert(c);
				log.debug("{2}",c);
				log.debug("{2}",count);
				System.out.println(c);
				System.out.println(count);
				msg="??????????????? ?????? ???????????????";
				loc="/member/mypage/cart";
				mo.addAttribute("msg",msg);
				mo.addAttribute("loc",loc);
			}else {
			System.out.println("c"+c);
			System.out.println("co"+count);
			service.updateCart(c);
		
			log.debug("{3}",c);
			log.debug("{3}",count);
			System.out.println(c);
			System.out.println(count);
			msg="????????? ???????????????";
			loc="/";
			mo.addAttribute("msg",msg);
			mo.addAttribute("loc",loc);
			}
			
		}else {
			msg="????????? ??? ??????????????????";
			loc="/loginpage";
			mo.addAttribute("msg",msg);
			mo.addAttribute("loc",loc);
		}
		return "common/msg";
		
	}
	
	@RequestMapping(value="/member/mypage/cart") // ????????????
	public ModelAndView cart(ModelAndView mv, HttpSession session,
			Product p) {
		Member memberId = (Member) session.getAttribute("loginMember");
		if (memberId != null) {
			List<Cart> cartList = service.cartList(memberId); // ???????????? ??????
			System.out.println("cart :" + cartList);
			service.selectProduct(p);
			int sumMoney = service.sumMoney(memberId);// ???????????? ?????? ?????? ??????
//			System.out.println("sumMoney :" + sumMoney);
			int selAmount=1; //?????? ??????
			int fee = 2500; // ?????????
			int totalPrice=sumMoney+fee;
			mv.addObject("totalPrice",totalPrice);
			mv.addObject("sumMoney",sumMoney);
			mv.addObject("sA",selAmount);
			mv.addObject("fee",fee);
			mv.addObject("product",p);
			mv.addObject("cartList",cartList);
			mv.addObject("count", cartList.size());
			mv.setViewName("member/mypage/cart");
			return mv;
		} else {
			mv.setViewName("member/login/loginPage");
			return mv;
		}

	}
	@RequestMapping(value="/cart/update.do") // ????????????
	public String cartUpdate(Model mo, HttpSession session,
			Product p,@RequestParam int[] cartAmount,
			@RequestParam int[] selAmount,
			@RequestParam long[] productCode) {
		Member memberId = (Member) session.getAttribute("loginMember");
		
		for(int i=0; i<selAmount.length; i++) {
			Cart c = new Cart();
			c.setMember(memberId);
			c.setCartAmount(selAmount[i]);
			cartAmount[i]+=selAmount[i];
			c.setProduct(p);
			service.modifyCart(c);
			}
		return "redirect:/member/mypage/cart";
	}
	
	@RequestMapping(value="/payment/Move.do") //???????????? -> ????????????
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
		mo.addAttribute("pro",p);
		mo.addAttribute("DL",selectsDL);
		mo.addAttribute("cart",c);
		
		
		return "payment/paymentCart";
	}
	
	@RequestMapping("/member/delete.do") //?????? ??????(??? ??? row??? ??????
	 public String delete(@RequestParam long cartCode) {
      service.delete(cartCode);
       return "redirect:/member/mypage/cart";
   }

//	 ???????????? - ??????????????????
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
	

//	@RequestMapping("/member/deleteAll.do") // ???????????? ?????? ??????
//	public String deleteAll(HttpSession session) {
//		Member memberId = (Member) session.getAttribute("loginMember");
//		if (memberId != null) {
//			service.deleteAll(memberId);
//		}
//		return "redirect:/member/mypage/cart";
//	}

	   @RequestMapping("/member/mypage/productOrderList") // ????????????
	   public String orderDetail(Model mo,HttpSession session) {
	      Member memberId = (Member) session.getAttribute("loginMember");
	      
	      String msg,loc="";
	      if(memberId!=null) {
    	  System.out.println("id :"+ memberId);
	      List<OrderDetail> orderDetailList = service.orderList(memberId);
	      int selAmount=1;
	      System.out.println("orderDetailList :"+orderDetailList);
	      System.out.println("selAmount :"+selAmount);
	      mo.addAttribute("orderDetailList", orderDetailList);
	      mo.addAttribute("sA", selAmount);
	      
	      return "member/mypage/productOrderList";
	      }else {
	    	  msg="????????? ??? ?????? ???????????????";
	    	  loc="loginpage";
	    	  mo.addAttribute("msg",msg);
	    	  mo.addAttribute("loc",loc);
	    	 return "common/msg";
	      }
	      
	      
	   }
	
	//???????????? - ????????????
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

	@RequestMapping("/member/mypage/zzim") // ???
	public String zzim(Model mo, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		if(memberId!=null) {
			
		List<Likes> zzimList = service.zzimList(memberId);
		System.out.println("??? :"+zzimList);
		mo.addAttribute("zzimList", zzimList);
		mo.addAttribute("count", zzimList.size());
		return "member/mypage/zzim";
		}else {
			
			return "member/login/loginPage";
		}
		
	}

//	 ??? - ??????????????????
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
	@RequestMapping("/member/zzimSelectDelete1.do") 
	@ResponseBody
	public boolean zzimSelectDelete1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.zzimSelectDelete1(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}
	
	@RequestMapping("/member/zzimDelete.do") //?????? ??????(??? ??? row??? ??????
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
	
	@RequestMapping("/member/mypage/addressadd")
	public String addressAdd() {
		return "member/mypage/addressadd";
	}

//		
	@RequestMapping("/member/mypage/addressInsert")
	public String addressInsert(HttpSession session,Model mo,
			@RequestParam(value="addrReceiver")String addrReceiver, 
			@RequestParam(value="addrPhone")String addrPhone, 
			@RequestParam(value="addrBase")String addrBase, 
			@RequestParam(value="addrDetail")String addrDetail, 
			@RequestParam(value="adrPostNum")String adrPostNum, 
				@RequestParam(value="addrRoadName")String addrRoadName) {
		 Member memberId=(Member)session.getAttribute("loginMember");
		 DeliveryLocation dl =DeliveryLocation.builder().addrBase(addrBase).addrDetail(addrDetail).
				 addrPhone(addrPhone).addrReceiver(addrReceiver).addrRoadName(addrRoadName).
				 adrPostNum(adrPostNum).member(memberId).build();
		 System.out.println(dl);
		 String msg,loc="";
		 if(dl!=null) {
			 service.addressInsert(dl);
			 msg="???????????? ?????????????????????";
			 loc="redirect:/member/mypage/address";
			 mo.addAttribute("msg",msg);
			 mo.addAttribute("loc",loc);
			 
			 return "common/msg";
		 }else {
			 msg="????????? ?????? ??????";
			 loc="member/mypage/address";
			 mo.addAttribute("msg",msg);
			 mo.addAttribute("loc",loc);
			 return "common/msg";
		 }
	}
	
	@RequestMapping("/addressDel") //?????? ??????(??? ??? row??? ??????
	 public String addressDelete(@RequestParam(value="addressCode" )long addressCode) {
     service.addressDelete(addressCode);
      return "redirect:/member/mypage/address";
  }
	
	

//	
	@RequestMapping("/baesong") // ??????
	public String baesong() {
		return "/member/baesong";
	}
	
	/* ?????? */
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
	         model.addAttribute("msg","????????? ??????");
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
	         msg="???????????? ??????";
	         loc="/";
	      }else {
	         msg="???????????? ??????";
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
	         model.addAttribute("msg","?????? ????????? ?????????. ???????????? ?????? ??????????????????.");
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
	         model.addAttribute("msg","???????????? ???????????? ?????? ??????????????????.");
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
		      model.addAttribute("msg","???????????? ?????? ?????????????????????.");
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
		   rttr.addFlashAttribute("msg","??????????????? ?????????????????????. ?????? ?????????????????????.");
		   
		   if(!status.isComplete()) {
		         status.setComplete();
		      }
		   
		   return "redirect:/";
	   }
	   
	   @RequestMapping("/member/mypage/withdraw")
	   public String deleteMember(SessionStatus status, HttpSession session, RedirectAttributes rttr, String memberId) {
		   
		   service.deleteMember(memberId);
		   session.invalidate();
		   rttr.addFlashAttribute("msg","??????????????? ?????????????????????.");
		   
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
		   rttr.addFlashAttribute("msg","???????????? ????????? ?????????????????????. ?????? ?????????????????????.");
		   
		   if(!status.isComplete()) {
		         status.setComplete();
		      }
		   
		   return "redirect:/";
	   }
	  
}
