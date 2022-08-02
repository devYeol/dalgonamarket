package com.dal.dalgona.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
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
	
	@ManyToMany(mappedBy="products")
	private List<Memberrrr> members;

}