package com.dal.dalgona.common.model.vo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

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
@SequenceGenerator(name="seq_category_code", sequenceName = "seq_category_code")
public class Category {
	
	@Id
	@GeneratedValue(generator = "seq_category_code", strategy = GenerationType.SEQUENCE)
	private long categoryCode;
	
	private String categoryName;
	
	// 상품과 카테고리의 양방향을 위함
	@OneToMany(mappedBy="category")
	private List<Product> products;

}
