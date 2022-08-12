package com.dal.dalgona.common.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
@SequenceGenerator(name="seq_qna_code", sequenceName = "seq_qna_code")
public class Qna {
	
	@Id
	@GeneratedValue(generator = "seq_qna_code", strategy = GenerationType.SEQUENCE)
	private long qnaCode;
	
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
	// 상품문의
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;
	
	@Column(length=1000)
	private String qnaTitle;
	
	@Column(length=1000)
	private String qnaContent;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date qnaDate;


	
	
	
	public void setMember(Member m) {
		
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
