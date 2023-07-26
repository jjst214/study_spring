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
          
					<h2>등록 페이지 입니다.</h2>
					
                    <form class="user" method="post" action="/board/register">
                      <div class="form-group row">
                          <div class="col-sm-6 mb-3 mb-sm-0">
                              <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                  placeholder="제목" name="title" required>
                          </div>
                          <div class="col-sm-6">
                              <input type="text" class="form-control form-control-user" id="exampleLastName"
                                  placeholder="글쓴이" name="writer" required>
                          </div>
                          <div class="col-sm-12">
								<textarea rows="" cols="" class="form-control form-control-user"
								 id="exampleLastName" name="content" placeholder="내용" required></textarea>
                          </div>
                          <div>
                          		<button type="submit" class="btn btn-primary btn-user" >등록</button>
								<button type="reset" class="btn btn-primary btn-user" >취소</button>
                          </div>
                      </div>
                  	</form>
				</div>
			</div>
		</div>
<%@ include file="../includes/footer.jsp" %>
