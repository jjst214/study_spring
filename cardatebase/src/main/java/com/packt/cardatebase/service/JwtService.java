package com.packt.cardatebase.service;

import java.security.Key;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtService {
	//토큰의 만료 시간 : 1일을 밀리초로 계산한 값
	static final long EXPIRATIONTIME = 86400000;  
	//토큰의 접두사 정의
	static final String PREFIX = "Bearer";
	//비밀 키 생성, jjwt라이브러리의 secretKeyFor메서드로 생성 : 시연용도로만 이용
	//실제운영환경에서는 애플리케이션 구성에서 비밀키를 읽어야함.
	//getToken메서드는 토큰을 생성하고 반환한다.
	//getAuthUser메서드는 응답의 Authorization 헤더에서 토큰을 가져온다. 
	//그다음에는 jjwt라이브러리의 parserBuilder메서드를 이용해
	//JwtParserBuilder인스턴스를 생성함.
	//setSigningKey메서드는 토큰 검증을 위한 비밀 키를 저장한다.
	//마지막으로 getSubject메서드로 사용자 이름을 얻는다 
	static final Key key =Keys.secretKeyFor(SignatureAlgorithm.HS256);
	
	//서명된 JWT토큰 생성
	public String getToken(String username) {
//		(1) JwtBuilder객체를 생성하고 Jwts.builder() 메서드를 이용한다.
//		(2) header 파라메터와 claims를 추가하기위해 JwtBuilder 메서드를 호출한다.
//		(3) JWT를 서명하기위해 SecretKey나 PrivateKey를 지정한다.
//		(4) 마지막으로 압축하고 서명하기위해 compact()를 호출하고, jws를 생성한다.
		//Claims는 JWT의 body이고 JWT 생성자가 JWT를 받는이들에게 제시하기 바라는 정보를 포함한다.
		String token = Jwts.builder()
				.setSubject(username)   
				.setExpiration(new Date(System.currentTimeMillis()+ EXPIRATIONTIME)) //claims에 추가
				.signWith(key)  //서명
				.compact();     //압축
		return token;
	}
	//요청 권한 부여 헤더에서 토큰을 가져와 토큰을 확인하고 사용자 이름을 얻음
	public String getAuthUser(HttpServletRequest request) {
		String token = request.getHeader(HttpHeaders.AUTHORIZATION);
		if(token != null) {
			String user = Jwts.parserBuilder()
					.setSigningKey(key)
					.build()
					.parseClaimsJws(token.replace(PREFIX, ""))
					.getBody()
					.getSubject();
			if(user != null)
				return user;
		}
		return null;
	}
}
