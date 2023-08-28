package com.packt.cardatebase;



import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.packt.cardatebase.domain.Car;
import com.packt.cardatebase.domain.CarRepository;
import com.packt.cardatebase.domain.Owner;
import com.packt.cardatebase.domain.OwnerRepository;
import com.packt.cardatebase.domain.User;
import com.packt.cardatebase.domain.UserRepository;

//@EnableAutoConfiguration : 스프링부트 자동 구성을 활성화
//@ComponentScan : 스프링부트 컴포넌트 검색으로 애플리케이션의 컴포넌트를 찾음
//@Configuration : 빈(bean)정의의 원본으로 쓸 수 있는 클래스임을 정의
//위 3개의 어노테이션 조합
@SpringBootApplication
public class CardatebaseApplication implements CommandLineRunner {
	private static final Logger logger = LoggerFactory.getLogger(CardatebaseApplication.class);
	//의존성 주입
	@Autowired
	private CarRepository repository;
	
	//소유자 리포지토리 의존주입
	@Autowired
	private OwnerRepository orepository;
	
	@Autowired
	private UserRepository urepository;
	
	private BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
	
	public static void main(String[] args) {
		//코드를 추가하면 애플리케이션이 재시작됨
		SpringApplication.run(CardatebaseApplication.class, args);
		logger.info("애플리케이션 시작");
	}
	@Override
	public void run(String... args) throws Exception {
		Owner owner1 = new Owner("그린", "김");
		Owner owner2 = new Owner("길동", "홍");
		Owner owner3 = new Owner("지아", "박");
		orepository.saveAll(Arrays.asList(owner1, owner2, owner3));
		
		repository.save(new Car("Ford", "Mustang", "red", "ADF-1121", 2021, 59000, owner1));
		repository.save(new Car("Nissan", "Leaf", "white", "SSJ-1234", 2020, 19000, owner2));
		repository.save(new Car("Toyota", "Prius", "black", "KKO-1121", 2022, 39000, owner3));
		repository.save(new Car("Hyundai", "Sonata", "black", "DFA-1229", 2022, 32000, owner3));
		repository.save(new Car("Hyundai", "Grandeur", "black", "DFA-1231", 2022, 32000, owner3));
		
		//모든 레코드를 가지고와서 콘솔에 로깅
		 for(Car car: repository.findByBrand("Hyundai")) {
			logger.info(car.getBrand()+ " " + car.getModel());
		}
		
		//사용자이름 user 암호 user
		urepository.save(new User("user", pwencoder.encode("user"),"USER"));
		urepository.save(new User("admin", pwencoder.encode("admin"),"ADMIN"));
	}
	
}
