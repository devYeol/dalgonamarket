package com.dal.dalgona.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrderDetailId implements Serializable {
	
	private String productOrder;
	
	private String product;

}
