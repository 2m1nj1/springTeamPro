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

<title>교담 - 관리자</title>

<!-- Custom fonts for this template-->
<link href="/resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
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
				<div class="container-fluid">

					<!-- 페이지 명 -->
					<h1 class="h3 mb-4 text-gray-800">강사상세</h1>


					<!-- 수강생 개인 정보 -->
					<div class="row ">


						<!-- 개인정보 -->
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">강사 개인정보</h6>
								</div>
								<div class="card-body">
								
									<!-- form -->
									<form action="tchDetailUpdate.do" id="tchDetailForm"
										method="post">
										
									<div class="row">
										<!-- 프로필 이미지 출력 -->
										<div class="col-3">
											<div>
												<div class="card mb-4">
													<div class="card-body">
														<img src="/resources/img/profile_default.png" alt="이미지 설명">
													</div>
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
												<label class="col-sm-4 col-form-label">회원번호</label>
												<div class="col-sm-8">
													<input type="text" readonly class="form-control-plaintext"
														id="user_no" name="user_no" value="${teacher.user_no}">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">이름</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="user_name" name="user_name" value="${teacher.user_name}">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">성별</label>
												<div class="col-sm-8">
													<div class="input-group">
														<select class="custom-select custom-select-sm" name="user_gender">
															<option value=""
																<c:if test="${empty teacher.user_gender}">selected</c:if>>성별을
																선택해주세요.</option>
															<option value="m"
																<c:if test="${teacher.user_gender eq 'm'}">selected</c:if>>남</option>
															<option value="f"
																<c:if test="${teacher.user_gender eq 'f'}">selected</c:if>>여</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">연락처</label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														id="user_tel" name="user_tel" value="${teacher.user_tel}">
												</div>
											</div>

										</div>

										<div class="col-5">

											<!-- right -->
											<div class="col">
												<div class="row">
													<label class="col-sm-4 col-form-label">이메일</label>
													<div class="col-sm-4">
														<input type="text" class="form-control form-control-sm"
															id="user_email_id" name="user_email_id"
															value="${teacher.user_email_id}">
													</div>
													<div class="col-sm-4">
														<select class="custom-select custom-select-sm" name="user_email_domain">
															<option value="">이메일 선택</option>
															<c:forEach var="item" items="${emailDomainList}">
																<option value="${item.domain_name}"
																	<c:if test="${teacher.user_email_domain eq item.domain_name}">selected</c:if>>
																	${item.domain_name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">주소</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="user_addr1" name="user_addr1" value="${teacher.user_addr1}">
													</div>
												</div>
												<div class="row mb-sm-2">
													<label class="col-sm-4 col-form-label"></label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="user_addr2" name="user_addr2" value="${teacher.user_addr2}">
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">생년월일</label>
													<div class="col-sm-8">
														<input type="date" class="form-control form-control-sm"
															id="user_birthday" name="user_birthday" value="${teacher.user_birthday}">
													</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">계정생성일</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm" id="user_signupdate"
															name="user_signupdate" value="${teacher.user_signupdate}" readonly>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									</form>
								</div>
							</div>


							<!-- tab -->
<!-- 							<div class="card shadow mb-4"> -->
<!-- 								<div class="card-body" id="sys_stu_tab"> -->
<!-- 									탭 버튼 -->
<!-- 									<ul class="nav nav-tabs tab-wrap"> -->
<!-- 										<li class="nav-item"><a class="nav-link active" -->
<!-- 											aria-current="page">담당 강좌</a></li> -->
<!-- 										<li class="nav-item"><a class="nav-link">시간표</a></li> -->
<!-- 										<li class="nav-item"><a class="nav-link">프로필</a></li> -->
<!-- 									</ul> -->

<!-- 									탭 내용 -->
<!-- 									<div class="tab-content"> -->
<!-- 										<div class="tab-pane active" id="tab_tch_lecture"> -->
<%-- 											<jsp:include page="/WEB-INF/views/table/com_course_table.jsp"> --%>
<%-- 												<jsp:param name="pageName" value="tch_lectures" /> --%>
<%-- 											</jsp:include> --%>
<!-- 										</div> -->
<!-- 										<div class="tab-pane" id="tab_tch_timetable"> -->
<%-- 											<jsp:include page="/WEB-INF/views/table/com_timetable_table.jsp"> --%>
<%-- 												<jsp:param name="pageName" value="tch_timetable" /> --%>
<%-- 											</jsp:include> --%>
<!-- 										</div> -->
<!-- 										<div class="tab-pane" id="tab_tch_profile"> -->
<%-- 											<jsp:include page="/WEB-INF/views/table/com_profile_table.jsp"> --%>
<%-- 												<jsp:param name="pageName" value="tch_profile" /> --%>
<%-- 											</jsp:include> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- end of tab -->

							<!-- 하단 버튼 -->
							<div class="row">
								<div class="col-2">
									<div id="btnModal_tchDelete" class="btn btn-secondary btn-block btnModal">
										<span class="text">삭제</span>
									</div>
								</div>

								<div class="col-8"></div>

								<div class="col-2">
									<div id="btnSave" class="btn btn-primary btn-block">
										<span class="text">저장</span>
									</div>
								</div>
							</div>
							<!-- end of 하단 버튼 -->
							
							<!-- Modal : 삭제 확인 -->
							<div class="modal fade" id="modal_tchDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      	
							      	<div class="modal-body"> 
								      	<div class="row">
								      		<div class="col" style="padding: 50px; text-align: center;">
								      			<span class="text">'${teacher.user_name}' 님을 삭제하겠습니까?</span>
								      		</div>
								      	</div>
								      	
								      	<div class="row">
								      		<div class="col-3"></div>
								      		<div class="col-3">
								      			<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" value="${teacher.user_no}">취소</button>
								      		</div>
								      		<div class="col-3">
								      			<button id="btnDelete" type="button" class="btn btn-primary btn-block" value="${teacher.user_no}">삭제</button></div>
								      		</div>
								      		<div class="col-3"></div>
								      	</div>
							      	</div>
							  </div>
							</div>
							<!-- end of Modal : 삭제 확인 -->
							
						</div>
					</div>


				</div>
				<!-- end of container-fluid -->
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
	<script type="text/javascript" src="/resources/js/system/sys_tab.js"></script>
	<script type="text/javascript" src="/resources/js/system/sys_tch.js"></script>
	<script type="text/javascript" src="/resources/js/system/sys_main.js"></script>
	
</body>
</html>