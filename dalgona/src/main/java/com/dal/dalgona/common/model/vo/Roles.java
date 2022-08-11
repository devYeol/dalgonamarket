package com.dal.dalgona.common.model.vo;

import lombok.Getter;

@Getter
public enum Roles {
	
	// spring security에서 ROLE_ 추적
	ADMIN("ROLE_ADMIN", "관리자"),
	USER("ROLE_USER", "유저");
	
	private final String key;
    private final String title;
	
	Roles(String key, String title) {
		this.key=key;
		this.title=title;
	}

}
