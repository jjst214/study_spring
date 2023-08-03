package org.green.mapper;

import java.util.List;

import org.green.domain.MemberVO;

public interface MemberMapper {
	public List<MemberVO> getList();
	
	public void join(MemberVO mvo);
	
	public MemberVO getInfo(int mno);
	
	public int update(MemberVO mvo);
	
	public int delete(int mno);
}
