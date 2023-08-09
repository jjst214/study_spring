package org.reserve.mapper;

import org.reserve.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String mid);
	
	public int insert(MemberVO mvo);
}
