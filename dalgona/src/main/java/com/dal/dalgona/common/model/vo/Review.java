package com.dal.dalgona.common.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@SequenceGenerator(name="seq_review_code", sequenceName = "seq_review_code")
public class Review {
	
	@Id
	@GeneratedValue(generator = "seq_review_code", strategy = GenerationType.SEQUENCE)
	private long reviewCode;
	
	private long productCode;
	
	private String memberId;
	
	private String reviewTtitle;
	
	@Column(length=1000)
	private String reviewContent;
	
	private String reviewImage;
	
	private Date reviewDate;
	
	private String reviewReply;
	
	private int reviewStar;
	
	private int reviewLevel;
	
	// 자기자신을 참조 시 컬럼은 어떻게 추가해야하는지?
	// Review 자신이 자신 참조
	@OneToOne
	@JoinColumn(name="reviewRef")
	private Review review;

}
