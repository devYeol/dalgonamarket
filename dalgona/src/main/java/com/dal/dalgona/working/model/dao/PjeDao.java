package com.dal.dalgona.working.model.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;

@Repository
public interface PjeDao extends JpaRepository<Member, Integer> {
	List<Member> findAll();
	
//	@Query()
//	List<Member> findByMemberName();
}
