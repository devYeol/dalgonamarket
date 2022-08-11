package com.dal.dalgona.working.model.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;

@Repository
public interface JdhInsertDao extends JpaRepository<Member, Integer>{
	
	Member save(Member m);

}
