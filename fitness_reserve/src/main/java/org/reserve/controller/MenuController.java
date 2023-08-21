package org.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class MenuController {
	
	@GetMapping("/Contact")
	public void doContact() {
		
	}
	
	@GetMapping("/About")
	public void doAbout() {
		
	}
}
