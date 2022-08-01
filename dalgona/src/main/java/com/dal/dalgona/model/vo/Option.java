package com.dal.dalgona.model.vo;

import javax.persistence.Id;

public class Option {
	
	@Id
	private String optionCode;
	
	private String productCode;
	
	private String oprionName;
	
	private int optionPrice;

}
