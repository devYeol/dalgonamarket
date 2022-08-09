package com.dal.dalgona.working.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msw {
	
	
	private String proTitle; //상품 타이틀 (과자,초콜릿 등)
	private String proName; //상품명 
	private int proPrice; //상품 가격
	private int proAmount; //상품 개수
	private Date orderDate; // 주문날짜
	private Date arriveDate; //도착 날짜
	
	
}
