<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>출결 조회</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

// 초기화 함수 (페이지 로드 시 데이터 표시)
// $(function(){
	
// 	filterAttendance('전체');  // 초기 로드시 모든 출석 상태를 표시
	


// 	// AJAX 요청
// 	$.ajax({
// 	    url: '../tch_attendance',  // 서버의 필터링을 처리하는 URL 
// 	    type: 'GET',
// 	    data: { examdate: selectedDate },  // 선택된 날짜를 서버로 전달
// 	    success: function(response) {
// 	        // 서버에서 반환된 데이터로 테이블 갱신
// 	        console.log(response);
// 	        updateAttendanceTable(response);
// 	        filterAttendance();
// 	    },
// 	    error: function(xhr, status, error) {
// 	        alert('출결 데이터를 가져오는 데 실패했습니다.');
// 	        console.log(error);
// 	    }	// end of error
// 	}); //end of ajsx

// 	function updateAttendanceTable(data) {
// 	    // tbody 영역 초기화
// 	    $('#attendanceList tbody tr').empty();

// 	   // 받은 데이터로 테이블에 새로운 데이터 채우기
// 	   data.forEach(function(attendance) {
// 	       var row = '<tr>' +
// 	                   '<td>' + attendance.course_name + '</td>' +
// 	                   '<td>' + attendance.user_name + '</td>' +
// 	                   '<td>' + attendance.attendance_date + '</td>' +
// 	                   '<td>' + attendance.user_tel + '</td>' +
// 	                   '<td>' + attendance.attendance_status_no + '</td>' +
// 	                 '</tr>';
// 	       $('#attendanceList tbody tr').append(row);
// 	       alert("받은데이터 채우기 성공");
// 	   }); //end of forEach
// 	}	// end of updateAttendanceTable

// });   //end of function() 


// // 출결 현황 선택시 목록에서 선택한 항목에 해당하는 목록만 보이기
// function filterAttendance(status) {
		
//     const rows = document.querySelectorAll("#attendanceList tbody tr");
    
