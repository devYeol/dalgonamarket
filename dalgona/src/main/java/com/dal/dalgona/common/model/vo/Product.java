package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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
public class Product {
	
	@Id
	private String productCode; //상품코드 PK
	
	private String productName; //상품명
	
	private int productPrice; //상품가격
	
	private String productContent; //상품정보
	
	private int productAmount; //상품수량
	
	private String productThumb; //상품썸네임

	private String productImage; //상품이미지
	
	private Date productDate; //상품등록일
	
	// 찜
	@ManyToMany(mappedBy="products")
	private List<Member> members;
	
	// 상품문의
	@OneToMany(mappedBy="member")
	private List<Qna> qna=new ArrayList();
	
	// 카테고리
	@ManyToOne
	@JoinColumn(name="categoryCode")
	private Category category;
	
	// 주문상세내역
	@OneToMany(mappedBy="product")
	private List<OrderDetail> orderdetails=new ArrayList();
	
	// 장바구니
	@ManyToMany(mappedBy="productCart")
	private List<Member> memberCart;

}
