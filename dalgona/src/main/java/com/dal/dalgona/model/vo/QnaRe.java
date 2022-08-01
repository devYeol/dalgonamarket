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
public class QnaRe {
	
	@Id // @Id 임시
	private String qnaCode;
	
	private String memberId;
	
	private String qnaReContent;
	
	private Date qnaReDate;
	
}
