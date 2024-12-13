<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>tch_homeworkList.jsp</title>

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
//목록 항목 클릭 시 상세 폼에 데이터 채우기
function fillHomeworkDetails(homework) {
    // 폼 필드에 데이터 채우기
    document.querySelector('input[name="hw_course"]').value = homework.hw_course;
    document.querySelector('input[name="hw_title"]').value = homework.hw_title;
    document.querySelector('textarea[name="hw_context"]').value = homework.hw_context;
    document.querySelector('input[name="hw_startdate"]').value = homework.hw_startdate;
    document.querySelector('input[name="hw_enddate"]').value = homework.hw_enddate;
    document.querySelector('input[name="upload_location"]').value = homework.upload_location;
    document.querySelector('input[name="hw_no"]').value = homework.hw_no; // hidden field에 과제 번호 채우기
}

// 각 과제 목록 항목에 클릭 이벤트 추가
document.addEventListener("DOMContentLoaded", function() {
    // 모든 과제 제목에 대해 클릭 이벤트 추가
    const homeworkRows = document.querySelectorAll('#homeworkTable tr');
    
    homeworkRows.forEach(row => {
        row.addEventListener('click', function(event) {
            const homework = {
                hw_no: row.dataset.hw_no,         // 과제 번호
                hw_course: row.dataset.hw_course, // 강좌 번호
                hw_title: row.dataset.hw_title,   // 과제 제목
                hw_context: row.dataset.hw_context, // 과제 내용
                hw_startdate: row.dataset.hw_startdate, // 과제 시작일
                hw_enddate: row.dataset.hw_enddate, // 과제 마감일
                upload_location: row.dataset.upload_location // 첨부 파일 위치
            };
            	
            	event.preventDefault();
            // 선택된 과제의 정보를 폼에 채우기
            fillHomeworkDetails(homework);
        });
    });
});
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
			
				<!-- 아코디언으로 만들고 싶었으나 기존탭 응용해서 대체 -->				
				<form action="tch_insertHomework.do" method="post">
					<!-- tab -->
					<div class="card shadow mb-4">
						<div class="card-body" id="tch_hom_tab">
							<!-- 탭 버튼 -->
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#tab_msg_recive">과제 목록</a></li>
								<!-- <li class="nav-item"><a class="nav-link"
									href="#tab_msg_send">보낸 과제</a></li> -->
							</ul>

							<!-- 탭 내용 -->
							<div class="tab-content">
								<div class="tab-pane active" id="tab_hom_work">
									<table class="table table_bordered">
										<thead>
											<tr>
												<!-- 체크박스 전체 선택 -->
												<th><input type="checkbox" class="checkbox_all"></th>
												<th>과제명</th>
												<th>제출자 번호</th>
												<th>제출자 이름</th>
												<th>제출일</th>
												<th>분류번호</th> 
											</tr>
										</thead>
										<tbody class="tbody_board" id="homeworkTable">
											<!-- 과제 목록을 반복문으로 출력 -->
											<c:forEach var="homework" items="${homeworkList}">
												<tr data-hw_no="${homework.hw_no}"
      											  	data-hw_course="${homework.hw_course}"
      												data-hw_title="${homework.hw_title}"
      												data-hw_context="${homework.hw_context}"
        											data-hw_startdate="${homework.hw_startdate}"
        											data-hw_enddate="${homework.hw_enddate}"
        											data-upload_location="${homework.upload_location}">
													<td><input type="checkbox" class="checkbox"></td>
													<td><a href="javascript:void(0);" class="homework-title" 
													data-hw_no="${homework.hw_no}">${homework.hw_title}</a></td>
													<td>${homework.user_no}</td> 
													<td>${homework.user_name}</td>
													<td>${homework.hw_enddate}</td> 
													<td>${homework.service_no}</td> 
												</tr>
											</c:forEach> 
										</tbody>
									</table>
								</div>
							</div> <!-- end of content -->
						</div> <!-- end of body -->
					</div> <!-- end of card -->
				</form>
				
				<hr>
				<h1 class="h3 mb-4 text-gray-800">과제 상세</h1>
				<hr>
				
				<!-- Form to get message -->
					<form action="../tch_insertHomework.do" method="post">
						<!-- Hidden field for message sequence number -->
						<input name="hw_no" type="hidden" value="${homework.hw_no}" />
						<table border="1" cellpadding="0" cellspacing="0">
							<tr>
								<td bgcolor="#557de1" style="color: white;">강좌번호</td>
								<td align="left"><input name="hw_course" type="text" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">과제 제목</td>
								<td align="left"><input name="hw_title" type="text" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">과제 내용</td>
								<td align="left"><textarea name="hw_context" cols="40" 
									rows="20"></textarea></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">과제 시작일</td>
								<td align="left"><input name="hw_startdate" type="text" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">과제 마감일</td>
								<td align="left"><input name="hw_enddate" type="text" /></td>
							</tr>
							<tr>
								<td bgcolor="#557de1" style="color: white;">첨부 파일</td>
								<td align="left"><input name="upload_location" type="file" /></td>
							</tr>
						</table>
							<!-- 등록 버튼 -->
                       <button  align="right" type="submit" class="btn btn-primary" >과제 등록</button>
					</form>
			    		
		
			</div>  <!-- end of content -->
		</div>	<!-- end of content-wrapper -->
	</div>	<!-- end of wrapper -->

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
	<script src="/resources/js/comm/tch_homework.js"></script>

</body>
</html>