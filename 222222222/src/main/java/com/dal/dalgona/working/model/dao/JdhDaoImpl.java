package com.dal.dalgona.working.model.dao;

import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;


@Repository
public class JdhDaoImpl implements JdhDao {
	
//	@Autowired
//	BCryptPasswordEncoder bc; // 로그인 체크시 dao에서 암호 매칭

	@Override
	public Member save(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member findByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	@Override
//	public Member login(SqlSessionTemplate session, Member m) {
//		return session.selectOne("member.selectMember",m);
//	}
//
//	@Override
//	public int insertMember(SqlSessionTemplate session, Member m) {
//		return session.insert("member.insertMember",m);
//	}

}
