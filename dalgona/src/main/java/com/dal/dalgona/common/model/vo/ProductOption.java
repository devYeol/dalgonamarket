package com.dal.dalgona.common.model.vo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ProductOption {
	
	@Id
	private String optionCode;
	
	private String oprionName;
	
	private int optionPrice;
	
	// 상품옵션
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;
	
	

}
