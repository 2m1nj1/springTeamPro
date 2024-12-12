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
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/css/system.css" rel="stylesheet">
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
				
				<!-- 결제창 -->
				<div class="coruseRegiFooter d-flex justify-content-center">
					<div class="courseRegiPay shadow">
						<div class="row">
							<div class="col d-flex justify-content-center">
							 	<span class="text text-light">선택강좌 </span>
							 	<span class="text text-light cntChkCourse"> 0</span>
							 	<span class="text text-light">개</span>
							</div>
							<div class="col">
							 	<span class="text text-light">n</span>
							 	<span class="text text-light">원</span>
							</div>
							<div class="col">
							 	<div id="btnCourseRegiPay" class="btn btn-light">
							 		<span class="text text-primary">결제하기</span>
							 	</div>
							</div>
						</div>
					</div>
				</div>
					
				<!-- Begin Page Content -->
				<div class="container container-fluid">
				
					
					
					<div class="row">
						<div class="col">
							<div id="courseConGrade" class="card shadow mb-3 courseConCard">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary ">학년</h6>
								</div>
								<div class="card-body">
									<div class="row courseConItem courseConGrade">
										<div class="col">
											<input type="hidden" value="0"/>
											<span class="text">전체</span>
										</div>
									</div>
									<c:forEach var="item" items="${courseConGrade}">
										<div class="row courseConItem courseConGrade">
											<div class="col">
												<input type="hidden" value="${item.course_cate_no}"/>
												<span class="text">${item.course_cate_name}</span>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col">
							<div id="courseConArea" class="card shadow mb-3 courseConCard">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary ">영역</h6>
								</div>
								<div class="card-body"></div>
							</div>
						</div>
						<div class="col">
							<div id="courseConSubject" class="card shadow mb-3 courseConCard">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary ">과목/주제별</h6>
								</div>
								<div class="card-body"></div>
							</div>
						</div>
						<div class="col">
							<div id="courseConTch" class="card shadow mb-3 courseConCard">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary ">강사</h6>
								</div>
								<div class="card-body"></div>
							</div>
						</div>
					</div>
					<!-- end of row -->
					
					
					<div class="row">
						<div class="col">
							<div class="card shadow mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<span class="text text-primary cntChkCourse">0</span>
											<span class="text">강좌선택&nbsp;/&nbsp;</span>
											<span class="text">총 </span>
											<span id="cntConCourseList" class="text text-primary">${courseInfoListSize} </span>
											<span class="text">강좌</span>
										</div>
									</div>
									<hr/>
									
									<div id="conCourseList">
										<!-- 강좌 1개 틀 -->
										<c:forEach var="item" items="${courseInfoList}">
										<div class="row">
											<div class="col-1 d-flex justify-content-center">
												<input type="checkbox" class="chkCourseRegi">
												<input type="hidden" value="${item.course_no}">
											</div>
											<div class="col-1 d-flex justify-content-center align-items-center">
													<span class="text">${item.course_cate_name}</span>
											</div>
											<div class="col-1 d-flex justify-content-center align-items-center">
												<span class="text">${item.course_instructor}</span>
											</div>
											<div class="col-5">
												<div class="row">
													<div class="col">
														<h6 class="font-weight-bold text-primary" style="display: inline;">${item.course_name}</h6>
													</div>
												</div>
												<hr/>
												<div class="row">
													<div class="col">
														<span class="text">강좌 기간 : ${item.course_startDate}</span>
														<span class="text"> ~ ${item.course_endDate}&nbsp;|&nbsp;</span>
														<span class="text">${item.course_fee} 원</span>
													</div>
												</div>
											</div>
											<div class="col-1 d-flex justify-content-center align-items-center">
												<span class="text">${item.course_person}</span>
											</div>
											<div class="col-2 d-flex justify-content-center align-items-center flex-column">
												<c:forEach var="schList" items="${item.course_sch_list}">
													<div class="row">
														<div class="col text-center">
															<span class="text">${schList}</span>
														</div>
													</div>
												</c:forEach>
											</div>
											<div class="col-1 d-flex justify-content-center align-items-center">
												<div class="btn btn-primary">담기</div>
											</div>
										</div>
										<hr/>
										</c:forEach>
										<!-- end of 강좌 1개 틀 -->
									</div>
									<!-- end of ConList -->
								</div>
							</div>
						</div>
					</div>
					<!-- end of row -->
					
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
		<script type="text/javascript" src="/resources/js/system/courseRegi.js"></script>
		
		
</body>
</html>