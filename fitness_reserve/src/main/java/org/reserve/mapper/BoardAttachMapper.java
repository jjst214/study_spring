package org.reserve.mapper;

import java.util.List;

import org.reserve.domain.BoardAttachVO;


public interface BoardAttachMapper {
	//등록
	public void insert(BoardAttachVO vo);
	//삭제
	public void delete(String uuid);
	//조회
	public List<BoardAttachVO> findByBno(int bno);
	//게시글 번호에 해당하는 레코드 삭제(게시글삭제 시 첨부파일들도 삭제)
	public void deleteAll(int bno);
}
