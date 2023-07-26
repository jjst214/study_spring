package org.green.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.green.domain.SampleDTO;
import org.green.domain.SampleDtoList;
import org.green.domain.TodoDTO;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	@RequestMapping("")
	public void basic() {
		log.info("basic........................................");
	}
	@RequestMapping("/basic")
	public void basicbasic() {
		log.info("basicbasic");
	}
	
	@RequestMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		return "ex01";
	}
	@RequestMapping("/ex02")
	public String ex01(@RequestParam("username") String name, @RequestParam("userage") int age) {
		log.info("name은 : " + name);
		log.info("age는 : " + age);
		return "ex02";
	}
	
	//리스트로받기(동일한 이름의 파라미터가 여러개 전달되는 경우)
	//ex02List?ids=111&ids=222&ids=333
	@RequestMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids" + ids);
		return "ex02List";
	}
	
	@RequestMapping("/ex02Array")
	public String ex02List(@RequestParam("ids") String[] ids) {
		log.info("array ids" + Arrays.toString(ids));
		return "ex02Array";
	}
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDtoList list) {
		log.info("list Dtos : " + list);
		return "ex02Bean";
	}
	//바인딩 = 파라미터의 수집을 의미(요청할때 전달받은 값을 매개변수에 할당)
	//파라미터를 바인딩할때 자동으로 호출되도록 설정
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		//문자열 "2023-10-23" 요청 ---> Date타입으로 변환
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
//	}
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo : " + todo);
		return "ex03";
	}
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page")int page) {
		log.info("dto : " + dto);
		log.info("page : " + page);
		return "/sample/ex04";
	}
	@GetMapping("/re1")
	public String re1() {
		log.info("re1호출");
		return "redirect:/sample/re2";
	}
	@GetMapping("/re2")
	public String re2() {
		log.info("re2호출");
		return "re2";
	}
	@GetMapping("/ex05")
	public @ResponseBody SampleDTO ex05() {
		SampleDTO dto = new SampleDTO();
		dto.setAge(22);
		dto.setName("김그린");
		log.info(dto);
		return dto;
	}
	@GetMapping("/ex06")
	//HTTP 헤더 정보나 데이터를 전달
	public ResponseEntity<String> ex06(){
		log.info("ex06");
		String msg = "{\"name\":\"홍길동\"}";
		org.springframework.http.HttpHeaders header = new org.springframework.http.HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity<String>(msg, header, HttpStatus.OK);
	}
}

