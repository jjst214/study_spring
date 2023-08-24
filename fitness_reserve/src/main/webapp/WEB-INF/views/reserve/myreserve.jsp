<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %> 

<c:set value="${list }" var="lists"/>

<div class="container">
	<h3 class="title">예약내역</h3>
	<label class="res-label">최근 20건 까지의 예약 내역을 확인하실 수 있습니다.</label>
	<div>
		<table class="view-res-tb">
			<tr>
				<th>No.</th>
				<th>방번호</th>
				<th>예약날짜</th>
				<th>사용시작시간</th>					
				<th>사용종료시간</th>
				<th>상태</th>					
			</tr>
			<c:forEach items="${lists }" var="board">
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:parseDate value="${fn:trim(board.rstart)}" pattern="HH:mm" var="vHHmm"/>
			<fmt:parseDate value="${fn:trim(board.rstart)}" pattern="HH" var="vHH"/>
			<fmt:parseDate value="${board.rdate}" pattern="yyyy-MM-dd" var="rdate_value"/>
			<fmt:formatDate value="${rdate_value}" pattern="yyyy-MM-dd" var="rdate"/>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
			<fmt:formatDate value="${now}" pattern="HH" var="todayHH"/>
			<fmt:formatDate value="${vHH}" pattern="HH" var="startHH"/>
			<tr>
				<td>${board.rnum }</td>
				<td>${board.fno }번</td>
				<c:choose>
					<c:when test="${today == rdate}">
						<td>${rdate }<label style="font-weight:bold; color:green;">today</label></td>
					</c:when>
					<c:otherwise>
						<td>${rdate }</td>
					</c:otherwise>
				</c:choose>
				<td>${board.rstart }</td>					
				<td>${board.rend }</td>
				<c:choose>
					<c:when test="${today>=rdate }">
						<c:choose>
							<c:when test="${today == rdate }">
								<c:choose>
									<c:when test="${todayHH == startHH }">
										<td><span style="color:green">사용 가능</span></td>		
									</c:when>
									<c:when test="${todayHH>startHH }">
										<td><span style="color:#ccc">사용 종료</span></td>
									</c:when>
									<c:otherwise>
										<td><span style="color:#000">사용 전</span></td>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${today>rdate }">
								<td><span style="color:#ccc">사용 종료</span></td>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<td><span style="color:#000">사용 전</span></td>
					</c:otherwise>
				</c:choose>		
			</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="../includes/footer.jsp" %>