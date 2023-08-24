package org.reserve.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.reserve.domain.PaymentVO;
import org.reserve.domain.ReserveVO;
import org.reserve.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/reserve/*")
public class ReserveController {
	@Setter(onMethod_ = {@Autowired}) 
	private ReserveService service;
	
	@GetMapping("/reservation")
	public void doReserve()  {
		
	}
	@PostMapping("/reservation")
	@PreAuthorize("isAuthenticated()")
	public String doReserve(ReserveVO rvo, Model model) throws ParseException {
		List<ReserveVO> rvos = new ArrayList<ReserveVO>();
		String[] r = rvo.getRstart().strip().split(",");
		for(int i=0; i<r.length; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			Date date = sdf.parse(r[i].strip());
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.HOUR_OF_DAY, 1);
			date = cal.getTime();
			String rend = sdf.format(date);
			
			ReserveVO re = new ReserveVO();
			re.setMno(rvo.getMno());
			re.setFno(rvo.getFno());
			re.setRdate(rvo.getRdate());
			re.setRstart(r[i]);
			re.setRend(rend);
			rvos.add(re);
		}
		model.addAttribute("rvo", rvos);
		return "/reserve/reservation-payment";
	}
	
	@PostMapping("/selectDate")
	@ResponseBody
	public ResponseEntity<List<ReserveVO>> reserveList(Date rdate, int fno) throws ParseException{
		ReserveVO rvo = new ReserveVO();
		ReserveVO info = service.getInfo(fno);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(rdate);
		log.info(strDate);
		rvo.setRdate(strDate);
		rvo.setFno(fno);
		rvo.setFinfo(info.getFinfo());
		return new ResponseEntity<>(service.accessReserve(rvo), HttpStatus.OK);
	}
	
	@PostMapping("/selectRoom")
	@ResponseBody
	public ResponseEntity<ReserveVO> getRoomInfo(int fno){
		ReserveVO info = service.getInfo(fno);
		return new ResponseEntity<>(info, HttpStatus.OK);
	}
	
	@GetMapping("/reservation-payment")
	@PreAuthorize("isAuthenticated()")
	public void doPayment() {
		
	}
	@PostMapping("/reservation-payment")
	@PreAuthorize("isAuthenticated()")
	public String doPayment(PaymentVO pvo, ReserveVO rvo) {
		List<PaymentVO> pvos = new ArrayList<PaymentVO>();
		List<ReserveVO> rvos = new ArrayList<ReserveVO>();
		
		for(int i=0; i<rvo.getRvoList().size(); i++) {
			ReserveVO r = new ReserveVO();
			PaymentVO p = new PaymentVO();
			r.setFno(rvo.getRvoList().get(i).getFno());
			r.setMno(rvo.getRvoList().get(i).getMno());
			r.setRdate(rvo.getRvoList().get(i).getRdate());
			r.setRstart(rvo.getRvoList().get(i).getRstart());
			r.setRend(rvo.getRvoList().get(i).getRend());
			p.setPkind(pvo.getPkind());
			p.setPdate(pvo.getPdate());
			p.setPbank(pvo.getPbank());
			rvos.add(r);
			pvos.add(p);
		}
		service.addReserve(rvos, pvos);
		
		return "redirect: /";
	}
	
	@GetMapping("/myreserve")
	@PreAuthorize("isAuthenticated()")
	public void viewList(int mno, Model model) {
		//해당 유저의 예약정보 담아서 리턴
		model.addAttribute("list", service.getUserReserves(mno));
	}
}
