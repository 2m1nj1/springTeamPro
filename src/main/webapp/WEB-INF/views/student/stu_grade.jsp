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
<link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
   * {
      font-family: 'Noto Sans KR', sans-serif;
   }
</style>

<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
// number_format 함수
function number_format(number, decimals, dec_point, thousands_sep) {
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

// jQuery로 DOM이 로드되었을 때 실행
$(document).ready(function() {
    // 하드코딩된 시험 성적 데이터
    let scoreData = [
        {exam_no: 1, exam_name: "5월 모의고사", user_name: "김철수", original_score: 262, percentile_score: 351 , exam_date: "2024-05-15", kor: 86, math: 88, eng: 88},
        {exam_no: 2, exam_name: "6월 평가원 모의고사", user_name: "김철수", original_score: 269, percentile_score: 360, exam_date: "2024-06-10", kor: 86, math: 92, eng: 91},
        {exam_no: 3, exam_name: "7월 모의고사", user_name: "김철수", original_score: 238, percentile_score: 319, exam_date: "2024-07-01", kor: 79, math: 79, eng: 80},
        {exam_no: 4, exam_name: "8월 모평", user_name: "김철수", original_score: 227, percentile_score: 304, exam_date: "2024-08-12", kor: 76, math: 76, eng: 75},
        {exam_no: 5, exam_name: "9월 모의고사", user_name: "김철수", original_score: 289, percentile_score: 387, exam_date: "2024-09-05", kor: 96, math: 97, eng: 96}
    ];

    // 시험 날짜와 성적 데이터를 Chart.js를 위한 형식으로 변환
    let labels = scoreData.map(function(grade) {
        return grade.exam_date;  // 시험 날짜
    });

    let scores = scoreData.map(function(grade) {
        return grade.original_score;  // 시험 점수
    });

    // 테이블에 데이터를 동적으로 출력
    let tableBody = $("#gradeTable tbody");
    scoreData.forEach(function(grade) {
        tableBody.append(
            "<tr>" +
                "<td>" + grade.exam_no + "</td>" +
                "<td>" + grade.exam_name + "</td>" +
                "<td>" + grade.user_name + "</td>" +
                "<td>" + grade.original_score + "</td>" +
                "<td>" + grade.exam_date + "</td>" +
                "<td><a href='stu_grade_details.do?exam_no=" + grade.exam_no + "' class='btn btn-info btn-sm'>상세 보기</a></td>" +
            "</tr>"
        );
    });

    // 차트를 그릴 Canvas 요소 선택
    var ctx = document.getElementById('scoreTrendChart').getContext('2d');

    // 시험 성적 추이를 나타내는 차트 생성
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: "시험 성적",
                lineTension: 0.3,
                backgroundColor: "rgba(78, 115, 223, 0.05)",
                borderColor: "rgba(78, 115, 223, 1)",
                pointRadius: 3,
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "rgba(78, 115, 223, 1)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                pointHitRadius: 10,
                pointBorderWidth: 2,
                data: scores,
            }]
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        maxTicksLimit: 5,
                        padding: 10,
                        // 성적 표시
                        callback: function(value) {
                            return number_format(value);
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem) {
                        return "성적: " + number_format(tooltipItem.yLabel);
                    }
                }
            }
        }
    });
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
				<div class=" container container-fluid">

					<!-- 페이지 명 -->
					<h5 class="h3 mb-4 text-gray-800">성적 조회</h5>
					
					<!-- 시험 응시 연도 조회 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">응시 연도 조회</h6>
                                </div>
                                <div class="card-body">
                                     <nav class="navbar navbar-expand navbar-light bg-light mb-4">
									    <a class="navbar-brand" href="#">Navbar</a>
									    <ul class="navbar-nav ml-auto">
									        <li class="nav-item dropdown">
									            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									                <span id="selectedCourse">응시 연도 선택</span> <!-- 기본 텍스트 -->
									            </a>
									            <div class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">
									                <a class="dropdown-item" href="#" onclick="selectYear('2024')">2024</a>
									                <a class="dropdown-item" href="#" onclick="selectYear('2023')">2023</a>
									                <a class="dropdown-item" href="#" onclick="selectYear('2022')">2022</a>
									                <a class="dropdown-item" href="#" onclick="selectYear('2021')">2021</a>
									                
									                <div class="dropdown-divider"></div>
									                <a class="dropdown-item" href="#">Something else here</a>
									            </div>
									        </li>
									    </ul>
									</nav>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of 시험 응시 연도 조회 -->
					
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
                                                <th>시험 이름</th>
                                                <th>학생 이름</th>
                                                <th>원점수</th>
                                                <th>시험 날짜</th>
                                                <th>상세 보기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- AJAX로 성적 데이터를 동적으로 추가 -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end of col -->

                    </div> <!-- end of row - 시험정보 출력단 끝 -->

                    <!-- 시험 성적 추이 그래프 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">시험 성적 추이</h6>
                                </div>
                                <div class="card-body">
                                    <canvas id="scoreTrendChart" width="400" height="400"></canvas>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of 시험 점수 추이 그래프 -->
                    
                    <div class="row"> <!-- stu_gradeInsert.jsp 로 넘어가는 버튼 -->
                    	<div class="col-9"></div>
						<div class="col-3">
							<a href="stu_gradeInsert.do" class="btn btn-primary btn-icon-split btn">
								<span class="icon text-white-50">
									<i class="fas fa-arrow-up"></i>
								</span>
								<span class="text">성적 입력</span>
							</a>
						</div>
					</div> <!-- end of stu_gradeInsert.jsp btn -->
                    
				</div> <!-- end of container-fluid-->
			</div> <!-- end of content -->
 		<!-- Bootstrap core JavaScript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-ZvpUoO/+PpGGQbYFv8N5+bscp8Jf5lft2wh7USc+zso=Z" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0jXg5J9aF9s92BByzICLgSkjzv66AqxEq1Yg2QsZqaQF0J5F" crossorigin="anonymous"></script>

        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="resources/static/js/sb-admin-2.min.js"></script>
    </div> <!-- end of wrapper -->

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

	</div> <!-- end of wrapper -->
</body>
</html>