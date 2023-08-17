package org.reserve.service;

import java.util.List;

import org.reserve.domain.BoardAttachVO;
import org.reserve.domain.Criteria;
import org.reserve.domain.ReviewBoardVO;
import org.reserve.mapper.BoardAttachMapper;
import org.reserve.mapper.ReviewBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardMapper mapper;
	@Setter(onMethod_= {@Autowired})
	private BoardAttachMapper attachMapper;

	@Override
	public void register(ReviewBoardVO board) {
		log.info("등록하기 : " + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) { return; }
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public ReviewBoardVO get(int bno) {
		log.info("조회하기 : " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ReviewBoardVO board) {
		log.info("수정하기 : " + board);
		//bno 번호에 해당하는 첨부파일 게시글 삭제
		attachMapper.deleteAll(board.getBno());
		//board테이블 수정
		boolean modifyResult = mapper.update(board) == 1;
		if(board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult; 
	}


	@Override
	public boolean remove(int bno) {
		log.info("삭제하기 : " + bno);
		//첨부파일 삭제하기(db)
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<ReviewBoardVO> getList(Criteria cri) {
		log.info("리스트 출력");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		log.info("첨부리스트 게시글 번호 : " + bno);
		return attachMapper.findByBno(bno);
	}
	
	
	
}
