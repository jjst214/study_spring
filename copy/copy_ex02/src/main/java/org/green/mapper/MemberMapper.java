package org.green.mapper;

import org.green.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	
	public int insert(MemberVO mvo);
}
