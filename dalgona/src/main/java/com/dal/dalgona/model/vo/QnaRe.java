package com.dal.dalgona.model.vo;

import java.util.Date;

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
@SequenceGenerator(name = "seq_qnareno",sequenceName = "seq_qnareno")
public class QnaRe {
	
	@Id
	@GeneratedValue(generator = "seq_qnareno", strategy = GenerationType.SEQUENCE)
	private int qnaReNo;
	
	private String qnaReContent;
	
	private Date qnaReDate;
	
	@OneToOne
	@JoinColumn(name="qnaCode")
	private Qna qna;
	
	/*
	 * @Id
	 * 
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="memberId") private Memberrrr member;
	 */

	
}
