package org.green.service;

import java.util.List;

import org.green.domain.MemberVO;

public interface MemberService {
	public List<MemberVO> getList();
	
	public void join(MemberVO mvo);
	
	public MemberVO getInfo(int mno);
	
	public boolean modify(MemberVO mvo);
	
	public boolean remove(int mno);
}
