package com.dal.dalgona.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.JDHMemberRepository;


@Service
public class SecurityService implements UserDetailsService {
	
	@Autowired
	private JDHMemberRepository memberRepo;

	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		Member m=memberRepo.findByMemberId(memberId);
		if(m==null) throw new UsernameNotFoundException(memberId+" 는 등록되지 않은 회원입니다.");
		
		return m;
		
	}
	
}
