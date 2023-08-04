package org.green.controller;

import org.green.domain.BookVO;
import org.green.domain.Criteria;
import org.green.domain.PageDTO;
import org.green.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("book/*")
public class BookController {
	private BookService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/addBook")
	public void addBook() {
		
	}
	
	@PostMapping("/addBook")
	public String addBook(BookVO bvo, RedirectAttributes rttr) {
		service.addBook(bvo);
		rttr.addAttribute("result", bvo.getBno());
		
		return "redirect:/book/list";
	}
}
