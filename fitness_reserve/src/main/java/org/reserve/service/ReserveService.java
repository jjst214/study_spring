package org.reserve.service;

import java.util.List;
import org.reserve.domain.PaymentVO;
import org.reserve.domain.ReserveVO;

public interface ReserveService {
	public ReserveVO getInfo(int fno);
	
	public void addReserve(List<ReserveVO> rvo, List<PaymentVO> pvo);
	
	public List<ReserveVO> accessReserve(ReserveVO rvo);
	
	public List<ReserveVO> getUserReserves(int mno);

	public int autoUpdate();
}
