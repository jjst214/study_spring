package org.reserve.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/reserve/*")
public class ReserveController {
	@Setter(onMethod_ = {@Autowired}) 
	private ReserveService service;
	
	@GetMapping("/reservation")
	@PreAuthorize("isAuthenticated()")
	public void doReserve(Model model) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		String date = sdf.format(cal.getTime());
		Date convertDate = sdf.parse(date);
		log.info("==================================");
		log.info(convertDate);
		log.info("==================================");
		model.addAttribute("resultlist", service.accessReserve(convertDate));
	}
	
	@PostMapping("/selectDate")
	public ResponseEntity<List<ReserveVO>> reserveList(Date selectDate){
		List<ReserveVO> list = service.accessReserve(selectDate);
		
		return new ResponseEntity<List<ReserveVO>>(list, HttpStatus.OK);
	}
}
