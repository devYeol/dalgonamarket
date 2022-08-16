package com.dal.dalgona.common.model.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@SequenceGenerator(name="seq_address_code", sequenceName = "seq_address_code")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class DeliveryLocation {
	
	@Id
	@GeneratedValue(generator = "seq_address_code", strategy = GenerationType.SEQUENCE)
	private long addressCode;
	
	private String adrPostNum;
	
	private String addrRoadName;
	
	private String addrDetail;
	
	private String addrReceiver;
	
	private String addrPhone;
	
	@Column (columnDefinition = "varchar2(255) default '0'")
	private String addrBase;
	
	// 배송지
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
}
