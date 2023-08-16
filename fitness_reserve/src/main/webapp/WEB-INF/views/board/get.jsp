<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                
                <!-- Begin Page Content -->
                <div class="container">
				
				<h2 style="border-bottom:2px solid black;">상세조회 페이지</h2>
				<strong><c:out value="${board.title }"></c:out></strong>
				<p style="border-bottom:1px solid #ccc;"><c:out value="${board.writer }"></c:out>&emsp;|&emsp;<fmt:formatDate value="${board.updatedate }" pattern="yyyy-MM-dd HH:mm"/></p>
				<p id="content_image"></p>
				<p><c:out value="${board.content }"></c:out></p>
				<p>
					<button onclick="location.href='/board/review?pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}'">목록</button>
					<!-- 변수등록 -->
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자랑 글쓴이가 같아야함 -->
					<c:if test="${pinfo.username eq board.writer }">
					<button onclick="location.href='/board/modify?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}'">수정</button>
					<form method="post" action="/board/remove">
						<input type="hidden" value="${board.bno }" name="bno"/>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<button type="submit">삭제</button>
					</form>
					</c:if>
					</sec:authorize>
				</p>
				<!-- 첨부파일 이미지 영역 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								파일들
							</div>
							<div class="panel-body">
								<div class="uploadResult">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 첨부파일 이미지 영역 끝 -->
				</div>
			</div>
		</div>
		<div class="bigPictureWrapper">
			<div class="bigPicture">
				
			</div>
		</div>
		<script>
		$(document).ready(function(){
			//페이지가 로드되면 스스로 실행되는 함수
			(function(){
				let bno = '<c:out value="${board.bno}"/>';
				$.getJSON("/board/getAttachList",{bno:bno},
					function(arr){
						console.log(arr);
						//이미지 나타내기
						let str = "";
						let view = "";
						$(arr).each(function(i, attach){
							let fileCallpath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
							let fileCallpath2 = encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
							str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'";
							str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
							str += "<div><img src='/display?fileName="+fileCallpath+"'/>";
							str += "</div></li>";
							view += "<img src='/display?fileName="+fileCallpath2+"'/>";
						})
						$(".uploadResult ul").html(str);
						$("#content_image").html(view);
					})//end getJSON
			})();
			//li를 클릭하면 bigPictureWrapper나타나게 하고
			//.bigPicture의 html 내용에 이미지가 나타나도록 지정
			$(".uploadResult").on("click", "li", function(e){
				console.log("view image");
				let liObj = $(this);
				let path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
				showImage(path.replace(new RegExp(/\\/g),"/"));
			})
			function showImage(fileCallPath){
				alert(fileCallPath);
				$(".bigPictureWrapper").css("display","flex");
				$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"' width='500'/><span>X</span>");
			}
			$(".bigPictureWrapper").on("click","span", function(e){
				$(".bigPictureWrapper").css("display","none");
			})
		})
		</script>

<%@ include file="../includes/footer.jsp" %>