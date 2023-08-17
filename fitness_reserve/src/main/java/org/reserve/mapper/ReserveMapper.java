package org.reserve.mapper;

import java.util.Date;
import java.util.List;

import org.reserve.domain.ReserveVO;

public interface ReserveMapper {
	public int insertReserve(ReserveVO rvo);
	
//	public ReserveVO selectReserve(int rno);
	
	public List<ReserveVO> allReserveList(String rdate, int fno);
}
