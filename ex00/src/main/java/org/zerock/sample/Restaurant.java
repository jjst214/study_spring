package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@Data
//생성자 주입 @AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class Restaurant {
	//의존성 주입(필드주입)
	@Autowired
	private Chef chef;	//chef=new Chef()
}
