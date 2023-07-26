package org.green.controller;

import org.green.domain.BoardVO;
import org.green.domain.Criteria;
import org.green.domain.PageDTO;
import org.green.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("board/*")
//의존성 주입
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//게시글 리스트
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	//게시글 등록 페이지
	@GetMapping("/register")
	public void register() {
		
	}
	//게시글 등록 처리 페이지
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		//RedirectAttributes
		//등록작업이 끝난 후 다시 목록화면으로 이동하기 위함
		//추가적으로 새롭게 등록한 게시물의 번호를 같이 전달하기 위해 사용
		log.info("register : " + board);
		service.register(board);
		rttr.addAttribute("result", "등록");
		return "redirect:/board/list2";
	}
	//게시글 1개 조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get");
		model.addAttribute("board", service.get(bno));
	}
	//수정
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if(service.modify(board)) {
			rttr.addAttribute("result", "수정");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	//삭제요청 처리
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		if(service.remove(bno)) {
			rttr.addAttribute("result", "삭제");
		}
		return "redirect:/board/list";
	}
	
}
