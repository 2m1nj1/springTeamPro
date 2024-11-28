<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>과제 상세 보기 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="resources/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
       *{
          font-family: 'Noto Sans KR', sans-serif;
       }
    </style>

<script type="text/javascript">
// 나중에 hw_no parameter 받아와서 출력토록 연결시켜줘야 함.
</script>

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
    
    <!-- Sidebar -->
    <jsp:include page="/resources/include/menu_tab.jsp">
        <jsp:param name="pageName" value="menuTab"/>
    </jsp:include>
    
     <!-- Content Wrapper -->
     <div id="content-wrapper" class="d-flex flex-column">
     	<!-- Main Content -->
        <div id="content">
     	
     		<!-- Topbar -->
     		<jsp:include page="/resources/include/top_bar.jsp">
     			<jsp:param name="pageName" value="topBar"/>
     		</jsp:include>
     		
     		<!-- Begin Page Content -->
            <div class="container container-fluid">
     			
     		<!-- 페이지 명 -->
			<h5 class="h3 mb-4 text-gray-800">과제 상세 보기 페이지</h5>
     			
     		<!-- 과제 정보 출력 박스 -->
     		<div class="row">
     			<!-- 과제 목록 출력 tbl -->
     			<div class="col">
     				<div class="card shadow mb-4">
     					<div class="card-header py-3">
     						<h6 class="m-0 font-weight-bold text-primary">과제명 : <span id="assignmentTitle">과제명 1</span></h6>
     					</div>
     					<!-- 과제 정보 - hw_context 출력 단 -->
     					<div class="card-body">
     						<!-- 과제 관련 세부사항 여기 아래에 추가할 예정. -->
     						<!-- 제출기한, 강의명, 담당 강사명 은 label : text 형식으로. text는 readonly. -->
     						<div class="form-group">
     							<label for="dueDate">제출기한 :</label>
     							<input type="text" id="dueDate" class="form-control" value="2024-12-31" readonly>
     						</div>
     						
     						<div class="form-group">
     							<label for="courseName">강의명 :</label>
     							<input type="text" id="courseName" class="form-control" value="IT front+back" readonly>
     						</div>

     						<div class="form-group">
     							<label for="instructorName">담당 강사명 :</label>
     							<input type="text" id="instructorName" class="form-control" value="김승민 강사님" readonly>
     						</div>
     						
     						<div class="form-group">
     							<label for="assignmentContext">과제 세부사항 :</label>
     							<textarea id="assignmentContext" class="form-control" rows="5" readonly>
     								이 과제는 프로젝트 기반의 실습 과제입니다. 제출기한까지 작업을 마치고 제출하십시오.
     							</textarea>
     						</div>
     					</div> <!-- end of card-body -->
     				</div> <!-- end of card shadow mb-4 -->
     			</div> <!-- end of col - 과제 목록 출력 tbl -->
     		</div> <!-- end of row - 과제 정보 출력 박스 -->
     		
     		<div class="row"> <!-- start of go-to-previous-page btn -->
				<div class="col-4">
					<a href="stu_homework.do" class="btn btn-primary btn-icon-split btn">
						<span class="icon text-white-50">
							<i class="fas fa-arrow-right"></i>
						</span>
						<span class="text">이전 화면</span>
					</a>
				</div>
			</div> <!-- end of go-to-previous-page btn -->
     		
     	</div> <!-- end of container-fluid -->

    </div> <!-- end of content -->

    <!-- Bootstrap core JavaScript-->
    <script src="resources/static/vendor/jquery/jquery.min.js"></script>
    <script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/static/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/static/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/static/js/demo/chart-area-demo.js"></script>
    <script src="resources/static/js/demo/chart-pie-demo.js"></script>

</body>
</html>