<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>comm_insertMessage.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
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

					<h1>쪽지 보내기</h1>
					<hr>
					<!--  enctype="multipart/form-data" -->
					<form action="saveMessage.do" method="post">

						<div class="row">
							<div class="col-6">
								<div class="row mb-3">
									<div class="col-3">
										<div class="text">받는 사람</div>
									</div>
									<div class="col-9">
										<input class="form-control form-control-sm" name="msg_reciver">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-3">
										<div class="text">제 목</div>
									</div>
									<div class="col-9">
										<input class="form-control form-control-sm" name="msg_title">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-3">
										<div class="text">내 용</div>
									</div>
									<div class="col-9">
										<textarea class="form-control form-control-sm"
											name="msg_context" style="height: 525px;"></textarea>
									</div>
								</div>
								<!-- end of 내용 -->
								
								<div class="row">
									<div class="col-4">
										<a href="comm_getMessageList.do" class="btn btn-secondary btn-block">쪽지함</a>
									</div>
									<div class="col-4"></div>
									<div class="col-4">
										<input type="submit" value="전송" class="btn btn-primary btn-block" />
									</div>
								</div>
								

							</div>
							<div class="col-6"></div>
						</div>
						<!-- end of class row -->
					</form>
					
				</div>
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

	<!-- 개인 추가 .js : 한국인 -->
	<script src="/resources/js/common/comm_messageList.js"></script>

</body>
</html>