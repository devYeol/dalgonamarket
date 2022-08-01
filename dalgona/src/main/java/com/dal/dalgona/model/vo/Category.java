package com.dal.dalgona.model.vo;

import javax.persistence.Id;

public class Category {
	
	@Id
	private String categoryCode;
	
	private String categoryName;

}
