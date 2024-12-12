<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<link href="/resources/css/system.css" rel="stylesheet">
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

					<!-- 페이지 명 -->
					<h1 class="h3 mb-4 text-gray-800">강좌관리</h1>

					<div class="row">
						
						<!-- 모집 중인 강좌 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-warning text-uppercase mb-1">
												모집 중인 강좌</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${count_recruit}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-book-open-reader fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 진행 중인 강좌 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-success text-uppercase mb-1">
												진행 중인 강좌</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${count_progress}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-play fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 휴강 중인 강좌 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text font-weight-bold text-danger text-uppercase mb-1">
												휴강 중인 강좌
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${count_rest}</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-pause fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 종강/폐강한 강좌 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-secondary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-secondary text-uppercase mb-1">
												종강한 강좌</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${count_end}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-stop fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 모달 -->
					<jsp:include page="sys_modal.jsp">
						<jsp:param name="pageName" value="modal" />
					</jsp:include>
					
					
					
					
					<!-- 검색 조건 설정 -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col"> -->
<!-- 							<div class="card shadow mb-4"> -->
<!-- 								<div class="card-header py-3"> -->
<!-- 									<h6 class="m-0 font-weight-bold text-primary" -->
<!-- 									style="display: inline; padding-right:10px"> -->
<!-- 									검색 조건 설정</h6> -->
<!-- 									<a href="#" class="btn-sm btn-secondary btnConClear"> <span -->
<!-- 										class="text">초기화</span> -->
<!-- 									</a> -->
<!-- 								</div> -->
								
<!-- 								<div class="card-body"> -->
<!-- 									<div class="row"> -->
<!-- 										<div class="col-3"> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">강사명</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<div class="input-group"> -->
<!-- 														<input type="text" class="form-control form-control-sm" -->
<!-- 														id="course_instructor" name="" value=""> -->
<!-- 														<button class="btnModal btn btn-sm btn-outline-primary" type="button" id="btnModal_course_instructor"> -->
<!-- 															<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">강의실</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<div class="input-group"> -->
<!-- 														<input type="text" class="form-control form-control-sm" -->
<!-- 														id="course_classroom" name="" value=""> -->
<!-- 														<button class="btnModal btn btn-sm btn-outline-primary" type="button" id="btnModal_course_classroom"> -->
<!-- 															<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">강의요일</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<input type="text" class="form-control form-control-sm" -->
<!-- 														id="" name="" value=""> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 										<div class="col-6"> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-3 col-form-label">강좌명</label> -->
<!-- 												<div class="col-sm-9"> -->
<!-- 													<div class="input-group"> -->
<!-- 														<input type="text" class="form-control form-control-sm" -->
<!-- 														id="course_name" name="" value=""> -->
<!-- 														<button class="btnModal btn btn-sm btn-outline-primary" type="button" id="btnModal_course_name"> -->
<!-- 															<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-3 col-form-label">강좌기간</label> -->
<!-- 												<div class="col-sm-9"> -->
<!-- 													<div class="row"> -->
<!-- 														<div class="col"> -->
<!-- 															<input type="date" class="form-control form-control-sm" -->
<!-- 															id="" name="" value=""> -->
<!-- 														</div> -->
<!-- 														~ -->
<!-- 														<div class="col"> -->
<!-- 															<input type="date" class="form-control form-control-sm" -->
<!-- 															id="" name="" value=""> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-3 col-form-label">강의시간</label> -->
<!-- 												<div class="col-sm-9"> -->
<!-- 													<div class="row"> -->
<!-- 														<div class="col"> -->
<!-- 															<input type="time" class="form-control form-control-sm" -->
<!-- 															id="" name="" value=""> -->
<!-- 														</div> -->
<!-- 														~ -->
<!-- 														<div class="col"> -->
<!-- 															<input type="time" class="form-control form-control-sm" -->
<!-- 															id="" name="" value=""> -->
<!-- 														</div> -->
<!-- 													</div> -->
													
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
										
