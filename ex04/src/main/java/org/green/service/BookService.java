package org.green.service;

import java.util.List;

import org.green.domain.BookAttachVO;
import org.green.domain.BookVO;
import org.green.domain.Criteria;

public interface BookService {
	public void addBook(BookVO bvo);
	
	public BookVO get(int bno);
	
	public boolean modify(BookVO bvo);
	
	public boolean remove(int bno);
	
	public List<BookVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BookAttachVO> getAttachList(int bno);
}
