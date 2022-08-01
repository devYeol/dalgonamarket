package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Id;

public class Order {
	
	@Id
	private String orderCode;
	
	private String memberId;
	
	private String orderStatus;
	
	private Date orderDate;

}
