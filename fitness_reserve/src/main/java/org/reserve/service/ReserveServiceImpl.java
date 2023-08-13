package org.reserve.service;

import org.reserve.domain.PaymentVO;
import org.reserve.domain.ReserveVO;
import org.reserve.mapper.PaymentMapper;
import org.reserve.mapper.ReserveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReserveServiceImpl implements ReserveService {
	@Setter(onMethod_= {@Autowired})
	private ReserveMapper rmapper;
	@Setter(onMethod_= {@Autowired})
	private PaymentMapper pmapper;
	
	@Override
	public void addReserve(ReserveVO rvo, PaymentVO pvo) {
		if(rvo != null && pvo != null) {
			rmapper.insertReserve(rvo);
			pmapper.insertPayment(pvo);
			log.info("예약완료");
		}
	}
	
}
