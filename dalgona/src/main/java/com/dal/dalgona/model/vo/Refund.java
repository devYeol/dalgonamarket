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
public class Refund {
	
	private String orderCode;
	
	private String memberId;
	
	private String refundStatus;
	
	private String refundContent;

}
