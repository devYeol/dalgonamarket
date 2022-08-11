package com.dal.dalgona.working.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Member;

public interface PjeDao {
	List<Member> searchMembers(SqlSessionTemplate session, Map<String,Object> param);
}
