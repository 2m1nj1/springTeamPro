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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/css/system.css" rel="stylesheet">


<!-- Tagify -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<!-- TimePicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style type="text/css">
* {
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
					<h1 class="h3 mb-4 text-gray-800">강좌 등록</h1>

					<!-- 모달 -->
					<jsp:include page="sys_modal.jsp">
						<jsp:param name="pageName" value="modal" />
					</jsp:include>


					<!-- 강좌 정보 -->
					<div class="row">
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">강좌 정보</h6>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-3">
											<div class="row">
												<label class="col-sm-4 col-form-label">강사명</label>
												<div class="col-sm-8">
													<div class="input-group">
														<input type="text" class="form-control form-control-sm"
															id="course_instructor" name="" value="" readonly>
														<button class="btnModal btn btn-sm btn-outline-primary"
															type="button" id="btnModal_course_instructor">
															<i class="fa-solid fa-magnifying-glass"></i>
														</button>
													</div>
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">강의실</label>
												<div class="col-sm-8">
													<div class="input-group">
														<input type="text" class="form-control form-control-sm"
															id="course_classroom" name="" value="" readonly>
														<button class="btnModal btn btn-sm btn-outline-primary"
															type="button" id="btnModal_course_classroom">
															<i class="fa-solid fa-magnifying-glass"></i>
														</button>
													</div>
												</div>
											</div>
										</div>

										<div class="col-6">
											<div class="row">
												<label class="col-sm-2 col-form-label">강좌명</label>
												<div class="col-sm-10">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-2 col-form-label">강좌기간</label>
												<div class="col-sm-10">
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

										<div class="col-3">
											<div class="row">
												<label class="col-sm-3 col-form-label">정원</label>
												<div class="col-sm-9">
													<input type="number" class="form-control form-control-sm"
														min="1" id="" name="" value="">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-3 col-form-label">상태</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-sm"
														id="" name="" value="">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<label class="col-sm-1 col-form-label">요일/시간</label>
										<div class="col-sm-11">
											
											<div class="row mb-2">
												<div class="col">
														<input type="text" class="tagify--outside"
													id="setDateOfWeekAndTime" name="" value="">
												</div>
											</div>
										

											<div class="mb-2" id="">
												<div class="card card-body">
													<div class="row">
														<div class="col">
															<div class="row mb-3">
																<div class="col btn btnSetDayOfWeek">월</div>
																<div class="col btn btnSetDayOfWeek">화</div>
																<div class="col btn btnSetDayOfWeek">수</div>
																<div class="col btn btnSetDayOfWeek">목</div>
																<div class="col btn btnSetDayOfWeek">금</div>
																<div class="col btn btnSetDayOfWeek">토</div>
																<div class="col btn btnSetDayOfWeek">일</div>
															</div>

															<form action="" onsubmit="return false;">
																<div class="row mb-3">
																	<!-- 강의 시작 시간 -->
																	<div class="col">
																		<input id="setStartTime"
																			class="form-control form-control-sm timepicker"
																			placeholder="시간을 선택해주세요" required>
																	</div>
																	<!-- 강의 종료 시간 -->
																	<div class="col">
																		<input id="setEndTime"
																			class="form-control form-control-sm timepicker"
																			placeholder="시간을 선택해주세요" required>
																	</div>
																</div>
																<div class="row mb-3">
																	<div class="col">
																		<button type="submit" class="btn btn-primary btn-block btnAddSch">추가</button>
																	</div>
																</div>
															</form>

														</div>
													</div>
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
										style="display: inline; padding-right: 10px">교육과정 등록</h6>

									<a href="#" class="btn-sm btn-secondary"> <span
										class="text">일괄등록</span>
									</a>
								</div>
								<!-- end of card-header -->

								<!-- card-body -->
								<div class="card-body">
									<div class="table-responsive">
										<form action="">
											<table class="table table-borderless" id="table_lecture"
												width="100%" cellspacing="0">
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
														<td><a href="#"
															class="btn-sm btn-secondary btn_delete_lecture"> <i
																class="fa-solid fa-xmark" style="color: #ffffff;"></i>
														</a></td>
													</tr>
													<tr>
														<td colspan='4'><a href="#"
															class="btn-sm btn-primary btn-block btn_add_lecture">
																<i class="fa-solid fa-plus" style="color: #ffffff;"></i>
														</a></td>
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
							<a href="#" id="btnInsert" class="btn btn-primary btn-block"><span
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

	<!-- 개인 추가 .js : 이민지 -->
	<script type="text/javascript" src="/resources/js/system/sys_main.js"></script>
	<script type="text/javascript" src="/resources/js/system/sys_course.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

</body>
</html>