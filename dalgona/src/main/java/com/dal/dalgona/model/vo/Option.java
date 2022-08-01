package com.dal.dalgona.model.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Option {
	
	@Id
	private String optionCode;
	
	private String productCode;
	
	private String oprionName;
	
	private int optionPrice;

}
