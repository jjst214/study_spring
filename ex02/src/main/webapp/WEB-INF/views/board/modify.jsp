<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수정하기</h2>
	<form method="post" action="/board/modify">
	<table>
		<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
		<input type="hidden" name="amount" value="${cri.amount }"/>
		<input type="hidden" name="bno" value="${board.bno }"/>
		<input type="hidden" name="type" value="${cri.type }"/>
		<input type="hidden" name="keyword" value="${cri.keyword }"/>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" required value="${board.title }"></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="writer" required value="${board.writer }"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="" cols="" name="content" required>${board.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" >등록</button>
				<button type="reset" >취소</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>