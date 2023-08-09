package org.reserve.controller;

import org.reserve.controller.MemberController;
import org.reserve.domain.AuthVO;
import org.reserve.domain.MemberVO;
import org.reserve.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("member/*")
public class MemberController {
	@Setter(onMethod_ = {@Autowired}) 
	private MemberService service;
	
	@GetMapping("/join")
	@PreAuthorize("isAnonymous()")
	public void doJoin() {
		
	}
	
	@PostMapping("/join")
	@PostAuthorize("isAnonymous()")
	public String doJoin(MemberVO mvo, AuthVO avo) {
		log.info("입력아이디" + mvo.getMid());
		log.info("입력비밀번호" + mvo.getMpw());
		if(mvo != null) {
			service.join(mvo, avo);
			log.info("가입완료");
		}
		return "redirect:/board/list";
	}
}
