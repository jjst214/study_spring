package org.green.mapper;

import java.util.List;

import org.green.domain.BookAttachVO;

public interface BookAttachMapper {
	public void insert(BookAttachVO bvo);
	
	public void delete(String uuid);
	
	public List<BookAttachVO> findByBno(int bno);
	
	public void deleteAll(int bno);
}
