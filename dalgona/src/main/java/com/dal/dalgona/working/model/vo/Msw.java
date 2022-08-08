package com.dal.dalgona.working.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msw {
	
	private String proName; //상품명 
	private int proPrice; //상품 가격
	
	
}
