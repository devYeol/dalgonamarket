package com.dal.dalgona.common.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrderDetailId implements Serializable {
	
	private long productOrder;
	
	private long product;

}
