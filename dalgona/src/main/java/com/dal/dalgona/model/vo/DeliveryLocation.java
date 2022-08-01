package com.dal.dalgona.model.vo;

import javax.persistence.Id;

public class DeliveryLocation {
	
	@Id
	private String addressCode;
	
	private String memberId;
	
	private String adrPostNum;
	
	private String addrRoadName;
	
	private String addrDetail;
	
	private String addrReceiver;
	
	private String addrPhone;
	
	private String addrBase;

}
