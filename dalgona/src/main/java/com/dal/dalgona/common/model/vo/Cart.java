package com.dal.dalgona.common.model.vo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
//@IdClass(CartId.class) // 복합키 사용시 필요함
@SequenceGenerator(name="seq_cart_code", sequenceName="seq_cart_code")
public class Cart {
	
	@Id
	@GeneratedValue(generator="seq_cart_code", strategy=GenerationType.SEQUENCE)
	private long cartCode;
	
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	

	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;
	
	@Column /* (columnDefinition = "number default 1") */
	private int cartAmount;
	
	@Column
    @ElementCollection(targetClass=Cart.class)
	private List<Cart> carts;

}
