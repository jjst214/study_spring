package org.green.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.green.domain.BoardAttachVO;
import org.green.domain.Criteria;
import org.green.domain.GalleryBoardVO;
import org.green.domain.PageDTO;
import org.green.service.GalleryBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("galleryboard/*")
@AllArgsConstructor
public class GalleryBoardController {
	@Setter(onMethod_= {@Autowired})
	private GalleryBoardService service;
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	//등록 페이지
	@GetMapping("/register")
	public void register() {
		
	}
	
	//등록처리
	@PostMapping("/register")
	public String register(GalleryBoardVO gboard, RedirectAttributes rttr) {
		log.info("==========================================");
		log.info("register : " + gboard);
		log.info("==========================================");
		service.register(gboard);
		rttr.addAttribute("result", gboard.getGno());
		
		return "redirect:/galleryboard/list";
	}
	//글 상세조회
	@GetMapping({"/gget", "/gmodify"})
	public void get(@RequestParam("gno") int gno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.get(gno));
	}
	//수정
	@PostMapping("/modify")
	public String modify(GalleryBoardVO gboard, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(gboard)) {
			rttr.addAttribute("result", "수정");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/galleryboard/gallerylist";
	}
	//삭제
	@PostMapping("/gremove")
	public String remove(int gno, RedirectAttributes rttr) {
		GalleryBoardVO gboard = service.get(gno);
		if(service.remove(gno)) {
			deleteFiles(gboard);
			rttr.addAttribute("result","삭제");
		}
		return "redirect:/galleryboard/gallerylist";
	}
	//파일 삭제 메소드
		private void deleteFiles(GalleryBoardVO gboard) {
			if(gboard == null) {
				return;
			}
			
		Path file = Paths.get("C:\\upload\\"+gboard.getUploadPath()+gboard.getFileName());
		try {
			//deleteIfExists = 파일이 있을경우 삭제
			Files.deleteIfExists(file);
			//이미지일 경우 썸네일 이미지도 삭제
			if(Files.probeContentType(file).startsWith("image")) {
				Path thumbNail = Paths.get("C:\\upload\\"+gboard.getUploadPath()+"\\s_"+gboard.getFileName());
				Files.delete(thumbNail);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
