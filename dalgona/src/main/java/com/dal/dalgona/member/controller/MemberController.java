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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.member.model.service.MemberService;

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

	@GetMapping("/member/mypage/cartInsert")
	public String cartInsert(@ModelAttribute Cart c, HttpSession session) {

		Member memberId = (Member) session.getAttribute("loginMember");

		if (memberId == null) {

			// 로그인하지 않은 상태이면 로그인 화면으로 이동

			return "redirect:member/login/loginPage";
		} else {

			c.setMember(memberId);
			service.cartInsert(c);

			return "redirect:/member/mypage/cart";
		}
	}

	@RequestMapping("/member/mypage/cart") // 장바구니
	public ModelAndView cart(ModelAndView mv, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(memberId);
		if (memberId != null) {
			List<Cart> cartList = service.cartList(memberId); // 장바구니 정보
			System.out.println("cart :" + cartList);
			int sumMoney = service.sumMoney(memberId);// 장바구니 전체 금액 호출
			System.out.println("sumMoney :" + sumMoney);
			int fee = 2500; // 배송료
			System.out.println("allMoney :" + (fee + sumMoney));
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("allSum", fee + sumMoney); // 체크된 장바구니 상품 + 배송비
			map.put("cartList", cartList);
			map.put("count", cartList.size());
			mv.addObject("map", map);
			mv.setViewName("member/mypage/cart");
			return mv;
		} else {
			return new ModelAndView("member/login/loginPage");
		}

	}

//	@RequestMapping("/member/delete.do") //개별 삭제(한 개 row만 삭제
//	 public String delete(@RequestParam int cartCode) {
//       service.delete(cartCode);
//        return "redirect:/member/mypage/cart";
//    }

	// 장바구니 - 선택삭제기능
	@RequestMapping("/member/delete.do")
	@ResponseBody
	public boolean delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] deleteArr = request.getParameterValues("deleteArr[]");
		boolean result = false;
		for (int i = 0; i < deleteArr.length; i++) {
			service.delete(Long.parseLong(deleteArr[i]));
		}
		result = true;
		return result;
	}

	@RequestMapping("/member/deleteAll.do") // 장바구니 전체 삭제
	public String deleteAll(HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		if (memberId != null) {
			service.deleteAll(memberId);
		}
		return "redirect:/member/mypage/cart";
	}

//	@PostMapping("/member/payment/insert") //장바구니에서 결제페이지 이동
//	public String paymentInsert(Product product,HttpSession session,Model mo) {
//		List<Product> orderList = service.orderList();
//		mo.addAttribute("orderList",orderList);
//		return "member/mypage/productOrderList";
//	}

	@GetMapping("/member/mypage/productOrderList") // 구매내역
	public String productOrder(Model mo, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		List<Product> orderList = service.orderList();
		mo.addAttribute("orderList", orderList);
		return "member/mypage/productOrderList";
	}

	@GetMapping("/member/mypage/zzim") // 찜
	public String zzim(Model mo, HttpSession session) {
		Member memberId = (Member) session.getAttribute("loginMember");
		List<Likes> zzimList = service.zzimList(memberId);
		System.out.println(zzimList + "1");
		mo.addAttribute("zzimList", zzimList);
		System.out.println(zzimList + "2");
		return "member/mypage/zzim";
	}

//
//	
//	
	@RequestMapping("/member/mypage/shippingset")
	public String shippingset() {
		return "member/mypage/shippingset";

	}

//	
//		
	@RequestMapping("/member/mypage/addressadd")
	public String addressadd() {
		return "member/mypage/addressadd";
	}

//	
	@GetMapping("/baesong") // 배송
	public String baesong() {
		return "/member/baesong";
	}

	/* 충열 */

	@RequestMapping("/member/login")
	public String login() {
		return "member/login/loginPage";
	}

	@RequestMapping(value = "/member/loginEnd", method = RequestMethod.POST)
	public String loginId(Member m, Model model) {

		Member loginMember = service.login(m);

		String view = "redirect:/";

		if (loginMember != null) {
			model.addAttribute("loginMember", loginMember);
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("loc", "/member/login");
			view = "common/msg";
		}
		return view;
	}

	@RequestMapping("/member/logout")
	public String logout(SessionStatus status) {
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}

	@RequestMapping("/member/enroll")
	public String enroll() {
		return "member/enroll/enrollPage";
	}

	@RequestMapping("/member/enrollEnd")
	public String enrollEnd(Member m, Model model) {

		int result = service.insertMember(m);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "회원가입 성공";
			loc = "/";
		} else {
			msg = "회원가입 실패";
			loc = "/member/enroll";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String memberId) {
		return service.idCheck(memberId);
	}

	@RequestMapping("/authmail")
	@ResponseBody
	public Boolean sendmail(String email, HttpSession session) {
		session.setAttribute("emailKey", service.authSendEmail(adminEmail, email));
		return true;
	}

	@RequestMapping("/checkauthkey")
	@ResponseBody
	public Boolean checkEmailAuthKey(String key, HttpSession session) {
		Boolean result = key.equals((String) session.getAttribute("emailKey"));
		if (result)
			session.removeAttribute("emailKey");
		return result;
	}

	@RequestMapping(value = "/member/findIdView", method = RequestMethod.GET)
	public String findIdView() throws Exception {
		return "member/login/findIdPage";
	}

	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findId(Member m, Model model) throws Exception {
		System.out.println(m.getMemberEmail());
		if (service.findIdCheck(m.getMemberEmail()) == 0) {
			model.addAttribute("msg", "없는 이메일 입니다. 이메일을 다시 확인해주세요.");
			return "member/login/findIdPage";
		} else {
			m = service.findId(m.getMemberEmail());
			model.addAttribute("member", m);
			return "member/login/findIdEnd";
		}
	}

	@RequestMapping(value = "/member/findPwView", method = RequestMethod.GET)
	public String findPwView() throws Exception {
		return "member/login/findPwPage";
	}

	@RequestMapping(value = "/member/findPw", method = RequestMethod.POST)
	public String findPw(Member m, Model model) throws Exception {
		System.out.println(m.getMemberId() + m.getMemberEmail());
		if (service.findPwCheck(m) == 0) {
			model.addAttribute("msg", "아이디와 이메일을 다시 확인해주세요.");
			return "member/login/findPwPage";
		} else {
			String newPw = service.findPw(adminEmail, m.getMemberEmail());
			service.findPwChange(m, newPw);
			model.addAttribute("member", m);

			return "member/login/findPwEnd";
		}
	}

	@RequestMapping("/address")
	public String address() {
		return "member/mypage/address";
	}

	@RequestMapping("/infochange")
	public String infochange() {
		return "member/mypage/infochange";
	}

	@RequestMapping("/changePage")
	public String changePage() {
		return "member/mypage/changePage";
	}
}
