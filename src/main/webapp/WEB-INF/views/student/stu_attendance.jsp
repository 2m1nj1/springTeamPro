<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>출결 조회 페이지</title>

    <!-- Bootstrap & Custom Fonts -->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="resources/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Custom Styles -->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
</head>
<body id="page-top">

<!-- Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/resources/include/menu_tab.jsp">
        <jsp:param name="pageName" value="menuTab"/>
    </jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <jsp:include page="/resources/include/top_bar.jsp">
                <jsp:param name="pageName" value="topBar"/>
            </jsp:include>

            <!-- Page Content -->
            <div class="container container-fluid">
            	<!-- hidden input - 사용자 번호 넘어옴. -->
            	<input type="hidden" id="userNo" name="userNo" value="${userNo}">
                <!-- Page Heading -->
                <h5 class="h3 mb-4 text-gray-800">[학생] 출결 조회 페이지</h5>

                <!-- 출석기록 출력 단. -->
				<div class="row">
				    <div class="col">
				        <div class="card shadow mb-4">
				            <div class="card-header py-3">
				            	<!-- 카드 제목 위치 -->
				                <h6 class="m-0 font-weight-bold text-primary">출석 목록</h6>
				                
				                <!-- 특정 날짜의 출석 목록만 뜨게끔 설정해 줘야 하여 해 줌. - Date Range Picker -->
							    <div class="d-flex justify-content-start mb-3">
							        <div class="mr-3">
							            <label for="startDate">시작 날짜:</label>
							            <input type="date" id="startDate" class="form-control">
							        </div>
							        <div>
							            <label for="endDate">종료 날짜:</label>
							            <input type="date" id="endDate" class="form-control">
							        </div>
							        <div class="ml-3 align-self-end col-2">
							            <button id="filterButton" class="btn btn-primary">필터</button>
							        </div>
							        
							        <select id="courseDropdown" class="form-control">
								        <option value="">수강중인 강좌 선택</option>
								        <c:forEach var="course" items="${ongoingCourses}">
								            <option value="${course.course_no}">${course.course_name}</option>
								        </c:forEach>
								    </select>
								<input type="hidden" id="userNo" value="${userNo}" /> <!-- userNo 를 hidden 으로 던져줌. -->
							    </div>
				            </div>
				            
				            <div class="card-body">
				            	<!-- 출석 기록부 tbl -->
				                <div id="attendance-list" class="container container-fluid table-responsive">
				                	<!-- tbl 여기에 반응형으로 추가될 예쩡. - 출석 기록 전체 출력. -->
				                </div>
				            </div>
				        </div>
				    </div>
				</div>

                <!-- Pagination - 페이징 -->
                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                            <!-- dynamically(동적으로) 페이징 추가 -->
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-7">
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                            <ul class="pagination" id="pagination">
                                <!-- dynamically(동적으로) 페이징 버튼 추가 -->
                            </ul>
                        </div>
                    </div> <!-- end of class="col-sm-12 col-md-7" -->
                </div> <!-- end of class="row", where is pagination -->
            </div> <!-- end of class="container-fluid" -->
        </div> <!-- end of class="content" -->
    </div> <!-- end of class="Content-wrapper" -->
</div> <!-- end of class="wrapper" -->

<!-- Bootstrap JS and Plugins -->
<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="resources/static/js/sb-admin-2.min.js"></script>
<script src="resources/static/vendor/chart.js/Chart.min.js"></script>
<script src="resources/static/js/demo/chart-area-demo.js"></script>
<script src="resources/static/js/demo/chart-pie-demo.js"></script>

<!-- Attendance Handling Script -->
<!-- stu_attendance.jsp js -->
<script type="text/javascript" src="resources/js/student/stu_attendance.js"></script>

</body>
</html>