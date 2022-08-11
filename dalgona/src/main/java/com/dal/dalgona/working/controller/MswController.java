/*
 * package com.dal.dalgona.working.controller;
 * 
 * import java.util.HashMap; import java.util.List; import java.util.Map;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import com.dal.dalgona.common.model.vo.Cart; import
 * com.dal.dalgona.common.model.vo.Member; import
 * com.dal.dalgona.working.model.service.MswService;
 * 
 * @Controller
 * 
 * @RequestMapping("/member") public class MswController {
 * 
 * @Autowired private MswService service;
 * 
 * @GetMapping("/mypage/mypageMain") public String mypageMain() { return
 * "member/mypage/mypageMain"; }
 * 
 * // @RequestMapping // public String getCart(Model mo ) { // List<Cart>
 * getCart=service.getCart(); // return "member/mypage/cart"; // }
 * 
 * 
 * @RequestMapping("/mypage/cart") // 장바구니 public ModelAndView cart(ModelAndView
 * mv, HttpSession session) { Member memberId = (Member)
 * session.getAttribute("loginMember"); Map<String, Object> map = new
 * HashMap<String, Object>(); System.out.println(memberId); if (memberId !=
 * null) { List<Cart> cartList = service.cartList(memberId); // 장바구니 정보
 * System.out.println("cart :"+cartList); int sumMoney =
 * service.sumMoney(memberId);// 장바구니 전체 금액 호출
 * System.out.println("sumMoney :"+sumMoney); int fee = 2500; // 배송료
 * System.out.println("allMoney :"+(fee+sumMoney)); map.put("sumMoney",
 * sumMoney); map.put("fee", fee); map.put("allSum", fee + sumMoney); // 체크된
 * 장바구니 상품 + 배송비 map.put("cartList", cartList); map.put("count",
 * cartList.size()); mv.addObject("map", map);
 * mv.setViewName("member/mypage/cart"); return mv; } else { return new
 * ModelAndView("member/login/loginPage"); }
 * 
 * }
 * 
 * @RequestMapping("delete.do") //선택삭제 public String delete(@RequestParam long
 * productCode) { service.delete(productCode); return
 * "redirect:/member/mypage/cart"; }
 * 
 * 
 * 
 * // @GetMapping("/mypage/productOrderList") //구매내역 // public String
 * productOrder(Model mo) { // List<Product> orderList = service.orderList(); //
 * mo.addAttribute("orderList",orderList); // return
 * "member/mypage/productOrderList"; // }
 * 
 * // @GetMapping("/mypage/zzim") //찜 // public String zzim(Model mo) { //
 * List<Product> zzimList = service.zzimList(); //
 * mo.addAttribute("zzimList",zzimList); // return "member/mypage/zzim"; // } //
 * // //
 * 
 * @RequestMapping("/mypage/shippingset") public String shippingset() { return
 * "member/mypage/shippingset";
 * 
 * } // //
 * 
 * @RequestMapping("/mypage/addressadd") public String addressadd() { return
 * "member/mypage/addressadd"; } //
 * 
 * @GetMapping("/baesong") //배송 public String baesong() { return
 * "/member/baesong"; } }
 * 
 * @Controller class MswController2 { // 검색 리스트
 * 
 * @GetMapping("/product/productList") public String productList() { return
 * "product/productList"; } }
 */