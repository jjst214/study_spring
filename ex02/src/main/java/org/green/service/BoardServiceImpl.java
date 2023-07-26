package org.green.service;

import java.util.List;

import org.green.domain.BoardVO;
import org.green.domain.Criteria;
import org.green.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("등록하기 : " + board);
		mapper.insert(board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("조회하기 : " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("수정하기 : " + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("삭제하기 : " + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("리스트 출력");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	
	
}
