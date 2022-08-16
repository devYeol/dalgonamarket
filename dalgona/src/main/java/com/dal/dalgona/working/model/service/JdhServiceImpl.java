package com.dal.dalgona.working.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.Getter;
import lombok.ToString;

@Service
public class JdhServiceImpl implements JdhService {

//	@Autowired
//	private SqlSessionTemplate session;

//	@Autowired
//	private JdhDao dao;

	@Autowired
	BCryptPasswordEncoder bc;

//	@Override
//	public Member jdhInsertTest(Member m) {
//		// TODO Auto-generated method stub
//		return dao.save(m);
//	}

//	@Override
//	public Member login(Member m) {
//		return dao.login(session, m);
//	}
//
//	@Override
//	public int insertMember(Member m) {
////		m.setPassword(bc.encode());
//		return dao.insertMember(session,m);
//	}

//	@Value("${imp_key}")
//	private String impKey;
//
//	@Value("${imp_secret}")
//	private String impSecret;
	
	@ToString
	@Getter
	private class Response {
		private PaymentInfo response;
	}
	
	@ToString
	@Getter
	private class PaymentInfo {
		private int amount;
	}

	public String getToken() throws IOException {

		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);

		JsonObject json = new JsonObject(); // 디펜던시 추가

//		json.addProperty("imp_key", impKey);
//		json.addProperty("imp_secret", impSecret);

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson(); // 디펜던시 추가

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;

	}

	public int paymentInfo(String imp_uid, String access_token) throws IOException {
		
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
	    
	    return response.getResponse().getAmount();
	    
	}

	public void payMentCancle(String access_token, String imp_uid, String amount, String reason) {

	}

}
