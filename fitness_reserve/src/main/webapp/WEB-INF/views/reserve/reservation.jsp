<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="container">
	<h2 class="title">RESERVATION</h2>
	<div>
		<form action="/reserve/reservation" method="post" id="reserveForm">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="mno" value="<sec:authentication property="principal.member.mno"/>" />
		</sec:authorize>
		<div class="select-Room">
			<h2 class="subtitle">헬스 룸</h2>
			<select name="fno" id="fno">
				<option value="none" selected>선택하세요</option>
				<option value="1">그린 짐 스탠다드 룸(hour +9,000)</option>
				<option value="2">그린 짐 스탠다드 룸(hour +9,000)</option>
				<option value="3">그린 짐 스탠다드 룸(hour +9,000)</option>
				<option value="4">그린 짐 스탠다드 룸(hour +9,000)</option>
				<option value="5">그린 짐 스탠다드 룸(hour +9,000)</option>
				<option value="6">그린 프리미엄 룸(hour +13,000)</option>
				<option value="7">그린 프리미엄 룸(hour +13,000)</option>
				<option value="8">그린 프리미엄 룸(hour +13,000)</option>
			</select>
		</div>
		<div class="reserve-calendar">
			<h2 class="subtitle">예약일정<span style="font-style:16px;">&nbsp;※당일 예약은 불가합니다.</span></h2>
			<input type="date" name="rdate" id="rdate"/>
			<div class="time_booking">
				<ul class="reserveForm">
					<li class="item_end none">
						<a href="#" class="endtime_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">06:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">07:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">08:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">09:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">10:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">11:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">12:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">13:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">14:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">15:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">16:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">17:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">18:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">19:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">20:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">21:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item">
						<span class="time_txt">22:00</span>
						<a href="#" class="time_box"></a>
					</li>
					<li class="item_end none">
						<span class="endtime_txt">23:00</span>
						<a href="#" class="endtime_box"></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="reserve-select">
			<h2 class="subtitle">시설요약</h2>
			<div class="imgDiv"></div>
			<p class="info"></p>
		</div>
		
		<div>
			<input class="reserve-submit" type="submit" value="다음"/>
		</div>
		</form>
	</div>
</div>
<script>
	$(document).ready(function(){
		let date = $("input[name='rdate']");
		let accessDate = new Date();
		let items = $(".item");
		if(date.val() === '' || date.val() === null || date.val()<accessDate){
			items.addClass('none');
		}
		//예약 가능한 시간대 클릭 시 on 클래스 추가or제거
		$(".item").on("click", function(){
			if($(this).hasClass('none')){
				alert('선택이 불가능한 시간대입니다.');
				return;
			}else{
				$(this).toggleClass('on');
			}
		});
		
		
	});
	//security token
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	//과거+당일 예약 날짜 선택시 예약불가
	let prevDate;
	$("input[name='rdate']").on("click", function(){
		prevDate = $(this).val();
		console.log(prevDate);
	});
	$("input[name='rdate']").change(function(){
		let accessDate = new Date();
		let rdate = new Date($(this).val());
		let fno = $("#fno").val();
		let form = $('.reserveForm');
		if(rdate<accessDate){
			alert('해당 날짜는 예약이 불가능합니다.');
			$(this).val(prevDate);
		}else{
			$.ajax({
				url: '/reserve/selectDate',
				data: {
					'rdate': rdate,
					'fno': fno
					},
				type: 'POST',
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'json',
				success: function(result){
					reserveResult(result);
				}
			});
			console.log(rdate);
			console.log(fno);
			console.log("ajax작동");
		}
	});
	$("select[name='fno']").change(function(){
		if($(this).val() == 'none'){
			$('.reserve-select').css('display', 'none');
		}
		let date = $("input[name='rdate']");
		let rdate = new Date($('#rdate').val());
		let fno = $("#fno").val();
		let form = $('.reserveForm');
		let times = $(".time_txt");
		if(fno == 'none'){
			for(let i=0; i<times.length; i++){
	    		times[i].parentElement.classList.add('none');
	    		times[i].parentElement.classList.remove('on');
	    	}
			return;
		}else{
			$.ajax({
				url: '/reserve/selectDate',
				data: {
					'rdate': rdate,
					'fno': fno
					},
				type: 'POST',
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'json',
				success: function(result){
					reserveResult(result);
				}
			});
			$.ajax({
				url: '/reserve/selectRoom',
				data:{'fno':fno},
				type: 'POST',
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'json',
				success: function(result){
					$('.reserve-select').css('display', 'block');
					$('.imgDiv').empty();
					let str = result.fno > 5 ? "<img src='../resources/img/premium.jpeg'/>" : "<img src='../resources/img/standard.jpeg'/>";
					$('.imgDiv').prepend(str);
					$('.info').text(result.finfo);
				}
			});
		}
	});
	function reserveResult(reserveList){
		let form = $('.reserveForm');
		let str = "";
		let times = $(".time_txt");
		if(!reserveList || reserveList.length == 0) {
			console.log("예약없음");
			for(let i=0; i<times.length; i++){
	    		times[i].parentElement.classList.remove('none');
	    		times[i].parentElement.classList.remove('on');
	    	}
		}else{
			for(let i=0; i<times.length; i++){
	    		times[i].parentElement.classList.remove('none');
	    		times[i].parentElement.classList.remove('on');
	    	}
			$(reserveList).each(function(i, obj){
				console.log("예약 시작시간 : " +obj.rstart);
		    	for(let i=0; i<times.length; i++){
			    	if(obj.rstart.trim() == times[i].innerText.trim()){
			    		times[i].parentElement.classList.add('none');
					}
			    }
			});
		}
	}
	//submit 눌렀을때
	$('input[type="submit"]').on('click', function(e){
		e.preventDefault();
		let form = $('#reserveForm');
		let token = "${principal.mno}";
		let rstart = [];
		if($('.on').length == 0 || $('.on') == null){
			alert('선택 옵션을 확인해주세요');
			return;
		}else{
			$('.on').each(function(i){
				rstart.push($(this).text());
			});	
		}
		
		
		let str = "";
		str += "<input type='hidden' name='rstart' value='"+rstart+"'/>";
		if(token == null || token == ''){
			alert('로그인 후 이용가능합니다.');	
		}
		form.append(str).submit();
	});
	
</script>
<%@ include file="../includes/footer.jsp" %>