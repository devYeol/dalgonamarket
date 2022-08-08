package com.dal.dalgona.working.model.service;

import com.dal.dalgona.common.model.vo.Member;

public interface KCLService {
	
	Member login(Member m);
	
	int insertMember(Member m);
}
