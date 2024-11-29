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

<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- js -->
<script type="text/javascript">
    $(document).ready(function() {
        // 시험 번호를 URL 파라미터에서 받아옵니다.
        const examNo = new URLSearchParams(window.location.search).get('exam_no');  // exam_no 파라미터값 가져오기

        // 하드코딩된 시험 성적 데이터
        let scoreData = [
            {exam_no: 1, exam_name: "5월 모의고사", user_name: "김철수", original_score: 262, percentile_score: 351, exam_date: "2024-05-15", kor: 86, math: 88, eng: 88},
            {exam_no: 2, exam_name: "6월 평가원 모의고사", user_name: "김철수", original_score: 269, percentile_score: 360, exam_date: "2024-06-10", kor: 86, math: 92, eng: 91},
            {exam_no: 3, exam_name: "7월 모의고사", user_name: "김철수", original_score: 238, percentile_score: 319, exam_date: "2024-07-01", kor: 79, math: 79, eng: 80},
            {exam_no: 4, exam_name: "8월 모평", user_name: "김철수", original_score: 227, percentile_score: 304, exam_date: "2024-08-12", kor: 76, math: 76, eng: 75},
            {exam_no: 5, exam_name: "9월 모의고사", user_name: "김철수", original_score: 289, percentile_score: 387, exam_date: "2024-09-05", kor: 96, math: 97, eng: 96}
        ];

        // 해당 시험 데이터 찾기
        const selectedGrade = scoreData.find(grade => grade.exam_no == examNo);

        if (selectedGrade) {
            // 시험 정보 테이블
            let tableBody = $("#gradeTable tbody");
            tableBody.append(
                "<tr>" +
                    "<td>" + selectedGrade.exam_date + "</td>" +
                    "<td>" + selectedGrade.exam_name + "</td>" +
                    "<td>" + selectedGrade.exam_no + "</td>" +
                    "<td>" + selectedGrade.user_name + "</td>" +
                    "<td>" + selectedGrade.original_score + "</td>" +
                    "<td>" + selectedGrade.percentile_score + "</td>" +
                "</tr>"
            );

            // 성적 상세 테이블
            const subjectData = [
                {subject: '국어', score: selectedGrade.kor, avg_percentile: 90, top_30_percentile: 92},
                {subject: '수학', score: selectedGrade.math, avg_percentile: 90, top_30_percentile: 92},
                {subject: '영어', score: selectedGrade.eng, avg_percentile: 90, top_30_percentile: 92}
            ];

            let subjectTableBody = $("#subjectTable tbody");
            subjectData.forEach(function(subject) {
                subjectTableBody.append(
                    "<tr>" +
                        "<td>" + subject.subject + "</td>" +
                        "<td>응시</td>" +
                        "<td>" + subject.avg_percentile + "</td>" +
                        "<td>" + subject.top_30_percentile + "</td>" +
                        "<td>" + subject.score + "</td>" +
                        "<td>" + Math.round(subject.score * 1.2) + "</td>" +  <!-- 내점수 백분위 예시 -->
                        "<td>2</td>" +  <!-- 등급 예시 -->
                        "<td>1/1</td>" +  <!-- 석차 예시 -->
                    "</tr>"
                );
            });

            // 국영수 성적 바 그래프
            const korScore = selectedGrade.kor;
            const mathScore = selectedGrade.math;
            const engScore = selectedGrade.eng;
            const korTop30 = 92;  // 예시 값, 국어의 상위 30% 백분위 점수
            const mathTop30 = 92; // 예시 값, 수학의 상위 30% 백분위 점수
            const engTop30 = 92;  // 예시 값, 영어의 상위 30% 백분위 점수

         // 바 그래프 생성
            var ctx = document.getElementById("myBarChart").getContext('2d');
            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['국어', '수학', '영어'],  // 과목명
                    datasets: [
                        {
                            label: '내 백분위',
                            backgroundColor: '#4e73df',  // 'primary' 색상 (#4e73df)
                            hoverBackgroundColor: '#2e59d9',  // 마우스 오버시 색상
                            borderColor: '#4e73df',  // 테두리 색상
                            data: [korScore, mathScore, engScore],  // 내 백분위 점수
                        },
                        {
                            label: '상위 30% 백분위',
                            backgroundColor: '#28a745',  // 상위 30% 백분위 색상 - 'success' 색상 (#28a745)
                            hoverBackgroundColor: '#218838',  // 상위 30% 백분위 색상 - 'success' 색상 (#218838)
                            borderColor: '#28a745',
                            data: [korTop30, mathTop30, engTop30],  // 상위 30% 백분위 점수
                        }
                    ]
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
                        x: {
                            grid: {
                                display: false,
                            },
                            ticks: {
                                maxTicksLimit: 5
                            }
                        },
                        y: {
                            // y축의 범위를 0~100으로 고정
                            beginAtZero: true,  // y축이 0부터 시작하도록 설정
                            min: 0,  // y축 최소값을 0으로 설정
                            max: 100,  // y축 최대값을 100으로 설정
                            stepSize: 10,  // y축을 10단위로 표시
                            ticks: {
                                padding: 10,
                                callback: function(value) {
                                    return value + '%';  // 백분위에 '%' 기호 추가
                                },
                            },
                            grid: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                            }
                        },
                    },
                    legend: {
                        display: true  // 범례 표시
                    },
                    tooltips: {
                        titleMarginBottom: 10,
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                        callbacks: {
                            label: function(tooltipItem, chart) {
                                return tooltipItem.yLabel + '%';  // 툴팁에 백분위 % 표시
                            }
                        }
                    }
                }
            }); // end of 바 그래프
        } else {
            console.error("시험 데이터가 없습니다!");
        }
    });
