package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
//@IdClass(QnaId.class)
public class Qna {
	
	// 상품문의
	
	@Id
	private String qnaCode;
	
	@ManyToOne
	@JoinColumn(name="memberId")
	private Memberrrr member;
	
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;
	
	/*
	 * private String memberId;
	 * 
	 * private String productCode;
	 */
	
	private String qnaContent;
	
	private Date qnaDate;
	
	public void setMemberrrr(Memberrrr m) {
		
		if(this.member!=null) {
			this.member.getQna().remove(this);
		}
		m.getQna().add(this);
		this.member=m;
		
	}
	
	public void setProduct(Product p) {
		if(this.product!=null) {
			this.product.getQna().remove(this);
		}
		p.getQna().add(this);
		this.product=p;
	}
	
	

}
