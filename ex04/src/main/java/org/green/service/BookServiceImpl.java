package org.green.service;

import java.util.List;


import org.green.domain.BookAttachVO;
import org.green.domain.BookVO;
import org.green.domain.Criteria;
import org.green.mapper.BookAttachMapper;
import org.green.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	@Setter(onMethod_ = {@Autowired})
	private BookMapper mapper;
	@Setter(onMethod_ = {@Autowired})
	private BookAttachMapper attachMapper;

	@Override
	public void addBook(BookVO bvo) {
		mapper.insert(bvo);
		if(bvo.getAttachList() == null || bvo.getAttachList().size() <= 0) { return; }
		bvo.getAttachList().forEach(attach->{
			attach.setBno(bvo.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BookVO get(int bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BookVO bvo) {
		attachMapper.deleteAll(bvo.getBno());
		
		boolean modifyResult = mapper.update(bvo) == 1;
		if(bvo.getAttachList() != null || bvo.getAttachList().size() > 0) {
			bvo.getAttachList().forEach(attach->{
				attach.setBno(bvo.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Override
	public boolean remove(int bno) {
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BookVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BookAttachVO> getAttachList(int bno) {
		return attachMapper.findByBno(bno);
	}
	
}
