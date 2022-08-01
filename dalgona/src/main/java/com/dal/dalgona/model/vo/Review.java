package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Review {
	
	@Id
	private String reviewCode;
	
	private String productCode;
	
	private String memberId;
	
	private String reviewTtitle;
	
	private String reviewContent;
	
	private String reviewImage;
	
	private Date reviewDate;
	
	private String reviewReply;
	
	private int reviewStar;
	
	private int reviewLevel;
	
	// 자기자신을 참조 시 컬럼은 어떻게 추가해야하는지?

}
