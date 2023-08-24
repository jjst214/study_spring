<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="container">
	<h2 class="title">RESERVATION</h2>
	<div>
		<h2 class="subtitle">예약 정보확인</h2>
		<form action="/reserve/reservation-payment" method="post" id="paymentForm">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<sec:authentication property="principal.member" var="principal"/>
		<c:set var="rvo" value="${rvo }"/>
		<table>
			<tr>
				<th>성함</th>
				<td>${principal.mname }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${principal.phone }</td>
			</tr>
			<tr>
				<th>선택 옵션</th>
				<c:choose>
					<c:when test="${rvo[0].fno eq '1' or rvo[0].fno eq '2' or rvo[0].fno eq '3' or rvo[0].fno eq '4' or rvo[0].fno eq '5'}">
						<td>그린 짐 스탠다드 룸</td>
					</c:when>
					<c:otherwise>
						<td>그린 프리미엄 룸</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>예약시간</th>
				<td>
					<ul>
					<c:forEach items="${rvo }" var="list">
						<li>${list.rstart } ~ ${list.rend }</li>
					</c:forEach>
					</ul>
				</td>	
			</tr>
			<tr>
				<th>총 결제 금액</th>
				<c:set var="total" value="0"/>
				<c:forEach items="${rvo }" var="item">
					<c:choose>
						<c:when test="${item.fno eq '1' or item.fno eq '2' or item.fno eq '3' or item.fno eq '4' or item.fno eq '5'}">
							<c:set var="total" value="${total + 9000 }"/>		
						</c:when>
						<c:otherwise>
							<c:set var="total" value="${total + 13000 }"/>	
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<td><fmt:formatNumber value="${total }" pattern="#,###"/>원</td>
			</tr>
		</table>
		<h2 class="subtitle">결제</h2>
		<div>
			<div>
				<input type="radio" value="신용카드" name="pkind" checked/>신용카드
				<input type="radio" value="카카오페이" name="pkind"/>카카오페이
			</div>
			<div class="credit">
				<select name="pbank">
					<option value="none">=====선택해주세요=====</option>
					<option value="신한카드">신한카드</option>
					<option value="비씨카드">비씨카드</option>
					<option value="현대카드">현대카드</option>
					<option value="삼성카드">삼성카드</option>
					<option value="롯데카드">롯데카드</option>
				</select>
			</div>
			<div>
				<input type="submit" value="예약하기"/>
			</div>
		</div>
		<c:forEach items="${rvo }" var="list" varStatus="status">
			<input type="hidden" name="rvoList['${status.index }'].rstart" value="${list.rstart }"/>
			<input type="hidden" name="rvoList['${status.index }'].rend" value="${list.rend }"/>
			<input type="hidden" name="rvoList['${status.index }'].fno" value="${list.fno }"/>
			<input type="hidden" name="rvoList['${status.index }'].rdate" value="${list.rdate }"/>
			<input type="hidden" name="rvoList['${status.index }'].mno" value="${list.mno }"/>
		</c:forEach>
		</form>
	</div>
	
</div>
<script>
	$(document).ready(function(){
		console.log($('input[type="radio"]:checked').val());
		if($('input[type="radio"]:checked').val() == '신용카드'){
			$('.credit').css('display','block');
		}
		$('input[type="radio"]').change(function(){
			if($('input[type="radio"]:checked').val() == '신용카드'){
				$('select[name="pbank"]').val('none');
				$('.credit').css('display','block');
			}else{
				$('.credit').css('display','none');
			}	
		});
	});
	$('input[type="submit"]').on('click', function(e){
		e.preventDefault();
		if($('input[type="radio"]:checked').val() == '신용카드' && $('select[name="pbank"]').val() == 'none'){
			alert('결제하실 카드를 선택해주세요');
			return;
		}
		let form = $('#paymentForm');
		let str = "";
		str += "<input type='hidden' name='pdate' value='"+${rvo[0].rdate}+"'/>";
		form.append(str).submit();
	});
</script>
<%@ include file="../includes/footer.jsp" %>