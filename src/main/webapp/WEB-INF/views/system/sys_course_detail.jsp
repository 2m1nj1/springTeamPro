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

<title>교담 - 관리자</title>

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
	
	/* 개인 css */
	
	#table_lecture th, td {
	    text-align: center;
	}
	
	
	#table_lecture th:first-child {
	    width: 10%;
	}
	
	#table_lecture th:nth-child(2) {
	    width: 30%;
	}
	
	#table_lecture th:last-child {
	    width: 5%;
	}
	
	#table_lecture input {
		width: 100%;
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
					<h1 class="h3 mb-4 text-gray-800">강좌 상세</h1>
					
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
					
					<!-- 교육과정 등록 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<!-- card-header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary"
										style="display: inline; padding-right:10px">교육과정 등록</h6>
										
									<a href="#" class="btn-sm btn-secondary"> <span
										class="text">일괄등록</span>
									</a>
								</div>
								<!-- end of card-header -->
								
								<!-- card-body -->
								<div class="card-body">
									<div class="table-responsive">
										<form action="" >
											<table class="table table-borderless" id="table_lecture" width="100%" cellspacing="0">
												<thead>
													<tr>
														<th>강의회차</th>
														<th>제목</th>
														<th>세부내용</th>
														<th></th>
													</tr>
												</thead>
												
												<tbody>
													<tr>
														<td><input type="text" id="" name="" for="" value=""></td>
														<td><input type="text" id="" name="" for="" value=""></td>
														<td><input type="text" id="" name="" for="" value=""></td>
														<td><a href="#" class="btn-sm btn-secondary btn_delete_lecture">
															<i class="fa-solid fa-xmark" style="color: #ffffff;"></i>
														</a></td>
													</tr>
													<tr>
														<td colspan='4'>
															<a href="#" class="btn-sm btn-primary btn-block btn_add_lecture">
															<i class="fa-solid fa-plus" style="color: #ffffff;"></i>
														</a>
														</td>
													</tr>
													
												</tbody>
											</table>
										</form>
									</div>
								</div>
								<!-- end of card-body -->		
							</div>
						</div>
					</div>
					<!-- end of 교육과정 등록 -->
					
					<!-- 하단 버튼 -->
					<div class="row">
						<div class="col-2">
							<a href="#" class="btn btn-secondary btn-block"><span
								class="text">취소</span></a>
						</div>

						<div class="col-8"></div>

						<div class="col-2">
							<a href="#" class="btn btn-primary btn-block"><span
								class="text">등록</span></a>
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

</body>
</html>