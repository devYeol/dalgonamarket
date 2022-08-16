package com.dal.dalgona.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.dal.dalgona.common.model.vo.Roles;

import lombok.AllArgsConstructor;

@Configuration // 설정파일 어노테이션
@EnableWebSecurity // web 보안을 활성화 시키는 어노테이션
@AllArgsConstructor
public class SecurityConfig { // Security 설정 클래스
	
	@Bean
	public AuthenticationProvider ap() {
		return new MyProvider();
	};
	
	@Bean
	public BCryptPasswordEncoder bc() { // 암호화 bean
		return new BCryptPasswordEncoder();
	}
	
	// filter로 처리할 경우 따로 WebSecurity는 사용하지 않음
	// filter에서 한꺼번에 처리할 것
//	@Override
//	public void configure(WebSecurity ws) throws Exception {
//		
//		// 분리작성
//		// static 관련 화위폴더 ingnore (=인가무시)
//		ws.ignoring()
//			.antMatchers("/css/**", "/js/**", "/fonts/**", "/images/**");
//		
//	}
	
	// filter
	@Bean
	public SecurityFilterChain authenticatePath(HttpSecurity http) throws Exception { // HttpSecurity = <security:@@> 태그와 같은 역할
		
		return http.csrf().disable() // csrf 보안 제거
				.httpBasic().disable() // 기본 제공 로그인 폼 제거
				
				.formLogin() // 로그인 설정
					.loginPage("/loginpage") // 로그인 페이지 설정
					.successForwardUrl("/member/loginEnd") // 로그인 성공시 이동 url
					.loginProcessingUrl("/logincheck")
					.usernameParameter("memberId")
					.passwordParameter("memberPwd")
					.and()
				
				// 인증 권한에 대한 설정 interceptor-url 같은 역할
				.authorizeRequests()
					// static 관련 화위폴더 인가무시
					.antMatchers("/loginpage", "/logincheck", "/resources/**").permitAll()
					// localhost에서 리디렉션한 횟수가 너무 많습니다. -> /login 페이지 접근제한 풀지 않으면 뜨는 현상
					
//					.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
//					.antMatchers("/admin/**").hasRole("USER")
//					.antMatchers("/admin/**").hasAnyRole(Roles.getKey())
					
					// 임시로 모든 페이지 보안에서 제외시키기
//					.antMatchers("/**").authenticated() // 인증
					.antMatchers("/**").permitAll()
					
					// 권한을 줘서 디비에 있는 것으로 주기
					// .antMatchers("접근차단 할 url 주소").access("hasRole(dddd)")
					// exception과 같음 -> 범위가 가장 넓은 것을 제일 아래로
					
					.and()
					
				.logout() // 로그아웃 설정
					.logoutUrl("/Jdhlogout")
					.and()
					
				.authenticationProvider(ap()) // AuthenticationProvider
				
				.build();
		
	}
	
}
