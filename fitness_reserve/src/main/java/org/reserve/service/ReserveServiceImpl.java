package org.reserve.service;

import java.util.Date;
import java.util.List;

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
	public void addReserve(List<ReserveVO> rvo, List<PaymentVO> pvo) {
		if(rvo != null && pvo != null) {
			for(int i=0; i<rvo.size(); i++) {
				rmapper.insertReserve(rvo.get(i));
				pmapper.insertPayment(pvo.get(i));
			}
			log.info("예약완료");
		}
	}

	@Override
	public List<ReserveVO> accessReserve(Date rdate) {
		List<ReserveVO> lists = rmapper.allReserveList(rdate);
		return lists;
	}
	
}
