<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<title>회원가입 페이지</title>
	
	<h2>회원가입</h2>
	<form method="post" action="/member/join" class="join">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="mid"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="mpass"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="mname"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" value="남자" name="mgender" checked>남자
				<input type="radio" value="여자" name="mgender">여자				
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="mmail1" id="mmail1">@
				<select name="mmail2" id="mmail2">
					<option value="google.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.com">daum.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td>
				<select name="mphone1" id="mphone1">
					<option value="010" selected>010</option>
					<option value="016">016</option>
					<option value="017">017</option>
				</select>-
				<input type="text" name="mphone2" id="mphone2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">-
				<input type="text" name="mphone3" id="mphone3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="maddress"></td>
		</tr>
	</table>
	<button type="submit">회원가입</button>
	</form>
</body>
<script>
	$(document).ready(function(){
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			let formObj = $("form.join");
			let mmail = $("input[name='mmail1']").val() + "@" + $("select[name='mmail2']").val();
			let mphone = $("select[name='mphone1']").val() + $("input[name='mphone2']").val() + $("input[name='mphone3']").val();
			let str = "";
			str += "<input type='hidden' value='"+mmail+"' name='mmail'/>"
			str += "<input type='hidden' value='"+mphone+"' name='mphone'/>"
			$("input").remove("#mmail1, #mmail2");
			$("select").remove("#mphone1, #mphone2, #mphone3");
			formObj.append(str).submit();
		})
	});
</script>
</html>