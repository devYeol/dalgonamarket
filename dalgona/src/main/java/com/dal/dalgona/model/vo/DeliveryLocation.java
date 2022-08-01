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
public class DeliveryLocation {
	
	@Id
	private String addressCode;
	
//	private Memberrrr memberId;
	private String memberId;
	
	private String adrPostNum;
	
	private String addrRoadName;
	
	private String addrDetail;
	
	private String addrReceiver;
	
	private String addrPhone;
	
	private String addrBase;
	
	

}
