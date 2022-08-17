package com.dal.dalgona.payment.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.Getter;
import lombok.ToString;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;

	@Value("${payment.imp_key}")
	private String impKey;

	@Value("${payment.imp_secret}")
	private String impSecret;
	
	// JSON 파싱 클래스
	@ToString
	@Getter
	private class Response {
		private OrderDetail response; 
	}
	
	// JSON 파싱 클래스
	@ToString
	@Getter
	private class OrderDetail {
		public OrderDetail(long orderCode, String cartJSON) {
			// TODO Auto-generated constructor stub
		}

		private int orderAmount;
	}
	
	@Transactional // DB 입력시 에러 -> 입력 취소
	@Override
	public String order(Cart cartList, ProductOrder productOrder, HttpSession session) {
		
		Member memberId = (Member) session.getAttribute("loginMember");
		
		Gson gson = new Gson();
		
		System.out.println("productOrder = " + productOrder);
		
//		long total = cartList.getCartAmount();
		
		productOrder.setOrderCode(cartList.getCartCode()); // getProduct()
//		productOrder.setTotalPrice(total);
		
		List<Cart> carts = cartList.getCarts();
		
		OrderDetail[] detail = new OrderDetail[carts.size()];
		
		for(int i=0;i<detail.length;i++) {
			String cartJSON = gson.toJson(carts.get(i));
			detail[i] = new OrderDetail(productOrder.getOrderCode(), cartJSON);
		}

		
		paymentDao.order(productOrder);
//		paymentDao.orderDetail(detail, memberId);
		
		return null;
		
	}

	public String getToken() throws IOException {
		
		HttpsURLConnection conn = null;
		 
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;

	}

	public int productOrder(String imp_uid, String access_token) throws IOException {

		HttpsURLConnection conn = null;
		 
	    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
	 
	    conn = (HttpsURLConnection) url.openConnection();
	 
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", access_token);
	    conn.setDoOutput(true);
	 
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    Gson gson = new Gson();
	    
	    Response response = gson.fromJson(br.readLine(), Response.class);
	    
	    br.close();
	    conn.disconnect();
	    
	    return response.getResponse().getOrderAmount();
		
	}

	public void payMentCancle(String access_token, String imp_uid, String amount, String reason) {
		
	}

	@Override
	public long orderPriceCheck(Cart cartList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
