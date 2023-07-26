package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {
	//TimeMapper가 정상적으로 사용이 가능한지 테스트
	@Setter(onMethod_= {@Autowired})
	private TimeMapper timeMapper;
	@Test
	public void testGetTime() {
		//스프링은 인터페이스를 이용해 객체를 생성한다.
		//인터페이스만 작성하면 내부적으로 적당한 클래스가 만들어짐
		//실제 동작하는 클래스 이름 리턴
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
	@Test
	public void testGetTime2() {
		log.info("getTime2");
		log.info(timeMapper.getTime2());
	}
}
