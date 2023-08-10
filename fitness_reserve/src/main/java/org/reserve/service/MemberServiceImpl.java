package org.reserve.service;


import org.reserve.domain.AuthVO;
import org.reserve.domain.MemberVO;
import org.reserve.mapper.AuthMapper;
import org.reserve.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder pwencoder;
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	@Setter(onMethod_= {@Autowired})
	private AuthMapper amapper;
	
	@Override
	public void join(MemberVO mvo, AuthVO avo) {
		mvo.setMpw(pwencoder.encode(mvo.getMpw()));
		mapper.insert(mvo);
		amapper.insert(avo);
	}

	@Override
	public int idCheck(String mid) {
		int cnt = mapper.idCheck(mid);
		return cnt;
	}
	
}
