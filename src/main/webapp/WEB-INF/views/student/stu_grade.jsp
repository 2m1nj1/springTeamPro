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

<title>stu_grade.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript">
//JSON 데이터를 받아서 Chart.js로 그래프를 그리기 위한 코드 예시
let scoreData = ${gradesJson};  // gradesJson 변수는 서버에서 JSON 형태로 전달받은 데이터

let labels = scoreData.map(function(grade) {
    return grade.examDate;  // 시험 날짜
});

let data = scoreData.map(function(grade) {
    return grade.score;  // 시험 점수
});

let ctx = document.getElementById('scoreTrendChart').getContext('2d');
let scoreTrendChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: '시험 성적',
            data: data,
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            x: {
                display: true,
                title: {
                    display: true,
                    text: '시험 날짜'
                }
            },
            y: {
                display: true,
                title: {
                    display: true,
                    text: '성적'
                }
            }
        }
    }
});
</script>

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
				<div class="container-fluid">

					<!-- 페이지 명 -->
					<h5 class="h3 mb-4 text-gray-800">성적 조회</h5>

					<!-- 시험 정보 출력 박스 -->
                    <div class="row">
                        <!-- 시험 정보 테이블 표시단 -->
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">시험 성적 목록</h6>
                                </div>
                                <!-- 시험 정보 tbl 출력할 단 -->
                                <div class="card-body">
                                    <table class="table table-bordered" id="gradeTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>시험 ID</th>
                                                <th>학생 이름</th>
                                                <th>시험 점수</th>
                                                <th>시험 날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- 시험 성적 데이터 출력 (동적으로 생성) -->
                                            <c:forEach var="grade" items="${grades}">
                                                <tr>
                                                    <td>${grade.exam_no}</td>
                                                    <td>${grade.user_name}</td>
                                                    <td>${grade.original_score}</td>
                                                    <td>${grade.exam_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end of col -->

                    </div> <!-- end of row - 시험정보 출력단 끝 -->

                    <!-- 시험 점수 추이 그래프 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">시험 성적 추이</h6>
                                </div>
                                <div class="card-body">
                                    <canvas id="scoreTrendChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of 시험 점수 추이 그래프 -->
                    
                    <div class="row"> <!-- stu_gradeInsert.jsp 로 넘어가는 버튼 -->
						<div class="col-4">
							<a href="stu_gradeInsert.do" class="btn btn-primary btn-icon-split btn">
								<span class="icon text-white-50">
									<i class="fas fa-arrow-up"></i>
								</span>
								<span class="text">성적 입력</span>
							</a>
						</div>
					</div> <!-- end of stu_gradeInsert.jsp btn -->
                    
						<!-- //시험 정보  -->
					</div> <!-- end of container-fluid-->
				</div> <!-- end of content -->
			</div> <!-- end of content-Wrapper -->

			
			<!-- 성적 입력 버튼 -->

			<!-- Bootstrap core JavaScript-->
			<script src="resources/static/vendor/jquery/jquery.min.js"></script>
			<script
				src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="resources/static/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script src="resources/static/vendor/chart.js/Chart.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="resources/static/js/demo/chart-area-demo.js"></script>
			<script src="resources/static/js/demo/chart-pie-demo.js"></script>
</body>
</html>