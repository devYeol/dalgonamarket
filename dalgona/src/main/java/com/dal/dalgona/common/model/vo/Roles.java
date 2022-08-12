package com.dal.dalgona.common.model.vo;

import lombok.Getter;

@Getter
public enum Roles {
	
	// spring security에서 ROLE_ 추적
	ADMIN,
	USER;
	
//	private final String key;
//
//	
//	Roles(String key) {
//		this.key=key;
//	}
//	
//	public String getKey() {
//		return key;
//	}

}
