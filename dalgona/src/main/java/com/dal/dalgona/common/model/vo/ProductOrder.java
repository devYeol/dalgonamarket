package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

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
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class ProductOrder {
	
	@Id
	private String orderCode;
	
	private String orderStatus;
	
	private Date orderDate;
	
	@OneToOne
	@JoinColumn(name="addressCode")
	private DeliveryLocation selectLocation;
	
	// 주문
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
	// 주문상세내역
	@OneToMany(mappedBy="productOrder")
	private List<OrderDetail> orderdetails=new ArrayList();

}
