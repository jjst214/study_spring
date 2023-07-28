package org.green.mapper;

import java.util.List;

import org.green.domain.BoardAttachVO;

public interface BoardAttachMapper {
	//등록
	public void insert(BoardAttachVO vo);
	//삭제
	public void delete(String uuid);
	//조회
	public List<BoardAttachVO> findByBno(Long bno);

}
