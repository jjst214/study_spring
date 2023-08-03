package org.green.controller;

import org.green.domain.MemberVO;
import org.green.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("mlist", service.getList());
	}
	@GetMapping("/join")
	public void join() {
		
	}
	@PostMapping("/join")
	public String join(MemberVO mvo) {
		service.join(mvo);
		return "redirect:/member/list";
	}
}
