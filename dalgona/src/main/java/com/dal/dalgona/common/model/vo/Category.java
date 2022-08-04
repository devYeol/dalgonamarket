package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
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
//@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class Category {
	
	@Id
	private String categoryCode;
	
	private String categoryName;
	
	// 상품과 카테고리의 양방향을 위함
	@OneToMany(mappedBy="category")
	private List<Product> products;

}
