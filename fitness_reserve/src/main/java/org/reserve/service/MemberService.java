package org.reserve.service;

import org.reserve.domain.AuthVO;
import org.reserve.domain.MemberVO;
public interface MemberService {
	public void join(MemberVO mvo, AuthVO avo);
	
	public int idCheck(String mid);
}