<!-- 										<div class="col-3"> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">정원</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<input type="text" class="form-control form-control-sm" -->
<!-- 														id="" name="" value=""> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">진행률</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<input type="text" class="form-control form-control-sm" -->
<!-- 														id="" name="" value=""> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row"> -->
<!-- 												<label class="col-sm-4 col-form-label">상태</label> -->
<!-- 												<div class="col-sm-8"> -->
<!-- 													<input type="text" class="form-control form-control-sm" -->
<!-- 														id="" name="" value=""> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
<!-- 									<div class="row"> -->
<!-- 										<label class="col-sm-1 col-form-label">태그</label> -->
<!-- 										<div class="col-sm-11"> -->
<!-- 											<input type="text" class="form-control form-control-sm" id="" -->
<!-- 												name="" value=""> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
<!-- 								</div> -->
<!-- 								end of card body  -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!-- end of 검색 조건 설정 -->
					
					<!-- 키워드 검색 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="row">
										<div class="col-8">
											<div class="input-group">
												<button class="btn btn-outline-secondary dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false">검색어 선택</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" href="#">Action</a></li>
													<li><a class="dropdown-item" href="#">Another
															action</a></li>
													<li><a class="dropdown-item" href="#">Something
															else here</a></li>
													<li><hr class="dropdown-divider"></li>
													<li><a class="dropdown-item" href="#">Separated
															link</a></li>
												</ul>
												<input type="text" class="form-control"
													aria-label="Text input with dropdown button">
											</div>
										</div>
										
										<div class="col-2">
											<a href="#" class="btn btn-secondary btn-block"><span
											class="text">검색 초기화</span></a>
										</div>
										
										<div class="col-2">
											<a href="#" class="btn btn-primary btn-block"><span
												class="text">검색</span></a>
										</div>

									</div>
								
									
									
								</div>
							</div>
						</div>
					</div>
					<!-- end of 키워드 검색 -->
					
					
					<!-- 강좌 목록 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-border table-hover table-head-fix" id="courseList"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th><input type="checkbox"
														id="allCourseChk" class="checkbox_all"></th>
													<th>강좌번호</th>
													<th>강좌명</th>
													<th>강사명</th>
													<th>강의실</th>
													<th>인원</th>
													<th>상태</th>
													<th>수강료</th>
													<th></th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="item" items="${courseList}">
													<tr>
														<td><input type="checkbox" class=""></td>
														<td>${item.course_no}</td> 
														<td>${item.course_name}</td>
														<td>${item.course_instructor}</td>
														<td>${item.classroom_name}</td>
														<td>${item.course_person}</td>
														<td>${item.course_status}</td>
														<td>${item.course_fee}</td>
														<td>
															<div class="btn btn-sm btn-secondary btnCourseDetail">
																<i class="fas fa-magnifying-glass fa-xs text-gray-300"></i>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end of 강좌목록 -->
					
					<!-- 하단 버튼 -->
					<div class="row mb-5">
						<div class="col-2">
							<a href="#" class="btn btn-secondary btn-block"><span
								class="text">선택 삭제</span></a>
						</div>

						<div class="col-6"></div>
						
						<div class="col-2">
							<a href="#" class="btn btn-primary btn-block"><span
								class="text">일괄 등록</span></a>
						</div>
						<div class="col-2">
							<a href="sys_courseInsert.do" class="btn btn-primary btn-block"><span
								class="text">강좌 등록</span></a>
						</div>
					</div>
					<!-- end of 하단 버튼 -->



				</div>
				<!-- end of Begin Page Content -->
			</div>
		</div>


	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/static/vendor/jquery/jquery.min.js"></script>
 	<script
 		src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	
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
		
	<!-- 개인 추가 .js : 이민지 -->
	<script type="text/javascript" src="/resources/js/system/sys_main.js"></script>
	<script type="text/javascript" src="/resources/js/system/sys_course.js"></script>
	<script type="text/javascript" scr="/resources/js/system/sys_insert.js"></script>
</body>
</html>