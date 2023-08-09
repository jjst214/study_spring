package org.reserve.security;

import org.reserve.domain.MemberVO;
import org.reserve.mapper.MemberMapper;
import org.reserve.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
public class CustomUserDetailService implements UserDetailsService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//MemberMapper를 사용해서 MemberVO 조회하고
		//MemberVO인스턴스가 있으면 UserDetails로 변환해서 반환
		MemberVO mvo = mapper.read(username);
		log.warn("=======================================================");
		log.warn(mvo);
		log.warn("=======================================================");
		
		return mvo == null ? null : new CustomUser(mvo);
	}
	
}
