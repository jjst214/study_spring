package org.reserve.mapper;

import java.util.List;
import java.util.Map;

import org.reserve.domain.Criteria;
import org.reserve.domain.ReviewBoardVO;

public interface ReviewBoardMapper {
	//글 리스트 출력
	public List<ReviewBoardVO> getList();
	
	//create --> insert처리
	public void insert(ReviewBoardVO vo);
	
	//read --> select처리
	public ReviewBoardVO read(int bno);
	
	//delete --> delete처리
	public int delete(int bno);
	
	//update --> update처리
	public int update(ReviewBoardVO board);
	
	//페이징 사용해서 조회
	public List<ReviewBoardVO> getListWithPaging(Criteria cri);
	
	//전체 데이터 개수
	public int getTotalCount(Criteria cri);
	
	//insert메소드2 등록된 번호 받기
	public void insertSelectKey(ReviewBoardVO vo);
	
}
