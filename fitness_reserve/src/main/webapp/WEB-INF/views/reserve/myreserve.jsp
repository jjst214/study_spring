<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %> 

<c:set value="${list }" var="lists"/>

<div class="container">
	<h3 class="title">최근예약내역</h3>
	<label>최근 10개까지의 예약 내역을 확인하실 수 있습니다.</label>
	<div>
		<table border="1">
			<tr>
				<th>방번호</th>
				<th>예약날짜</th>
				<th>이용시작시간</th>					
				<th>이용마감시간</th>
				<th>상태</th>					
			</tr>
			<c:forEach items="${lists }" var="board">
				<tr>
					<td>${board.fno }번</td>
					<td><fmt:formatDate value="${board.rdate }" pattern="yyyy-MM-dd"/></td>
					<td>${board.rstart }</td>					
					<td>${board.rend }</td>
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="now" />
					<fmt:formatDate value="${board.rstart }" pattern="yyyy-MM-dd HH:mm" var="start"/>
					<td><c:if test="${start }"></c:if></td>					
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>