package com.dal.dalgona.model.vo;

import java.util.Date;

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
public class Order {
	
	@Id
	private String orderCode;
	
	private String memberId;
	
	private String orderStatus;
	
	private Date orderDate;

}
