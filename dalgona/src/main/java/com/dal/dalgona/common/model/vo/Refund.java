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
public class Refund {
	
	@Id
	private String RefundCode;
	
	private String refundStatus;
	
	private String refundContent;
	
	// 환불
	@ManyToOne
	@JoinColumn(name="orderCode")
	private ProductOrder productOrder;

}
