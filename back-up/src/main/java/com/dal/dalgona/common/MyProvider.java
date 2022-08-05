package com.dal.dalgona.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.dal.dalgona.common.model.vo.Member;

public class MyProvider implements AuthenticationProvider {
	
	@Autowired
	private SecurityService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		// DB데이터에서 인증하는 내용 구성
		String username=authentication.getName();
		String password=(String)authentication.getCredentials();
		Member loginMember=(Member)service.loadUserByUsername(username);
		
		if(loginMember==null || encoder.matches(password, loginMember.getPassword()))
				throw new BadCredentialsException("인증 실패");
		
		return new UsernamePasswordAuthenticationToken(loginMember, loginMember.getMemberPwd(),
												loginMember.getAuthorities());
		
	}

	@Override
	public boolean supports(Class<?> authentication) { // UsernamePasswordAuthenticationToken을 제공, 반환해줘야함
		// TODO Auto-generated method stub

		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
		
	}
	
	

}
