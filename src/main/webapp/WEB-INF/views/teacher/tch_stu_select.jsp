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

<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link href="../resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

</script>

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

				<!-- Begin Page Content - 네비게이터 등 기본 frame 빼고 다 여기 들어감 -->
				<div class="container container-fluid">



  			<h1>강사가 수강생 조회 하는 곳입니다</h1>
  			
  							</div> <!-- end of comtainer-fluid -->
			</div> 	<!-- Main content 여기서 끝남 -->
		</div> 	<!-- Content Wrapper 여기서 끝남 -->
	</div>	<!-- Page Wrapper 여기서 끝남 -->

	<!-- Bootstrap core JavaScript-->
    <script src="/resources/static/vendor/jquery/jquery.min.js"></script>
<script	src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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