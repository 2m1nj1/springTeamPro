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
<script
	src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />

<!-- TimePicker -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- Jstree -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />


<style type="text/css">
* {
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
									<!-- 강좌 form -->
									<form action="insertCourse" id="insertCourseForm" method="POST">
										<div class="row">
											<div class="col-6">

												<div class="row">
													<label class="col-sm-2 col-form-label">강좌명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-sm"
															id="course_name" name="course_name" value=""
															placeholder="강좌명을 입력하세요.">
													</div>
												</div>
												<!-- end of 강좌명 -->

												<div class="row">
													<label class="col-sm-2 col-form-label">강좌기간</label>
													<div class="col-sm-10">
														<div class="row">
															<div class="col">
																<input type="date" class="form-control form-control-sm"
																	id="course_startDate" name="course_startDate" value="">
															</div>
															~
															<div class="col">
																<input type="date" class="form-control form-control-sm"
																	id="course_endDate" name="course_endDate" value="">
															</div>
														</div>
													</div>
												</div>
												<!-- end of 강좌기간 -->
												
											</div>
											<!-- end of col-6 -->
										
										
											<div class="col-3">
												<div class="row">
													<label class="col-sm-4 col-form-label">강사명</label>
													<div class="col-sm-8">
														<div class="input-group">
															<input type="hidden" class="form-control form-control-sm"
																id="course_instructor_pk" name="course_instructor"
																value="">
															<input type="text"
																class="form-control form-control-sm"
																id="course_instructor" value="" placeholder="" readonly>
															<button class="btnModal btn btn-sm btn-outline-primary"
																type="button" id="btnModal_course_instructor">
																<i class="fa-solid fa-magnifying-glass"></i>
															</button>
														</div>
													</div>
												</div>
												<!-- end of 강사명 -->
												<div class="row">
													<label class="col-sm-4 col-form-label">수강료</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
															min="0" id="course_fee" name="course_fee">
													</div>
												</div>
												<!-- end of 수강료 -->
												<div class="row">
													<label class="col-sm-4 col-form-label">강좌상태</label>
													<div class="col-sm-8">
														<select class="custom-select custom-select-sm" name="course_status">
															<c:forEach var="item" items="${courseStaList}">
																	<option value="${item.course_status_name}">${item.course_status_name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<!-- end of 강좌상태 -->
											</div>
											<!-- end of col-3 -->

											<div class="col-3">
											
												<div class="row">
													<label class="col-sm-4 col-form-label">강의실</label>
													<div class="col-sm-8">
														<div class="input-group">
															<input type="hidden" class="form-control form-control-sm"
																id="course_classroom_pk" name="course_classroom"
																value=""> <input type="text"
																class="form-control form-control-sm"
																id="course_classroom" value="" readonly>
															<button class="btnModal btn btn-sm btn-outline-primary"
																type="button" id="btnModal_course_classroom">
																<i class="fa-solid fa-magnifying-glass"></i>
															</button>
														</div>
													</div>
												</div>
												<!-- end of 강의실 -->
												<div class="row">
													<label class="col-sm-4 col-form-label">정원</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
															min="1" id="course_maxPerson" name="course_maxPerson"
															value="1">
													</div>
												</div>
												<!-- end of 정원 -->
												<div class="row">
													<label class="col-sm-4 col-form-label">분류</label>
													<div class="col-sm-8">
														<div class="input-group">
															<input type="hidden" id="courseCatePk" name="course_cate_no"
																value="">
															<input type="text"
																class="form-control form-control-sm" id="courseCateText"
																name="" value="" readonly>
															<button class="btnModal btn btn-sm btn-outline-primary"
																type="button" id="btnModal_course_cate">
																<i class="fa-solid fa-magnifying-glass"></i>
															</button>
														</div>
													</div>
												</div>
												<!-- end of 분류 -->
											</div>
											<!-- end of col-3 -->
										</div>
										<!-- end of row -->
									</form>
									<!-- end of 강좌 form -->

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
															<div class="row mb-3" style="text-align: center;">
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">월</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">화</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">수</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">목</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">금</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">토</div>
																<div
																	class="col btn-sm border border-primary text-primary btnSetDayOfWeek">일</div>
															</div>


															<div class="row mb-3">
																<!-- 강의 시작 시간 -->
																<div class="col-2" style="text-align: center;">
																	<label class="col-form-label-sm">강의 시작 시간</label>
																</div>
																<div class="col-4">
																	<div class="row">
																		<input id="setStartTime"
																			class="form-control form-control-sm timepicker"
																			placeholder="시간을 선택하세요." required readonly>
																	</div>
																</div>
																<!-- 강의 종료 시간 -->
																<div class="col-2" style="text-align: center;">
																	<label class="col-form-label-sm">강의 종료 시간</label>
																</div>
																<div class="col-4">
																	<div class="row">
																		<input id="setEndTime"
																			class="form-control form-control-sm timepicker"
																			placeholder="시간을 선택하세요." required readonly>
																	</div>
																</div>
															</div>
															<div class="row mb-3">
																<button
																	class="btn btn-sm border border-primary text-primary btn-block btnAddSch">요일/시간
																	추가</button>
															</div>

															<div class="row mb-3">
																<div class="col">
																	<div id="chkAddResult"></div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
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

									<div class="btn btn-sm btn-secondary">
										<span class="text">일괄등록</span>
									</div>
								</div>
								<!-- end of card-header -->

								<!-- card-body -->
								<div class="card-body">

									<form action="insertLectureList" id="insertLectureForm"
										method="post">
										<div class="table-responsive">
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
														<td><input type="text"
															class="form-control form-control-sm lectureNo" id=""
															name="list[0].lecture_rownum" value="1" readonly></td>
														<td><input type="text"
															class="form-control form-control-sm lectureName" id=""
															name="list[0].lecture_name" value=""></td>
														<td><input type="text"
															class="form-control form-control-sm lectureDetail" id=""
															name="list[0].lecture_detail"
															value=""></td>
														<td><div
																class="btn btn-sm btn-secondary btnDeleteLecture">
																<i class="fa-solid fa-xmark" style="color: #ffffff;"></i>
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- end of table-responsive -->
									</form>
									<!-- end of form -->

									<div class="row">
										<div class="col">
											<div id="btnAddLecture"
												class="btn btn-sm border-primary btn-block">
												<i class="fa-solid fa-plus" style="color: #4e73df;"></i>
											</div>
										</div>
									</div>

								</div>
								<!-- end of card-body -->
							</div>
						</div>
					</div>
					<!-- end of 교육과정 등록 -->

					<!-- 하단 버튼 -->
					<div class="row mb-5">
						<div class="col-2">
							<a href="#" class="btn btn-secondary btn-block"><span
								class="text">취소</span></a>
						</div>

						<div class="col-8"></div>

						<div class="col-2">
							<div id="btnCourseInsert" class="btn btn-primary btn-block">
								<span class="text">등록</span>
							</div>
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
	<script type="text/javascript" src="/resources/js/system/sys_courseInsert.js"></script>
	<script type="text/javascript" src="/resources/js/system/sys_timePicker.js"></script>

	<!-- timepicker -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

	<!-- Jstree -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

</body>
</html>