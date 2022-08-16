package com.dal.dalgona.common.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
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

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
@SequenceGenerator(name="seq_order_code", sequenceName = "seq_order_code")
@ToString(exclude = "member")
@DynamicUpdate
public class ProductOrder {
	
	@Id
	@GeneratedValue(generator = "seq_order_code", strategy = GenerationType.SEQUENCE)
	private long orderCode; //주문코드
	
	@Column (columnDefinition = "varchar2(255) default '주문대기'")
	private String orderStatus; //주문상태 (배송 대기/ 중 / 배송완료)
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate; //주문날짜
	
	@Column(nullable = true)
	private long totalPrice;
	
//	private String payMethod; // 불필요 'card'로 고정
	
	private String impUid=""; // 아임포트 결제번호 추가
	
	@OneToOne
	@JoinColumn(name="addressCode")
	private DeliveryLocation selectLocation; //선택 배송지

	// 주문
//	@ManyToOne
//	@JoinColumn(name="memberId")
//	private Member member;
	
	// 주문상세내역
	@OneToMany(mappedBy="productOrder")
	private List<OrderDetail> orderdetails; //주문 상세

}
