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
					<h1 class="h3 mb-4 text-gray-800">강사 등록</h1>


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
									<form action="tchInsert.do" id="tchInsertForm"
										method="post">
										
									<div class="row">
										<!-- 프로필 이미지 출력 -->
										<div class="col-3">
											<div>
												<div class="card mb-4" style="height:200px">
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
													<input type="text" class="form-control form-control-sm"
														id="user_id" name="user_id" value="${teacher.user_id}">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">회원번호</label>
												<div class="col-sm-8">
													<input type="text" readonly class="form-control form-control-sm"
														id="user_no" name="" value="${teacher.user_no}">
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
													<label class="col-sm-4 col-form-label">비밀번호</label>
													<div class="col-sm-8">
														<input type="password" class="form-control form-control-sm"
															id="user_pass" name="user_pass" value="${teacher.user_pass}">
													</div>
												</div>
												
												<div class="row">
													<label class="col-sm-4 col-form-label">이메일</label>
													<div class="col-sm-4">
															<input type="text" class="form-control form-control-sm"
																id="user_email_id" name="user_email_id"
																value="">
													</div>
													<div class="col-sm-4">
														<select class="custom-select custom-select-sm" name="user_email_domain">
															<option value="">이메일 선택</option>
															<c:forEach var="item" items="${emailDomainList}">
																<option value="${item.domain_name}">${item.domain_name}</option>
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



							<!-- 하단 버튼 -->
							<div class="row mb-5">
								<div class="col-2">
									<div id="btnInsertCancel" class="btn btn-secondary btn-block btnModal">
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