</script>

<!-- 새로운 월별 성적 그래프 추가 -->
<script type="text/javascript">
    $(document).ready(function() {
        // 월별 국영수 성적 그래프
        const monthlyScoreData = [
            {month: '5월', kor: 86, math: 88, eng: 88},
            {month: '6월', kor: 86, math: 92, eng: 91},
            {month: '7월', kor: 79, math: 79, eng: 80},
            {month: '8월', kor: 76, math: 76, eng: 75},
            {month: '9월', kor: 96, math: 97, eng: 96}
        ];

        // 월별 성적 바 그래프 생성
        var ctxMonthly = document.getElementById("myMonthlyChart").getContext('2d');
        var myMonthlyChart = new Chart(ctxMonthly, {
            type: 'bar',
            data: {
                labels: monthlyScoreData.map(data => data.month),  // 월별
                datasets: [
                    {
                        label: '국어',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',  // 투명 초록
                        hoverBackgroundColor: 'rgba(75, 192, 192, 0.7)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.kor),  // 월별 국어 성적
                    },
                    {
                        label: '수학',
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',  // 투명 보라
                        hoverBackgroundColor: 'rgba(153, 102, 255, 0.7)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.math),  // 월별 수학 성적
                    },
                    {
                        label: '영어',
                        backgroundColor: 'rgba(255, 159, 64, 0.2)',  // 투명 주황
                        hoverBackgroundColor: 'rgba(255, 159, 64, 0.7)',
                        borderColor: 'rgba(255, 159, 64, 1)',
                        borderWidth: 1,
                        data: monthlyScoreData.map(data => data.eng),  // 월별 영어 성적
                    }
                ]
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
                    x: {
                        grid: {
                            display: false,
                        },
                        ticks: {
                            maxTicksLimit: 5
                        }
                    },
                    y: {
                        beginAtZero: true,  // y축이 0부터 시작하도록 설정
                        min: 0,  // y축 최소값을 0으로 설정
                        max: 100,  // y축 최대값을 100으로 설정
                        stepSize: 10,  // y축을 10단위로 표시
                        ticks: {
                            padding: 10,
                            callback: function(value) {
                                return value + '%';  // 백분위에 '%' 기호 추가
                            },
                        },
                        grid: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                        }
                    },
                },
                legend: {
                    display: true  // 범례 표시
                },
                tooltips: {
                    titleMarginBottom: 10,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            return tooltipItem.yLabel + '%';  // 툴팁에 백분위 % 표시
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
        <div class="container container-fluid">

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
</body>
</html>