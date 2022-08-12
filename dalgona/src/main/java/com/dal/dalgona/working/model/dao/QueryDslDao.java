package com.dal.dalgona.working.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.QMember;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;

@Repository
public class QueryDslDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<Member> searchMenber(String type, String keyword){
		JPAQueryFactory factory=new JPAQueryFactory(em);
		QMember member=QMember.member;
		BooleanBuilder bb=new BooleanBuilder();
		switch(type) {
			case "memberId": bb.and(member.memberId.eq(keyword));
			case "memberName" : bb.and(member.memberName.contains(keyword));break;
			default : bb.or(member.memberId.eq(keyword)).or(member.memberName.contains(keyword));
		}
		return factory.selectFrom(member).offset(0).limit(0).where(bb).fetch();
		//return factory.selectFrom(member).where(member.memberId.eq(keyword)).fetch();
	}
	
}
