<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>쪽지 상세</title>

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
	font-family: 'Noto Sans KR', sans-serif
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
//각 쪽지 항목 클릭 시 상세 페이지로 이동
// document.addEventListener("comm_getMessage.do", function() {
// 	const rows = document.querySelectorAll('.tbody_board tr');
// 	rows.forEach(row => {
// 		row.addEventListener('click', function() {
// 			const messageId = this.getAttribute('data_id');
// 			// 예시: 상세 페이지 URL로 이동 (messageId를 URL 쿼리 파라미터로 전달)
// 			window.location.href = `../common/comm_getMessage?seq= ${msg_no}`;
// 		}); 	// end of row
// 	});  // end of forEach
// });		// end of document  
//});
  


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

				<!-- Begin Page Content -->
				<div class="container container-fluid">


					<h1>쪽지 상세</h1>
					<hr>

					<!-- Form to get message -->
					<form action="comm_getMessage.do" method="post">
						<!-- Hidden field for message sequence number -->
						<input name="seq" type="hidden" value="${message.msg_no}" />
						<table border="1" cellpadding="0" cellspacing="0">
							<tr>
								<td bgcolor="#557de1" style="color: white;">수신인</td>
								<td align="left"><input name="msg_reciver" type="text"
									value="${message.reciver_name}" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">발신인</td>
								<td align="left"><input name="msg_sender" type="text"
									value="${message.sender_name}"/></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">제목</td>
								<td align="left"><input name="msg_title" type="text"
									value="${message.msg_title}" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">내용</td>
								<td align="left"><textarea name="msg_context" cols="50"
										rows="20">${message.msg_context}</textarea></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">보낸일시</td>
								<td align="left">${message.msg_date}</td>
							</tr>
						</table>
					</form>

					<hr>
					<!-- Links for other actions -->
					<div class="row mb-5">
						<!-- <div class="col-6"> -->
						<div class="col-2">
							<a href="comm_deleteMessage.do?msg_no=${message.msg_no}"
								class="btn btn-secondary btn-block"><span class="text">쪽지삭제</span></a>
						</div>
						
						<div class="col-2">
							<a href="comm_getMessageList.do"
								class="btn btn-success btn-block"><span class="text">목록가기</span></a>
						</div>
						
						<div class="col-2">
							<a href="comm_insertMessage.do" class="btn btn-primary btn-block"><span
								class="text">쪽지쓰기</span></a>
						<!-- </div> -->
						</div>
					</div>  <!-- end of row -->

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

	
</body>
</html>