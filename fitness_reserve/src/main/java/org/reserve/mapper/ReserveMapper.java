package org.reserve.mapper;

import java.util.List;
import org.reserve.domain.ReserveVO;

public interface ReserveMapper {
	public int insertReserve(ReserveVO rvo);
	
	public ReserveVO getInfo(int fno);
	
	public List<ReserveVO> allReserveList(ReserveVO rvo);
	
	public List<ReserveVO> getUserReserve(int mno);
	
	public int updateStatus();
}
