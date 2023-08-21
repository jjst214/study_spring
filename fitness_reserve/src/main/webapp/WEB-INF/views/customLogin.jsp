<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>GREEN GYM</title>
<%@ include file="includes/header.jsp" %>
</head>
<body>
	<div class="container" id="login-form">
		<h2>LOGIN</h2>
		<form action="/login" method="post" >
			<p><input type="text" name="username" placeholder="아이디" class="input-idpw"/></p>
			<p><input type="password" name="password" placeholder="비밀번호" class="input-idpw"/></p>
			<p><input type="checkbox" name="remember-me"/>Remember Me</p>		
			<button type="submit">로그인</button>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		</form>
	</div>

<%@ include file="includes/footer.jsp" %>