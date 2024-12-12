<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>board_getBoardList</title>

<!-- Custom fonts for this template-->
<link href="/resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
   * {
      font-family: 'Noto Sans KR', sans-serif;
   }
</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

       <!-- Sidebar -->
		<jsp:include page="/resources/include/menu_tab.jsp">
			<jsp:param name="pageName" value="menuTab" />
		</jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/resources/include/top_bar.jsp">
					<jsp:param name="pageName" value="topBar" />
				</jsp:include>
		
		<!-- Begin Page Content -->
		<div class="container container-fluid">

			
		
		
				<!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">커뮤니티</h1>
                    

                    <!-- Nav tabs -->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="freeTab" data-bs-toggle="tab" href="#free" role="tab" aria-controls="free" aria-selected="true">자유</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="questionTab" data-bs-toggle="tab" href="#question" role="tab" aria-controls="question" aria-selected="false">질문</a>
                    </li>
                </ul>

                <!-- Tab content -->
                <div class="tab-content" id="myTabContent">
                    <!-- 자유 Tab -->
                    <div class="tab-pane fade show active" id="free" role="tabpanel" aria-labelledby="freeTab" >
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center">
							    <h6 class="m-0 font-weight-bold text-primary">자유 게시판</h6>
							    <a href="board_insertBoard.do" type="button" class="btn btn-primary btn-user btn" style="padding: 8px 16px; height: 40px;">글쓰기</a>
							</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="freeTable" width="100%" cellspacing="0">
                                        <!-- 자유 게시판 DataTable 내용 -->
                                        <thead>
                                        <tr>
                                            <th width="10%">번호</th>
                                            <th width="10%">카테고리</th>
                                            <th width="50%">제목</th>                                                                                        
                                            <th width="10%">글쓴이</th>
                                            <th width="10%">등록일</th>                                            
                                            <th width="10%">조회수</th>
                                        </tr>
                                    	</thead>
                                    	<c:forEach items="${boardList}" var="board">
											<tr>
												<td>${board.board_No}</td>
												<td>${board.board_Cate}</td>
												<td align="left"><a href="board_getBoard.do?board_No=${board.board_No}">${board.board_Title}</a></td>
												<td>${board.board_Writer}</td>
												<td>${board.board_Date}</td>
												<td>${board.board_Cnt}</td>
											</tr>
										</c:forEach>
                                    </table>
                                </div>
	                                <!-- 글쓰기 버튼 -->
							    
                            </div>
                            
                        </div>
                    </div>

                    <!-- 질문 Tab -->
                    <div class="tab-pane fade" id="question" role="tabpanel" aria-labelledby="questionTab">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">질문 게시판</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="questionTable" width="100%" cellspacing="0">
                                        <!-- 질문 게시판 DataTable 내용 -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div> <!-- End of Main Content -->
        </div> <!-- End of Content Wrapper -->
    </div> <!-- End of Page Wrapper -->
							
<!-- Bootstrap core JavaScript-->
	<script src="/resources/static/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/static/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/static/vendor/chart.js/Chart.min.js"></script>
	<script src="/resources/static/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="/resources/static/js/demo/chart-area-demo.js"></script>
	<script src="/resources/static/js/demo/chart-pie-demo.js"></script>

</body>

</html>
