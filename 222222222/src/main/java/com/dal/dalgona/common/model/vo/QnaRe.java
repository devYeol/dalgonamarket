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
/* @IdClass(QnaReId.class) */
@SequenceGenerator(name = "seq_qnare_code",sequenceName = "seq_qnare_code")
public class QnaRe {
	
	@Id
	@GeneratedValue(generator = "seq_qnare_code", strategy = GenerationType.SEQUENCE)
	private long qnaReCode;
	
	@Column(length=1000)
	private String qnaReContent;
	
	private Date qnaReDate;
	
	// 문의답변
	@OneToOne
	@JoinColumn(name="qnaCode")
	private Qna qna;
	
}
