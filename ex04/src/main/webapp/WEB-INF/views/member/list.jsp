<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<title>Insert title here</title>
	<h2>회원 리스트 페이지</h2>
	<table border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>휴대폰번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mlist }" var="list">
			<tr>
				<td><c:out value="${list.mno }"></c:out></td>
				<td><c:out value="${list.mid }"></c:out></td>
				<td><c:out value="${list.mname }"></c:out></td>
				<td><c:out value="${list.mgender }"></c:out></td>
				<td><c:out value="${list.mmail }"></c:out></td>
				<td>${fn:substring(list.mphone,0,3) }-${fn:substring(list.mphone,3,7) }-${fn:substring(list.mphone,7,11) }</td>
				<td><c:out value="${list.maddress }"></c:out></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<button onclick="location.href='/member/join'">회원가입</button>
</body>
</html>