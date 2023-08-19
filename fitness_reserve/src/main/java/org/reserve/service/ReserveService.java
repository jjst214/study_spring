package org.reserve.service;

import java.util.List;

import org.reserve.domain.PaymentVO;
import org.reserve.domain.ReserveVO;

public interface ReserveService {
	public void addReserve(List<ReserveVO> rvo, List<PaymentVO> pvo);
	
	public List<ReserveVO> accessReserve(ReserveVO rvo);
}
