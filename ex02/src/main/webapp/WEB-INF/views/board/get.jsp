<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                
                
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
          
					<h2>상세조회 페이지</h2>
					<p><c:out value="${board.bno }"></c:out></p>
					<p><c:out value="${board.title }"></c:out></p>
					<p><c:out value="${board.content }"></c:out></p>
					<p><c:out value="${board.writer }"></c:out></p>
					<p>
						<button onclick="location.href='/board/list?pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}'">목록</button>
						<button onclick="location.href='/board/modify?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount }&type=${cri.type}&keyword=${cri.keyword}'">수정</button>
						<form method="post" action="/board/remove">
							<input type="hidden" value="${board.bno }" name="bno"/>
							<button type="submit">삭제</button>
						</form>
					</p>
				</div>
			</div>
		</div>
<%@ include file="../includes/footer.jsp" %>