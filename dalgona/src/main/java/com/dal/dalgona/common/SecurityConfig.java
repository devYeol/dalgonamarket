package com.dal.dalgona.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // 설정파일 어노테이션
@EnableWebSecurity // web 보안을 활성화 시키는 어노테이션
public class SecurityConfig { // Security 설정 클래스
	
	@Bean
	public AuthenticationProvider ap() {
		return new MyProvider();
	};
	
	@Bean
	public BCryptPasswordEncoder bc() {
		return new BCryptPasswordEncoder();
	}
	
	// filter 역할
	@Bean
	public SecurityFilterChain authenticatePath(HttpSecurity http) throws Exception { // HttpSecurity = <security:@@> 태그와 같은 역할
		
		return http.csrf().disable()
				
				.formLogin() // 로그인 설정
//					.loginPage(null) // 로그인 페이지 설정
//					.successForwardUrl("/successlogin") // 로그인 성공시 이동 url
					.successForwardUrl("/")
					.and() // and() 로 구분
					
				// 인증 권한에 대한 설정 interceptor-url 같은 역할
				.authorizeRequests()
					// 시큐리티 예외처리 static, resources, jason(?) 등
//					.antMatchers("/static/**", "/resources/**",
//								 "/css/**", "/js/**", "/fonts/**", "/images/**").permitAll()
					
					// 임시로 모든 페이지 보안에서 제외시키기
					.antMatchers("/**").permitAll()
					
					
//					.antMatchers("/**").hasRole("USER") // user만 access 가능
					
					// 권한을 줘서 디비에 있는 것으로 주기
					// .antMatchers("접근차단 할 url 주소").access("hasRole(dddd)")
					// exception과 같음 -> 범위가 가장 넓은 것을 제일 아래로
					
					.and()
					
				.logout() // 로그아웃 설정
					.logoutUrl("/JDHLogout")
					.and()
					
				.authenticationProvider(ap()) // AuthenticationProvider
				.build();
		
	}
}
