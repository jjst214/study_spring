package com.packt.cardatebase.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/tour")
public class TourController {
	//데이터 요청 주소
	String apiUrl = "https://apis.data.go.kr/1360000/TourStnInfoService1/getTourStnVilageFcst1";
	String apiUrl2 = "https://apis.data.go.kr/1360000/TourStnInfoService1/getCityTourClmIdx1";
	//인증키
	String serviceKey = "HW%2BqnisEeBGFOPeXMoyAHz%2FivlBlWQNe3SH8jq%2F5BKPy6%2FeXSJOZQcDFYcPc1rbNBfTNcixETlsta5NXuwMHXw%3D%3D";
	//페이지번호
	String pageNo = "1";
	//데이터타입
	String dataType = "JSON";
	//조회하고 싶은 날짜
	//String CurrentDate = "20230823";
	//조회하고 싶은 날짜의 시간
	String Hour = "24";
	//조회할 날짜로부터 몇일간의 데이터를 보여줄것인지
	String Day = "6";
	//관광코스ID
	//String CourseId = "2";
	//한페이지 결과 수
	String numOfRows = "10";
	//시군구 아이디
	@GetMapping("/wea")
	public String weather(String CurrentDate, String CourseId) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo);
		urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + dataType);
		urlBuilder.append("&" + URLEncoder.encode("CURRENT_DATE","UTF-8") + "=" + CurrentDate);
		urlBuilder.append("&" + URLEncoder.encode("HOUR","UTF-8") + "=" + Hour);
		urlBuilder.append("&" + URLEncoder.encode("COURSE_ID","UTF-8") + "=" + CourseId);
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + numOfRows);
		
		//get방식 전송
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		//전송 메소드 지정
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		//응답코드가 200번 이상이면서 300번 이하일때(응답성공)
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String result = sb.toString();
		return result;
	}
	
	@GetMapping("/city_weather")
	public String c_weather(String CurrentDate,String areaId) throws Exception {
		StringBuilder urlBuilder = new StringBuilder(apiUrl2);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo);
		urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + dataType);
		urlBuilder.append("&" + URLEncoder.encode("CURRENT_DATE","UTF-8") + "=" + CurrentDate);
		urlBuilder.append("&" + URLEncoder.encode("DAY","UTF-8") + "=" + Day);
		urlBuilder.append("&" + URLEncoder.encode("CITY_AREA_ID","UTF-8") + "=" + areaId);
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + numOfRows);
		
		//get방식 전송
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		//전송 메소드 지정
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		//응답코드가 200번 이상이면서 300번 이하일때(응답성공)
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String result = sb.toString();
		return result;
	}
}
