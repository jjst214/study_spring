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
	@PreAuthorize("isAuthenticated()")
	public void doReserve()  {
		
	}
	@PostMapping("/reservation")
	@PreAuthorize("isAuthenticated()")
	public String doReserve(List<ReserveVO> rvo, List<PaymentVO> pvo) {
		
		return "";
	}
	
	@PostMapping("/selectDate")
	@ResponseBody
	public ResponseEntity<List<ReserveVO>> reserveList(Date selectDate, int fno){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(selectDate);
		return new ResponseEntity<>(service.accessReserve(strDate, fno), HttpStatus.OK);
	}
}
