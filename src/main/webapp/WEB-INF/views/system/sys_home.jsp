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
<link href="/resources/static/vendor/fontawesome-free/css/all.min.css"
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
<link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">
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
					
					<div class="row">
						<div class="col">
							<div class="card shadow mb-3">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary ">수강생 관리</h6>
									<div class="dropdown no-arrow">
                                        <a class="button" href="sys_student.do" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-gear fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                    </div>
								</div>	
								<div class="card-body d-flex flex-row align-items-center justify-content-between">
									<div class="text font-weight-bold text-uppercase mb-1">
										전체 수강생
									</div>
									<div class="row align-items-center">
										<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
										<div class="text font-weight-bold text-uppercase mb-0" style="padding-left: 5px">명</div>
									</div>
									
								</div>
							</div>
							<a href="#" class="btn btn-primary btn-block mb-4 shadow"><span class="text">납부 관리</span></a>
						</div>
						
						<div class="col">
							<div class="card shadow mb-3">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">강사 관리</h6>
									<div class="dropdown no-arrow">
                                        <a class="button" href="sys_teacher.do" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-gear fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                    </div>
								</div>	
								<div class="card-body d-flex flex-row align-items-center justify-content-between">
									<div class="text font-weight-bold text-uppercase mb-1">
										전체 강사
									</div>
									<div class="row align-items-center">
										<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
										<div class="text font-weight-bold text-uppercase mb-0" style="padding-left: 5px">명</div>
									</div>
									
								</div>
							</div>
							<a href="#" class="btn btn-primary btn-block mb-4 shadow"><span class="text">강의실 관리</span></a>
						</div>
						
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">강좌 관리</h6>
									<div class="dropdown no-arrow">
                                        <a class="button" href="sys_course.do" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-gear fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                    </div>
								</div>	
								<div class="card-body">
									<div class="d-flex flex-row align-items-center justify-content-between">
										<div class="text font-weight-bold text-uppercase mb-1">
											진행 중인 강좌</div>
										<div class="row align-items-center">
											<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
											<div class="text font-weight-bold text-uppercase mb-0"
												style="padding-left: 5px">개</div>
										</div>
									</div>
									<div class="col" style="padding-top: 16px"></div>
									<div class="d-flex flex-row align-items-center justify-content-between">
										<div class="text font-weight-bold text-uppercase mb-1">
											모집 중인 강좌</div>
										<div class="row align-items-center">
											<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
											<div class="text font-weight-bold text-uppercase mb-0"
												style="padding-left: 5px">개</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-8">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">월별 수강생 통계</h6>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="myAreaChart" width="757" height="320"
											style="display: block; width: 757px; height: 320px;"
											class="chartjs-render-monitor">
										</canvas>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="card shadow mb-4">
										<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">1:1 문의</h6>
											<div class="dropdown no-arrow">
		                                        <a class="button" href="#" role="button" aria-haspopup="true" aria-expanded="false">
		                                            <i class="fas fa-gear fa-sm fa-fw text-gray-400"></i>
		                                        </a>
		                                    </div>
										</div>
										
										<div class="card-body d-flex flex-row align-items-center justify-content-between">
											<div class="text font-weight-bold text-uppercase mb-1">
												새로 들어온 문의
											</div>
											<div class="row align-items-center">
												<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
												<div class="text font-weight-bold text-uppercase mb-0" style="padding-left: 5px">개</div>
											</div>
										</div>
										
									</div>
								</div>

								<div class="col">
									<div class="card shadow mb-4">
										<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">신고</h6>
											<div class="dropdown no-arrow">
		                                        <a class="button" href="#" role="button" aria-haspopup="true" aria-expanded="false">
		                                            <i class="fas fa-gear fa-sm fa-fw text-gray-400"></i>
		                                        </a>
		                                    </div>
										</div>
										<div class="card-body d-flex flex-row align-items-center justify-content-between">
											<div class="text font-weight-bold text-uppercase mb-1">
												새로 들어온 신고
											</div>
											<div class="row align-items-center">
												<div class="h2 mb-0 font-weight-bold text-gray-800">5</div>
												<div class="text font-weight-bold text-uppercase mb-0" style="padding-left: 5px">개</div>
											</div>
											
										</div>
									</div>
								</div>

							</div>


						</div>
						
						<div class="col-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">뭐넣지....</h6>
								</div>	
								<div class="card-body"></div>
							</div>
						</div>
					</div>
					
					
					


				</div>
				<!-- end of container-fluid -->
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
		<script type="text/javascript" src="/resources/js/system/sys_tab.js"></script>
</body>
</html>