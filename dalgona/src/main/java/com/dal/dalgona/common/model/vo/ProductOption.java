package com.dal.dalgona.common.model.vo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@SequenceGenerator(name="seq_option_code", sequenceName = "seq_option_code")
public class ProductOption {
	
	@Id
	@GeneratedValue(generator = "seq_option_code", strategy = GenerationType.SEQUENCE)
	private long optionCode;
	
	private String optionName;
	
	private int optionPrice;
	
	// 상품옵션
	//@ManyToOne(cascade = CascadeType.PERSIST)
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;
	
	

}
