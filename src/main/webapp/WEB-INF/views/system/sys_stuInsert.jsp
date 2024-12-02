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

					<!-- 페이지 명 -->
					<h1 class="h3 mb-4 text-gray-800">수강생 등록</h1>


					<!-- 수강생 개인 정보 -->
					<div class="row ">

						<!-- 개인정보 -->
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">수강생 개인정보</h6>
								</div>

								<div class="card-body">
										
									<!-- form -->
									<form action="stuInsert.do" id="stuInsertForm" method="post">

										<div class="row">

											<!-- 프로필 이미지 출력 -->
											<div class="col-3">
												<div>
													<div class="card mb-4">
														<div class="card-body">프로필사진이 여기에 뜹니다~</div>
													</div>
												</div>

												<!-- 프로필 이미지 삭제/등록 버튼 -->
												<div class="row">
													<div class="col">
														<a href="#" class="btn btn-secondary btn-block"><span
															class="text">삭제</span></a>
													</div>
													<div class="col">
														<a href="#" class="btn btn-primary btn-block"><span
															class="text">등록</span></a>
													</div>
												</div>
											</div>

											<!-- left -->
											<div class="col-4">
												<div class="row">
													<label class="col-sm-4 col-form-label">아이디</label>
													<div class="col-sm-8">
														<input type="text"
															class="form-control form-control-sm" id="user_id"
															name="user_id" value="">
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">회원번호</label>
													<div class="col-sm-8">
														<input type="text"
															class="form-control form-control-sm" id="user_no"
															name="" value="" readonly>
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">이름</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="user_name" name="user_name"
															value="">
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">성별</label>
													<div class="col-sm-8">
														<div class="input-group">
															<select class="custom-select custom-select-sm" name="user_gender">
																<option value="">성별을 선택해주세요.</option>
																<option value="m">남</option>
																<option value="f">여</option>
															</select>
														</div>

													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">개인 연락처</label>
													<div class="col-sm-8">
														<input type="tel" class="form-control form-control-sm"
															id="user_tel" name="user_tel" value="">
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">보호자 연락처</label>
													<div class="col-sm-8">
														<input type="tel" class="form-control form-control-sm"
															id="user_parent_tel" name="user_parent_tel"
															value="">
													</div>
												</div>

											</div>
											<!-- end of left -->

											<!-- right -->
											<div class="col-5">
												<div class="col">
													<div class="row">
														<label class="col-sm-3 col-form-label">비밀번호</label>
														<div class="col-sm-9">
															<input type="password"
																class="form-control form-control-sm" id="user_pass"
																name="user_pass" value="">
														</div>
													</div>
													<div class="row">
														<label class="col-sm-3 col-form-label">이메일</label>
														<div class="col-sm-4">
															<input type="text" class="form-control form-control-sm"
																id="user_email" name="user_email"
																value="">
														</div>
														<div class="col-sm-5">
															<select class="custom-select custom-select-sm" name="user_grade">
																<option value="">이메일 선택</option>
																<option value="1">@naver.com</option>
																<option value="2">@hanmail.net</option>
																<option value="3">@gmail.com</option>
															</select>
														</div>
													</div>
													<div class="row">
														<label class="col-sm-3 col-form-label">주소</label>
														<div class="col-sm-9">
															<input type="text" class="form-control form-control-sm"
																id="user_addr1" name="user_addr1"
																value="">
														</div>
													</div>
													<div class="row mb-sm-2">
														<label class="col-sm-3 col-form-label"></label>
														<div class="col-sm-9">
															<input type="text" class="form-control form-control-sm"
																id="user_addr2" name="user_addr2"
																value="">
														</div>
													</div>
													<div class="row">
														<label class="col-sm-3 col-form-label">생년월일</label>
														<div class="col-sm-9">
															<input type="date" class="form-control form-control-sm"
																id="user_birthday" name="user_birthday"
																value="">
														</div>
													</div>
													<div class="row">
														<label class="col-sm-3 col-form-label">등록날짜</label>
														<div class="col-sm-9">
															<input type="text" class="form-control form-control-sm"
																id="user_signupdate" name="user_signupdate"
																value="" readonly>
														</div>
													</div>
													<div class="row">
														<label class="col-sm-3 col-form-label">학교/학년</label>
														<div class="col-sm-5">
															<input type="text" class="form-control form-control-sm"
																id="user_school" name="user_school"
																value="">
														</div>
														<div class="col-sm-4">
															<select class="custom-select custom-select-sm" name="user_grade">
																<option value="">---</option>
																<option value="1">1학년</option>
																<option value="2">2학년</option>
																<option value="3">3학년</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<!-- end of right -->
										</div>
										<!-- end of row -->
									</form>
									<!-- end of form -->
								</div>
								<!-- end of card body -->
							</div>
							<!-- end of card -->

							<!-- tab -->
							<div class="card shadow mb-4">
								<div class="card-body" id="sys_stu_tab">
									<!-- 탭 버튼 -->
									<ul class="nav nav-tabs tab-wrap">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page">수강 중인 강좌</a></li>
										<li class="nav-item"><a class="nav-link">시간표</a></li>
										<li class="nav-item"><a class="nav-link">성적</a></li>
										<li class="nav-item"><a class="nav-link">과제</a></li>
										<li class="nav-item"><a class="nav-link">프로필</a></li>
									</ul>

									<!-- 탭 내용 -->
									<div class="tab-content">
										<div class="tab-pane active" id="tab_stu_lecture">
											<jsp:include page="../table/com_course_table.jsp">
												<jsp:param name="pageName" value="stu_lectures" />
											</jsp:include>
										</div>
										<div class="tab-pane" id="tab_stu_timetable">
											<jsp:include page="../table/com_timetable_table.jsp">
												<jsp:param name="pageName" value="stu_timetable" />
											</jsp:include>
										</div>
										<div class="tab-pane" id="tab_stu_grade">
											<jsp:include page="../table/stu_grade_table.jsp">
												<jsp:param name="pageName" value="stu_grade" />
											</jsp:include>
										</div>
										<div class="tab-pane" id="tab_stu_homework">
											<jsp:include page="../table/stu_homework_table.jsp">
												<jsp:param name="pageName" value="stu_homework" />
											</jsp:include>
										</div>
										<div class="tab-pane" id="tab_stu_profile">
											<jsp:include page="../table/com_profile_table.jsp">
												<jsp:param name="pageName" value="stu_profile" />
											</jsp:include>
										</div>
									</div>
								</div>
							</div>
							<!-- end of tab -->

							<!-- 하단 버튼 -->
							<div class="row">
								<div class="col-2">
									<div id="#" class="btn btn-secondary btn-block btnModal">
										<span class="text">취소</span>
									</div>
								</div>

								<div class="col-8"></div>

								<div class="col-2">
									<div id="btnInsert" class="btn btn-primary btn-block">
										<span class="text">등록</span>
									</div>
								</div>
							</div>
							<!-- end of 하단 버튼 -->
							
						
							

						</div>
						<!-- end of col -->
					</div>
					<!-- end of row  -->


				</div>
				<!-- end of container-fluid -->
			</div>
			<!-- end of content -->

		</div>
		<!-- end of content-wrapper -->
	</div>
	<!-- end of wrapper -->

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
		<script type="text/javascript" src="/resources/js/system/sys_stu.js"></script>
		<script type="text/javascript" src="/resources/js/system/sys_main.js"></script>
</body>
</html>