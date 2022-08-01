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
public class OrderDetail {
	
	@Id // @Id 임시
	private String orderCode;
	
	private String productCode;
	
	private int orderAmount;
	
	private String orderOption;

}
