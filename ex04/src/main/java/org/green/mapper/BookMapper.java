package org.green.mapper;

import java.util.List;
import java.util.Map;

import org.green.domain.BookVO;
import org.green.domain.Criteria;

public interface BookMapper {
	public void insert(BookVO bvo);
	
	public int update(BookVO bvo);
	
	public int delete(int bno);
	
	public BookVO read(int bno);
	
	public List<BookVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<BookVO> searchTest(Map<String, Map<String, String>> map);
	
}
