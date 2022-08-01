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
public class Member {
	
	@Id
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String memberBirth;
	
	private String memberGender;
	
	private String memberPhone;
	
	private String memberEmail;
	
	private Date memberEnrollDate;

}
