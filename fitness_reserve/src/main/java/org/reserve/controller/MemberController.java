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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String doJoin(MemberVO mvo, AuthVO avo) throws Exception {
		if(mvo != null) {
			service.join(mvo, avo);
			log.info("가입완료");
		}
		
		return "redirect:/board/list";
	}
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("mid") String mid) {
		int cnt = service.idCheck(mid); 
		return cnt;
	}
}
