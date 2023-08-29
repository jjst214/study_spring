package com.packt.cardatebase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
//기본 웹 보안 구성을 비활성화하고
//자체 구성을 정의하기 위한 어노테이션
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.packt.cardatebase.service.UserDetailServiceImpl;
@Configuration
//SpringSecurityFilterChain이 자동으로 포함됨
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailServiceImpl userDetailService;
	
	//인증필터의존주입
	@Autowired
	private AuthenticationFilter authenticationFilter;
	
	//AuthenticationManager를 LoginController클래스에 주입했으므로
	//빈으로 등록해줌
	@Bean
	public AuthenticationManager getAuthenticationManager() throws Exception{
		return authenticationManager();
	}
	
	@Override
	//보호되는 경로와 보호되지 않는 경로를 정의함
	//csrf비활성화함
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
		.sessionManagement()
		.sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
		.authorizeRequests()
		// /login엔드 포인트에 대한 요청은 보호하지 않음
		.antMatchers(HttpMethod.POST, "/login").permitAll()
		//다른 모든 요청은 보호됨
		.anyRequest().authenticated()
		.and()
		.addFilterBefore(authenticationFilter, UsernamePasswordAuthenticationFilter.class);
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailService).passwordEncoder(new BCryptPasswordEncoder());
	}
}