//     rows.forEach(row => {
//         const attendanceStatus = row.querySelector("td:nth-child(5)").textContent.trim();	// trim 사용해서 공백제거
//         if (attendanceStatus === status || status === '전체') {
//             row.style.display = '';  // 필터링된 상태는 보이도록 설정
//         } else {
//             row.style.display = 'none';  // 필터링된 상태는 숨기도록 설정
//         }
//     });
// }	// end of 출결현황

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

				<!-- Begin Page Content - 네비게이터 등 기본 frame 빼고 다 여기 들어감 -->
				<div class="container container-fluid">

					<!--페이지 명 -->
					<h5 class="h3 mb-4 text-gray-800">강좌 출결 조회</h5>

					<!-- 출결 정보 출력 박스 -->
					<div class="row">
						<!-- 시험 정보 테이블 표시단 -->
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">출석부 조회하기</h6>
								</div>

								<!-- 특정 날의 출석부 선택 단 -->
								<div class="card-body">
									<div class="row">

										<!-- left -->
										<div class="col-5">

											<div class="row">
												<label class="col-sm-3 col-form-label">강좌명</label>
												<hr />
												<div class="col-sm-5">
													<input type="text" class="form-control form-control-sm"
														name="attendedCourse" id="attendedCourse" readonly>
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control form-control-sm"
														name="attendedTotal" id="attendedTotal" readonly>
												</div>
												<label class="col-sm-2 col-form-label">명</label>
											</div>

											<div class="row">
												<label class="col-sm-4 col-form-label">출 석 </label>
												<div class="col-sm-4"></div>
												<div class="col-sm-2">
													<input type="text" class="form-control form-control-sm"
														name="attended" id="attended" readonly>
												</div>
												<label class="col-sm-2 col-form-label">명</label>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">조 퇴 </label>
												<div class="col-sm-4"></div>
												<div class="col-sm-2">
													<input type="text" class="form-control form-control-sm"
														name="left" id="left" readonly>
												</div>
												<label class="col-sm-2 col-form-label">명</label>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">결 석 </label>
												<div class="col-sm-4"></div>
												<div class="col-sm-2">
													<input type="text" class="form-control form-control-sm"
														name="absent" id="absent" readonly>
												</div>
												<label class="col-sm-2 col-form-label">명</label>
											</div>
										</div>

										<div class="col-1"></div>

										<div class="col-6">
											<!-- 강좌 선택 카테고리 드랍박스; 수강중인 강의 목록 가져와서 그에 대한 과제 표시토록 할 것임 -->
											<div class="row">
												<div class="col-sm-5">
													<!-- 드롭다운 div 시작 -->
													<div class="input-group">
														<button class="btn btn-outline-primary dropdown-toggle"
															type="button" data-bs-toggle="dropdown"
															aria-expanded="false">강좌 선택</button>
														<ul class="dropdown-menu" id="courseDropdown">
															<li><a class="dropdown-item" href="#">국 어</a></li>
															<li><a class="dropdown-item" href="#">수 학</a></li>
															<li><a class="dropdown-item" href="#">영 어</a></li>

														</ul>
													</div>
												</div>
												<!-- 드롭다운 div 종료 -->

												<div class="col-sm-7">
													<!-- 검색창 div 시작 -->
													<input type="text" class="form-control"
														aria-label="Text input with dropdown button"
														placeholder="이름을 검색하세요">
												</div>
												<!-- 검색창 div 종료 -->
											</div>

											<div class="row">
												<!-- 날짜 선택 div 시작 -->
												<div class="col-sm-5">
													<input type="date" class="form-control form-control-sm"
														name="examdate" id="examdate">
												</div>
											</div>
											<!-- 날짜 선택 div 종료 -->

											<div class="row">
												<label class="col-sm-5 col-form-label">출결 현황</label>
											</div>

											<div class="row">
												<!-- 버튼 div 시작 -->
												<div class="col-sm-3">
													<a href="#" class="btn btn-success btn-icon-split"
														onclick="filterAttendance('출석')"><span
														class="icon text-white-50"> <i class="fas fa-check"></i>
													</span><span class="text">출석</span> </a>
												</div>
												<div class="col-sm-1"></div>
												<div class="col-sm-3">
													<a href="#" class="btn btn-warning btn-icon-split"
														onclick="filterAttendance('조퇴')"><span
														class="icon text-white-50"> <i
															class="fas fa-exclamation-triangle"></i>
													</span><span class="text">조퇴</span> </a>
												</div>
												<div class="col-sm-1"></div>
												<div class="col-sm-3">
													<a href="#" class="btn btn-danger btn-icon-split"
														onclick="filterAttendance('결석')"><span
														class="icon text-white-50"> <i class="fas fa-trash"></i>
													</span><span class="text">결석</span> </a>
												</div>
											</div>
											<!-- 버튼 div 종료 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end of col -->
					<!-- end of 출결정보 출력 박스 -->

					<!-- 출결 목록 박스 시작 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">출결 목록</h6>
								</div>
								<!-- 출결 목록 정보 출력 단 -->
								<div class="card-body">
									<table class="table table-bordered" id="attendanceList"
										width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>강좌명</th>
												<th>학생명</th>
												<th>출석일시</th>
												<th>연락처</th>
												<th>출석현황</th>
												<th>출결상세</th>
											</tr>
										</thead>
										<!-- 출결 목록 데이터 출력 (동적으로 생성) -->
										<tbody>
											<c:forEach var="attendance" items="${tchAttendance}">
												<tr>
													<td>${attendance.course_name}</td>
													<td>${attendance.user_name}</td>
													<td>${attendance.attendance_date}</td>
													<td>${attendance.user_tel}</td>
													<td><c:choose>
															<c:when test="${attendance.attendance_status_no == 1}">
																<a href="#" class="btn btn-success btn-sm">출석</a>
															</c:when>
															<c:when test="${attendance.attendance_status_no == 2}">
																<a href="#" class="btn btn-warning btn-sm">조퇴</a>
															</c:when>
															<c:when test="${attendance.attendance_status_no == 3}">
																<a href="#" class="btn btn-danger btn-sm">결석</a>
															</c:when>
															<c:otherwise>
																<a href="#" class="btn btn-secondary btn-sm">미정</a>
															</c:otherwise>
														</c:choose></td>
													<td><a
														href="tch_attendance_detail.do?attendance_no=${attendance.attendance_no}"
														class="btn btn-info btn-icon-split btn"> <span
															class="icon text-white-50"> <i
																class="fas fa-info-circle"></i>
														</span> <span class="text">출결 상세</span></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- end of col - 시험정보테이블 표시 끝 -->
					</div>
					<!-- end of row - 시험정보 출력단 끝 -->
				</div>
				<!-- 여기까지 기본 프레임 안에 들어가는 콘텐츠들 -->
			</div>
			<!-- Main content 여기서 끝남 -->
		</div>
		<!-- Content Wrapper 여기서 끝남 -->


	</div>
	<!-- Page Wrapper 여기서 끝남 -->

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/static/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- 드랍 박스가 제대로 작동 안한다면 사용!! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/static/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/static/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/static/js/demo/chart-area-demo.js"></script>
	<script src="/resources/static/js/demo/chart-pie-demo.js"></script>

	<!-- 개인 추가 .js : 한국인 -->
	<script src="/resources/js/comm/comm_messageList.js"></script>
	<script src="/resources/js/comm/tch_attendance.js"></script> 

</body>
</html>