package com.dal.dalgona.model.vo;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class OrderDetail {
	
	private String orderCode;
	
	private String productCode;
	
	private int orderAmount;
	
	private String orderOption;

}
