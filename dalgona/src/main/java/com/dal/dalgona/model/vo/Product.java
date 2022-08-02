package com.dal.dalgona.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
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
	private String productCode;
	
	private String categoryCode;
	
	private int productPrice;
	
	private String productContent;
	
	private int productAmount;
	
	private String productThumb;

	private String productImage;
	
	private Date productDate;
	
	// 찜
	@ManyToMany(mappedBy="products")
	private List<Memberrrr> members;
	
	// 상품문의
	@OneToMany(mappedBy="member")
	private List<Qna> qna=new ArrayList();

}
