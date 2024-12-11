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

<title>stu_grade.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
   * {
      font-family: 'Noto Sans KR', sans-serif;
   }
   
   
   #scoreTrendChart{
   	border: 1px solid primary;
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
					<!-- userNo 번호값 넘어오는 것 저장하기 위한 숨겨진 input. -->
    				<input type="hidden" id="userNo" name="userNo" value="${userNo}">
    				<%-- <input type="hidden" id="userNo" name="userNo" value="${param.userNo}"> --%>

					<!-- 페이지 명 -->
					<h5 class="h3 mb-4 text-gray-800">[학생]성적 조회</h5>
					
					<!-- 시험 응시 연도 조회 -->
                    <div class="row">
				        <div class="col">
				            <div class="card shadow mb-4">
				                <div class="card-header py-3">
				                    <h6 class="m-0 font-weight-bold text-primary">응시 연도 조회</h6>
				                </div>
				                <div class="card-body">
				                    <!-- 응시 연도 DB에서 값 가져와서 Dropdown item 으로 출력. -->
				                    <select id="yearsDropdown" class="form-control">
								        <option value="">응시 년도 선택</option>
										<!-- 여기 출력됨 -->
								    </select>
				                </div>
				            </div>
				        </div>
				    </div><!-- end of 시험 응시 연도 조회 -->
					
					<!-- 시험 정보 출력 박스 -->
                    <div class="row">
                        <!-- 시험 정보 테이블 표시단 -->
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">시험 성적 목록</h6>
                                </div>
                                <!-- 시험 정보 tbl 출력할 단 -->
                                <div class="card-body">
                                <div id="gradeTableContainer" style="display: none;">
                                    <table class="table table-bordered" id="gradeTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>시험 ID</th>
                                                <th>시험 이름</th>
                                                <th>학생 이름</th>
                                                <th>원점수</th>
                                                <th>시험 날짜</th>
                                                <th>상세 보기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										    <c:forEach var="grade" items="${gradeList}">
										        <tr>
										            <td>${grade.exam_no}</td>
										            <td>${grade.exam_name}</td>
										            <td>${grade.user_name}</td>
										            <td>${grade.original_score}</td>
										            <td>${grade.exam_date}</td>
										            <td>
										                <a href="stu_grade_details.do?exam_no=${grade.exam_no}&user_no=${userNo}" class="btn btn-info btn-sm">상세 보기</a>
										            </td>
										        </tr>
										    </c:forEach>
										</tbody>
                                    </table>
                                    </div> <!-- end of gradeTableContainer -->
                                </div>
                            </div>
                        </div> <!-- end of col -->
                    </div> <!-- end of row - 시험정보 출력단 끝 -->

                    <!-- 시험 성적 추이 그래프 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">시험 성적 추이</h6>
                                </div>
                                <div class="card-body chart-area" id="chartContainer" style="display: none;">
                                    <canvas id="scoreTrendChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of 시험 점수 추이 그래프 -->
                    
                    <div class="row"> <!-- stu_gradeInsert.jsp 로 넘어가는 버튼 -->
                    	<div class="col-10"></div>
						<div class="col-2">
							<a href="stu_gradeInsert.do?userNo=${userNo}" class="btn btn-primary btn-icon-split btn">
								<span class="icon text-white-50">
									<i class="fas fa-arrow-up"></i>
								</span>
								<span class="text">성적 입력</span>
							</a>
						</div>
					</div> <!-- end of stu_gradeInsert.jsp btn -->
                    
				</div> <!-- end of container-fluid-->
			</div> <!-- end of content -->
 		<!-- Bootstrap core JavaScript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha384-ZvpUoO/+PpGGQbYFv8N5+bscp8Jf5lft2wh7USc+zso=Z" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0jXg5J9aF9s92BByzICLgSkjzv66AqxEq1Yg2QsZqaQF0J5F" crossorigin="anonymous"></script>

        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="resources/static/js/sb-admin-2.min.js"></script></div> <!-- end of wrapper -->

		<!-- Bootstrap core JavaScript-->
		<script src="resources/static/vendor/jquery/jquery.min.js"></script>
		<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="resources/static/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="resources/static/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="resources/static/js/demo/chart-area-demo.js"></script>
		<script src="resources/static/js/demo/chart-pie-demo.js"></script>
		
		<!-- stu_grade js -->
		<script type="text/javascript" src="resources/js/student/stu_grade.js"></script>

	</div> <!-- end of wrapper -->
</body>
</html>