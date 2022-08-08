package com.dal.dalgona.common.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class CartId implements Serializable {
	
	private String member;
	
	private long product;

}
