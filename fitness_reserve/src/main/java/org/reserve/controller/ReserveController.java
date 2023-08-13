package org.reserve.controller;

import org.reserve.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public void doReserve() {
		
	}
}
