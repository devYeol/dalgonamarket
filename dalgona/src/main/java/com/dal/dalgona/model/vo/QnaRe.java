package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class QnaRe {
	
	private String qnaCode;
	
	private String memberId;
	
	private String qnaReContent;
	
	private Date qnaReDate;
	
}
