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
				<form action="/board/modify" method="post">
				<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
				<input type="hidden" name="amount" value="${cri.amount }"/>
				<input type="hidden" name="bno" value="${board.bno }"/>
				<input type="hidden" name="type" value="${cri.type }"/>
				<input type="hidden" name="keyword" value="${cri.keyword }"/>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<input type="text" value="${board.title }" name="title" required/>
				<input type="text" style="border-bottom:1px solid #ccc;" readonly value="${board.writer }" name="writer"/>
				<textarea class="modify-content">${board.content }</textarea>
				<p>
					<button onclick="location.href='/board/review?pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}'">목록</button>
					<!-- 변수등록 -->
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자랑 글쓴이가 같아야함 -->
					<c:if test="${pinfo.username eq board.writer }">
					
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
				</form>
				</div>
			</div>
		</div>
		<div class="bigPictureWrapper">
			<div class="bigPicture">
				
			</div>
		</div>

<%@ include file="../includes/footer.jsp" %>