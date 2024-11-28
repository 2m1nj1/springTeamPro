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

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->
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

					<!-- 페이지 명 -->
					<h1 class="h3 mb-4 text-gray-800">수강생관리</h1>

					<!-- 간단 통계 -->
					<div class="row">
						<!-- 전체 수강생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-primary text-uppercase mb-1">
												전체 수강생</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-users fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 수강 강좌가 있는 수강생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-success text-uppercase mb-1">
												수강 중인 수강생</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-pen fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 수강 강좌가 없는 수강생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-danger text-uppercase mb-1">
												강좌가 없는 수강생</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-xmark fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 탈퇴 수강생 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-secondary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text font-weight-bold text-secondary text-uppercase mb-1">
												탈퇴 수강생</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-minus fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<!-- end of 간단 통계 -->

					

					<!-- 검색 조건 설정 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
									검색 조건 설정</h6>
								</div>
								
							
								<div class="card-body">

									<div class="row">
										<label class="col-sm-1 col-form-label">강좌명</label>
										<div class="col-sm-11">
											<input type="text" class="form-control form-control-sm" id=""
												name="" value="">
										</div>
									</div>

									<div class="row">
										<label class="col-sm-1 col-form-label">강사명</label>
										<div class="col-sm-3">
											<input type="text" class="form-control form-control-sm" id=""
												name="" value="">
										</div>


										<label class="col-sm-2 col-form-label">등록기간</label>
										<div class="col-sm-6">
											<div class="row">
												<div class="col">
													<input type="date" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
												~
												<div class="col">
													<input type="date" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
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

					<!-- 수강생 리스트 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-body">
									수강생 리스트 뜰 곳
								</div>
							</div>
						</div>
					</div>
					

					<!-- 하단 버튼 -->
					<div class="row">
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
							<a href="sys_student_detail.do" class="btn btn-primary btn-block"><span
								class="text">수강생 등록</span></a>
						</div>
					</div>
					<!-- end of 하단 버튼 -->



				</div>
				<!-- end of container-fluid -->
			</div>


		</div>

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


		<!-- 개인 추가 .js : 이민지 -->
		<script type="text/javascript" src="/resources/js/system/sys_tab.js"></script>
</body>
</html>