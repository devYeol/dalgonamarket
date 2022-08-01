package com.dal.dalgona.model.vo;

import java.util.Date;

import javax.persistence.Id;

public class Qna {
	
	@Id
	private String qnaCode;
	
	private String memberId;
	
	private String productCode;
	
	private String qnaContent;
	
	private Date qnaDate;

}
