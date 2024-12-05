<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>stu_grade_details.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
       *{
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
			
			<!-- 이전 화면으로부터(stu_grade.jsp) user_no 넘어옴 -->
			<input type="hidden" id="userNo" name="userNo" value="${userNo}">
			
            <!-- 페이지 명 -->
            <h5 class="h3 mb-4 text-gray-800">세부 성적 조회</h5>

            <!-- 시험 정보 출력 박스 -->
            <div class="row">
                <!-- 시험 정보 테이블 표시단 -->
                <div class="col">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">시험 정보</h6>
                        </div>
                        <!-- 시험 정보 tbl 출력할 단 -->
                        <div class="card-body">
                            <table class="table table-bordered" id="gradeTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>시험 일자</th>
                                        <th>시험명</th>
                                        <th>수험 번호</th>
                                        <th>학생 이름</th>
                                        <th>원점수 총합</th>
                                        <th>백분위 총합</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- 자바스크립트로 동적으로 추가됩니다 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->

            <!-- 성적 상세 정보 출력 박스 -->
            <div class="row">
                <div class="col">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">성적 상세 정보</h6>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered" id="subjectTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <td>과목</td>
                                        <td>응시</td>
                                        <td>전체 평균(백분위)</td>
                                        <td>상위 30%(백분위)</td>
                                        <td>내점수</td>
                                        <td>내점수(백분위)</td>
                                        <td>등급</td>
                                        <td>전체 석차</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- 자바스크립트로 동적으로 추가됩니다 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->

            <!-- 국영수 성적 내 백분위 vs 상위 30% 비교 그래프 -->
            <div class="row">
                <div class="col">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">국영수 성적 상위 30%와 비교해보기</h6>
                        </div>
                        <div class="card-body">
                            <canvas id="myBarChart" style="height: 400px;"></canvas>
                        </div>
                    </div>
                </div>
            </div><!-- 국영수 성적 내 백분위 vs 상위 30% 비교 그래프 -->

			<!-- 국영수 성적 월별 비교 그래프 -->
			<div class="row">
			    <div class="col">
			        <div class="card shadow mb-4">
			            <div class="card-header py-3">
			                <h6 class="m-0 font-weight-bold text-primary">국영수 월별 성적 추이</h6>
			            </div>
			            <div class="card-body">
			                <canvas id="myMonthlyChart" style="height: 400px;"></canvas>
			            </div>
			        </div>
			    </div>
			</div><!-- end of 국영수 성적 월별 비교 그래프 -->

            <div class="row">
                <div class="col-9"></div>
                <div class="col-3">
                    <a href="stu_grade.do" class="btn btn-secondary btn-icon-split btn">
                        <span class="icon text-white-50">
                            <i class="fas fa-arrow-right"></i>
                        </span>
                        <span class="text">이전 화면</span>
                    </a>
                </div>
            </div>

        </div> <!-- end of container-fluid-->
    </div> <!-- end of content -->
</div> <!-- end of content-Wrapper -->
</div> <!-- end of wrapper -->
		
	<!-- 성적 입력 버튼 -->

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
	
	<!-- stu_grade_details js -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="resources/js/student/stu_grade_details.js"></script>
</body>
</html>