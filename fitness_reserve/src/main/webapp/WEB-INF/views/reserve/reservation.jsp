<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>GREEN GYM</title>
<%@ include file="../includes/header.jsp" %>

<div class="container">
	<h2 class="title">RESERVATION</h2>
	<div>
		<div class="reserve-calendar">
			<input type="date" name="rdate"/>
			<div class="time_booking">
				<ul class="reserveForm">
					
				</ul>
			</div>
		</div>
		<div>
		
		</div>
	</div>
</div>
<script>
	//오늘 날짜 기본세팅
	let defaultDate = new Date();
	defaultDate.setDate(defaultDate.getDate() + 1);
	document.querySelector('input[name="rdate"]').valueAsDate = defaultDate;
	
	//과거+당일 예약 날짜 선택시 예약불가
	$("input[name='rdate']").change(function(){
		let accessDate = new Date();
		let selectDate = new Date($(this).val());
		if(selectDate<accessDate){
			alert('해당 날짜는 예약이 불가능합니다.');
			document.querySelector('input[name="rdate"]').valueAsDate = defaultDate;
			//서브밋 disabled시키기
		}else{
			$.ajax({
				url: '/selectDate',
				data: selectDate,
				type: 'POST',
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'json',
				success: function(result){
					reserveResult(result);
				}
			});
		}
	});
	function reserveResult(reserveList){
		if(!reserveList || reserveList.length == 0) { return; }
		let form = $('.reserveForm');
		let str = "";
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
		$(reserveList).each(function(i, obj){
			str += "<li>"+obj.rstart+"</li>";
		});
		form.append(str);
	}
</script>
<%@ include file="../includes/footer.jsp" %>