<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
	<div class="container">
		<h2 class="title">위치 및 연락처</h2>
		<div class="contact-div">
			<div>
				<strong style="font-size:24px;">GREEN PRIVATE GYM 울산 삼산점</strong>
				<h3 class="subtitle">상세주소</h3>
				<p>울산광역시 남구 삼산중로100번길 26</p>
				<button onclick="location.href='https://map.naver.com/p/entry/place/38695945?c=15.00,0,0,0,dh'">네이버 지도로 확인</button>
				<h3 class="subtitle">연락처</h3>
				<span>052-716-3199</span>
			</div>
			<div id="map" style="width:500px;height:400px;"></div>	
		</div>
	</div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=767218c5ca8c555dd4d783f2061e3917"></script>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(35.54196812335104, 129.33827106579918), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.54196812335104, 129.33827106579918); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    text: '여기'
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>

<%@ include file="includes/footer.jsp" %>