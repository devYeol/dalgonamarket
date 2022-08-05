package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
public class Member {
	
	@Id
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String memberBirth;
	
	private String memberGender;
	
	private String memberPhone;
	
	@Column(unique=true)
	private String memberEmail;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date memberEnrollDate; // default값 주는 어노테이션 찾아서 적용하기 timestamp?
	
	// 찜
	@ManyToMany
	@JoinTable(name="likes",
				joinColumns=@JoinColumn(name="memberId"),
				inverseJoinColumns=@JoinColumn(name="productCode")
			)
	private List<Product> products;
	
	// 상문문의
	@OneToMany(mappedBy="product")
	private List<Qna> qna=new ArrayList();
	
	// 장바구니
	@ManyToMany
	@JoinTable(name="cart",
				joinColumns=@JoinColumn(name="memberId"),
				inverseJoinColumns=@JoinColumn(name="productCode")
			)
	private List<Product> productCart;
	

	
	// 배송주소 양방향
	//	@OneToMany(mappedBy="memberId")
	//	private List<DeliveryLocation> memberdelivery=new ArrayList();

}
