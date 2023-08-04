<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<title>Insert title here</title>
<style>
	body{
		margin:0 auto;
		width:100%;
		max-width:1200px;
		height:100vh;
	}
	li{
		background:tomato;
		list-style:none;
		margin:10px 0; 
	}
	.item{
		width:250px;
		height:300px;
	}
	.gallery{
		display:flex;
		justify-content:space-around;
		flex-wrap:wrap;
		
	}
	#modal{
		width:100%;
		height:100vh;
		position:absolute;
		top:0;
		left:0;
		background:rgba(0,0,0,0.5);
		display:none;
	}
	#modalbox{
		width:70%;
		background: #fff;
		margin: 20px auto;
		padding:20px;
		border-radius:10px;	
	}
</style>
	<h2 style="text-align:center;">BOOK LIST</h2>
	<ul class="gallery">
    	<c:forEach items="${list }" var="list">
     	<li class="item">
     		<a href="/book/view?bno=${list.bno }">
     		<img src="/display?fileName=">
     		<p></p>
     		<p></p>
     		</a>
     	</li>
     	</c:forEach>
    </ul>
    
    <!-- 검색추가하기 -->
	<form method="get" action="/book/list">
	
	<select name="type">
		<option value="N" <c:out value="${pageMaker.cri.type == 'N' ? 'selected' : ''}"/>>제목</option>
		<option value="P" <c:out value="${pageMaker.cri.type == 'P' ? 'selected' : ''}"/>>출판사</option>
		<option value="A" <c:out value="${pageMaker.cri.type == 'A' ? 'selected' : ''}"/>>작가</option>
	</select>
	<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	<input type="submit" value="검색">
	</form> 
	<!-- 페이징 추가 -->
	<div class="pull-right">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li>
					<a href="/board/list?pageNum=${pageMaker.startPage-1 }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">prev</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li>
					<a href="/board/list?pageNum=${num }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li>
					<a href="/board/list?pageNum=${pageMaker.endPage+1 }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 추가 끝 -->
	<p><button onclick="location.href='/book/addBook'">게시글등록</button></p>
	<!-- 모달 추가 -->
	<div id="modal">
		<div id="modalbox">
			<h3>페이지 안내</h3>
			<div id="infotext">
				<c:out value="${param.result}"/> 처리가 완료되었습니다
			</div>
			<button id="modalclose">닫기</button>
		</div>
	</div>
	<script>
	
		let result = '<c:out value="${param.result}"/>';
		console.log(result);
		checkModal(result);
		function checkModal(result){
			if(!result) return;
			document.querySelector("#modal").style.display = 'block';
		}
		//닫기 누르면 모달창 사라지게 하기
		document.querySelector("#modalclose").addEventListener("click",function(){
			document.querySelector("#modal").style.display = 'none';			
		});
		
	</script>
</body>
</html>