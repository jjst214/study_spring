package org.green.domain;

import java.util.List;

import lombok.Data;

@Data
public class BookVO {
	private int bno;
	private String bname;
	private String bpublisher;
	private String bauthor;
	private String bprice;
	private String bpubdate;
	
	private List<BookAttachVO> attachList;
}
