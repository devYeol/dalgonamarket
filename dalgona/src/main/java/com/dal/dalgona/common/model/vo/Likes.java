package com.dal.dalgona.common.model.vo;

import javax.persistence.Entity;
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
//@IdClass(LikesId.class) // 복합키 사용시 필요함
@SequenceGenerator(name="seq_likes_code", sequenceName="seq_likes_code")
public class Likes {
	
	@Id
	@GeneratedValue(generator="seq_likes_code", strategy=GenerationType.SEQUENCE)
	private long likesCode;
	
	@ManyToOne
	@JoinColumn(name="memberId")
	private Member member;
	
	
	@ManyToOne
	@JoinColumn(name="productCode")
	private Product product;

}
