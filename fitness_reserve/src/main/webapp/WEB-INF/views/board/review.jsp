<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"></h6>
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                        <tr>
											<td>번호</td>
											<td>제목</td>
											<td>작성자</td>
											<td>작성일</td>
											<td>수정일</td>
										</tr>
                                </thead>
                                <c:set var="lists" value="${list }" />
                                <c:choose>
                                	<c:when test="${empty lists }">
                                		<tbody>
                                			<tr>
                                				<td colspan="5" style="text-align:center; height:200px; line-height:200px;">등록된 게시글이 없습니다.</td>
                                			</tr>
	                                    	
	                                    </tbody>
                                	</c:when>
                                	<c:otherwise>
                                		<tbody>
	                                    	<c:forEach items="${list }" var="board">
												<tr>
													<td><c:out value="${board.bno }"></c:out></td>
													<td><a href="/board/get?bno=${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
													<c:out value="${board.title }"/></a></td>
													<td><c:out value="${board.writer }"></c:out></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }"/></td>
												</tr>
											</c:forEach>
	                                    </tbody>
                                	</c:otherwise>
                                </c:choose>
                                </table>
                                <!-- 검색추가하기 -->
								<form method="get" action="/board/review">
								
								<select name="type">
									<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}"/>>제목</option>
									<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected' : ''}"/>>내용</option>
									<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected' : ''}"/>>글쓴이</option>
								</select>
								<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
								<input type="submit" value="검색">
								</form> 
								<!-- 페이징 추가 -->
								<div class="pull-right">
									<ul class="pagination">
										<c:if test="${pageMaker.prev }">
											<li>
												<a href="/board/review?pageNum=${pageMaker.startPage-1 }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">prev</a>
											</li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<li>
												<a href="/board/review?pageNum=${num }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num }</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next }">
											<li>
												<a href="/board/review?pageNum=${pageMaker.endPage+1 }&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">next</a>
											</li>
										</c:if>
									</ul>
								</div>
								<!-- 페이징 추가 끝 -->
                                <sec:authorize access="isAuthenticated()">
                                	<a href="/board/register" class="review-write-btn">글쓰기</a>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>

<%@ include file="../includes/footer.jsp" %>