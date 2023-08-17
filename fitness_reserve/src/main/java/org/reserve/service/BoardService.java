package org.reserve.service;

import java.util.List;

import org.reserve.domain.BoardAttachVO;
import org.reserve.domain.Criteria;
import org.reserve.domain.ReviewBoardVO;

public interface BoardService {
	//등록 insert
	public void register(ReviewBoardVO board);
	//게시글 1개 조회 select
	public ReviewBoardVO get(int bno);
	//수정하기
	public boolean modify(ReviewBoardVO board);
	//삭제하기
	public boolean remove(int bno);
	//게시글 목록 조회
	public List<ReviewBoardVO> getList(Criteria cri);
	//게시글 총 갯수 반환
	public int getTotal(Criteria cri);
	//게시글 번호에 맞는 BoardAttachVO받기
	public List<BoardAttachVO> getAttachList(int bno);
}
