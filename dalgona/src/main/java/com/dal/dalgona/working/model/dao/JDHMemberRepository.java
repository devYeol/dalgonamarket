package com.dal.dalgona.working.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;

@Repository
public interface JDHMemberRepository extends JpaRepository<Member, String> { // <Entity, @Id자료형>
	
	Member save(Member m);

}
