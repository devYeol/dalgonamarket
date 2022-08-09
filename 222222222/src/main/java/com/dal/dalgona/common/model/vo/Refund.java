package com.dal.dalgona.common.model.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name = "seq_refund_no",sequenceName = "seq_refund_no")
public class Refund {
	
	@Id
	@GeneratedValue(generator = "seq_refund_no", strategy = GenerationType.SEQUENCE)
	private long RefundCode;
	
	private String refundStatus;
	
	@Column(length=1000)
	private String refundContent;
	
	// 환불
	@ManyToOne
	@JoinColumn(name="orderCode")
	private ProductOrder productOrder;

}
