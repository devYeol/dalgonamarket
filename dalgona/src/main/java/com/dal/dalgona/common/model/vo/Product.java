package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
@Entity(name="product")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
@SequenceGenerator(name="seq_prono", sequenceName="seq_prono")
@ToString(exclude= {"members","qna","category","orderdetails","memberCart","optionCode"})
public class Product {
	
	@Id
	@GeneratedValue(generator="seq_prono", strategy=GenerationType.SEQUENCE)
	private long productCode; //상품코드 PK
	
	private String productName; //상품명
	
	private int productPrice; //상품가격
	
	private String productContent; //상품정보
	
	private int productAmount; //상품수량
	
	private String productThumb; //상품썸네임

	private String productImage; //상품이미지
	
	private String categoryName; //카테고리
	
	 @Temporal(TemporalType.TIMESTAMP)
	// update시에도 되는걸로 하는지 확인할 것 @CreationTimestamp = insert, update시 둘 다 적용됨
	private Date productDate; //상품등록일
	
//	찜
//	@ManyToMany(mappedBy="products")
//	private List<Member> members;
	
	// 찜
	@OneToMany(mappedBy="product", cascade = CascadeType.REMOVE)
	private List<Likes> likes=new ArrayList();
	
	// 상품문의
	@OneToMany(mappedBy="member", cascade = CascadeType.REMOVE)
	private List<Qna> qna=new ArrayList();
	
//	// 카테고리
//	@ManyToOne
//	@JoinColumn(name="categoryCode")
//	private Category category;
//	
	// 주문상세내역
	@OneToMany(mappedBy="product", cascade = CascadeType.REMOVE)
	private List<OrderDetail> orderdetails=new ArrayList();
	
	// 장바구니
//	@ManyToMany(mappedBy="productCart")
//	private List<Member> memberCart;
	
	// 장바구니
	@OneToMany(mappedBy="product", cascade = CascadeType.REMOVE)
	private List<Cart> cart=new ArrayList();
	
	//옵션
	@OneToMany(mappedBy = "optionCode",cascade = CascadeType.REMOVE)
	private List<ProductOption> optionCode;

}
