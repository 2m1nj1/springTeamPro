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
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

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
					<h1 class="h3 mb-4 text-gray-800">강좌등록</h1>
					
					<!-- 강좌 정보 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										강좌 정보
									</h6>
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
					<!-- end of 강좌 정보 -->
					

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