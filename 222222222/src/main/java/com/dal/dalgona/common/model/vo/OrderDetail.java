package com.dal.dalgona.common.model.vo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
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
@IdClass(OrderDetailId.class) // 복합키 사용시 필요함
public class OrderDetail {
	
	// 주문상세내역 클래스
	
	private int orderAmount;
	
	private String orderOption;
	
	@Id
	@ManyToOne
	@JoinColumn(name="orderCode")
	private ProductOrder productOrder;
	
	@Id
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;

}
