<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>comm_getMessageList.jsp</title>

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

				<!-- 여기부터 페이지에 들어갈 내용 -->
				<div class="container container-fluid">

					<!-- 페이지명 -->
					<h1 class="h3 mb-4 text-gray-800">쪽지 목록</h1>


					<!-- tab -->
					<div class="card shadow mb-4">
						<div class="card-body" id="com_msg_tab">
							<!-- 탭 버튼 -->
							<ul class="nav nav-tabs tab-wrap">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page">받은 쪽지함</a></li>
								<li class="nav-item"><a class="nav-link">보낸 쪽지함</a></li>
							</ul>

							<!-- 탭 내용 -->
							<div class="tab-content">
								<div class="tab-pane active" id="tab_msg_recive">
									<table class="table table_bordered">
										<thead>
											<tr>
												<!-- 체크박스 전체 선택 -->
												<th><input type="checkbox" class="checkbox_all"></th>
												<th>보낸 사람</th>
												<th>제 목</th>
												<th>날 짜</th>
											</tr>
										</thead>
										<tbody class="tbody_board" id="receivedMessagesTable">
											<!-- 받은 쪽지 목록을 반복문으로 출력 -->
											<c:forEach var="reciveMessage" items="${reciveMessageList}">
												<tr data_id="1">
													<td><input type="checkbox" class="checkbox"></td>
													<td>${reciveMessage.sender_name}</td>
													<td><a href="comm_getMessage.do?msg_no=${reciveMessage.msg_no}">${reciveMessage.msg_title}</a></td>
													<td>${reciveMessage.msg_date}</td> 
													<%-- <td><fmt:formatDate value="${reciveMessage.msg_date}"
															pattern="yyyy-MM-dd" /></td> --%> 
												</tr>
											</c:forEach> 
										</tbody>
									</table>

								</div>

								<div class="tab-pane" id="tab_msg_send">
									<table class="table table_bordered">
										<thead>
											<tr>
												<th><input type="checkbox" class="checkbox_all"></th>
												<th>받은 사람</th>
												<th>제 목</th>
												<th>날 짜</th>
											</tr>
										</thead>
										<tbody class="tbody_board" id="sentMessagesTable">

											<!-- 보낸 쪽지 목록을 반복문으로 출력 -->
											<c:forEach var="sendMessage" items="${sendMessageList}">
												<tr data_id="2">
													<td><input type="checkbox" class="checkbox"></td>
													<td>${sendMessage.reciver_name}</td>
													<td><a href="comm_getMessage.do?msg_no=${sendMessage.msg_no}">${sendMessage.msg_title}</a></td>
													<td>${sendMessage.msg_date}</td>
													<%-- <td><fmt:formatDate value="${sendMessage.msg_date}"
															pattern="yyyy-MM-dd" /></td> --%>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- end of card -->

					<div class="row">
						<div class="col-2">
							<%-- <a href="comm_deleteMessage.do?msg_no=${message.msg_no}"
								class="btn btn-secondary btn-block"><span class="text">쪽지삭제</span></a> --%>
						</div>

						<div class="col-8"></div>

						<div class="col-2">
							<a href="comm_insertMessage.do" class="btn btn-primary btn-block"><span
								class="text">쪽지쓰기</span></a>
						</div>
					</div>
					<!-- end of class row -->
				</div>
			</div>
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

	<!-- 개인 추가 .js : 한국인 -->
	<script src="/resources/js/comm/comm_messageList.js"></script>
	
	<!-- tab -->
	<script src="/resources/js/system/sys_tab.js"></script>
	
</body>
</html>