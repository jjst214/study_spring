package com.packt.cardatebase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//기본 웹 보안 구성을 비활성화하고
//자체 구성을 정의하기 위한 어노테이션
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.packt.cardatebase.service.UserDetailServiceImpl;
@Configuration
//SpringSecurityFilterChain이 자동으로 포함됨
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserDetailServiceImpl userDetailService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailService).passwordEncoder(new BCryptPasswordEncoder());
	}
}
