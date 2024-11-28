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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
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
											<div class="h5 mb-0 font-weight-bold text-gray-800">10</div>
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
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
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
												종강/폐강한 강좌</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-stop fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
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
										<div class="col-3">
											<div class="row">
												<label class="col-sm-4 col-form-label">강사명</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">강의실</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">강의요일</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
										</div>

										<div class="col-6">
											<div class="row">
												<label class="col-sm-3 col-form-label">강좌명</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-3 col-form-label">강좌기간</label>
												<div class="col-sm-9">
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
											<div class="row">
												<label class="col-sm-3 col-form-label">강의시간</label>
												<div class="col-sm-9">
													<div class="row">
														<div class="col">
															<input type="time" class="form-control form-control-sm"
															id="" name="" value="">
														</div>
														~
														<div class="col">
															<input type="time" class="form-control form-control-sm"
															id="" name="" value="">
														</div>
													</div>
													
												</div>
											</div>
										</div>
										
										<div class="col-3">
											<div class="row">
												<label class="col-sm-4 col-form-label">정원</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">진행률</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">상태</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<label class="col-sm-1 col-form-label">태그</label>
										<div class="col-sm-11">
											<input type="text" class="form-control form-control-sm" id=""
												name="" value="">
										</div>
									</div>
									
								</div>
								<!-- end of card body  -->
							</div>
						</div>
					</div>
					<!-- end of 검색 조건 설정 -->
					
					
					
					<!-- 강좌 목록 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-body">
									
									<!-- table 불러오기 -->
									<jsp:include page="../table/com_course_table.jsp">
										<jsp:param name="pageName" value="tch_lectures" />
									</jsp:include>
									
								</div>
							</div>
						</div>
					</div>
					<!-- end of 강좌목록 -->
					
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
							<a href="sys_course_detail.do" class="btn btn-primary btn-block"><span
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