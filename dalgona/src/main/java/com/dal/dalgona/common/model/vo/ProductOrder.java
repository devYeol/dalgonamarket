package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
@SequenceGenerator(name="seq_order_code", sequenceName = "seq_order_code")
public class ProductOrder {
	
	@Id
	@GeneratedValue(generator = "seq_order_code", strategy = GenerationType.SEQUENCE)
	private long orderCode; //주문코드
	
	private String orderStatus; //주문상태 (배송 대기/ 중 / 배송완료)
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate; //주문날짜
	
//	private String impUid; // 아임포트 결제번호 임시주석
	
	@OneToOne
	@JoinColumn(name="addressCode")
	private DeliveryLocation selectLocation; //선택 배송지

	// 주문
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
	// 주문상세내역
	@OneToMany(mappedBy="productOrder")
	private List<OrderDetail> orderdetails=new ArrayList(); //주문 상세

}
