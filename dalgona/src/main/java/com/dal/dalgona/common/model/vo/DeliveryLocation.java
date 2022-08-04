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
public class DeliveryLocation {
	
	@Id
	private String addressCode;
	
	private String adrPostNum;
	
	private String addrRoadName;
	
	private String addrDetail;
	
	private String addrReceiver;
	
	private String addrPhone;
	
	private String addrBase;
	
	// 배송지
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
}
