package com.dal.dalgona.common.model.vo;

public enum Roles {
	
	ROLE_ADMIN("ADMIN"),
	ROLE_USER("USER");
	
	String roles;
	
	Roles(String roles) {
		this.roles=roles;
	}
	
	public String value() {
		return roles;
	}

}
