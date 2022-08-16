//package com.dal.dalgona.common;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.dal.dalgona.common.model.vo.Member;
//import com.dal.dalgona.member.model.dao.MemberDao;
//
//
//@Service
//public class SecurityService implements UserDetailsService {
////	
////	@Autowired
////	private JdhDaoImpl repo; // Member table repository
//	
//	@Autowired
//	private MemberDao dao;
//	
//	@Autowired
//	private SqlSessionTemplate session;
//	
//	@Override
//	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
//		// UsernameNotFoundException > 유저를 찾을 수 없을 때 exception 처리
//		// TODO Auto-generated method stub
//		
//		Member m=dao.login(session, Member.builder().memberId(memberId).build());
//		
//		if(m==null) throw new UsernameNotFoundException(memberId+" 는 등록되지 않은 회원입니다.");
//		
//		return m;
//		
//	}
//	
//}
