package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Id;

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
