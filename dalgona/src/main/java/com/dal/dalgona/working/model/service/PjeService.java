package com.dal.dalgona.working.model.service;

import java.util.List;
import java.util.Map;

import com.dal.dalgona.common.model.vo.Member;

public interface PjeService {
	List<Member> searchMembers(Map<String,Object> param);
	int searchMembersCount(Map<String,Object> param);
}
