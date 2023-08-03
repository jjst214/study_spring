package org.green.service;

import java.util.List;

import org.green.domain.MemberVO;
import org.green.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> getList() {
		List<MemberVO> list = mapper.getList();
		return list;
	}

	@Override
	public void join(MemberVO mvo) {
		if(mvo != null) {
			mapper.join(mvo);
		}
	}

	@Override
	public MemberVO getInfo(int mno) {
		return mapper.getInfo(mno);
	}

	@Override
	public boolean modify(MemberVO mvo) {
		boolean result = mapper.update(mvo) >= 1;
		return result;
	}

	@Override
	public boolean remove(int mno) {
		boolean result = mapper.delete(mno) >= 1;
		return result;
	}
	
}
