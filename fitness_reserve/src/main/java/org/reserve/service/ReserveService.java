package org.reserve.service;

import org.reserve.domain.PaymentVO;
import org.reserve.domain.ReserveVO;

public interface ReserveService {
	public void addReserve(ReserveVO rvo, PaymentVO pvo);
}
