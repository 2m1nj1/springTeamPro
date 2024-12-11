<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>stu_homework.jsp</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="resources/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .overlay {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0, 0, 0, 0.5);
		    z-index: 1000;
		    display: none; /* 초기 숨김 */
		}
		
		.popup {
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    background: white;
		    padding: 20px;
		    width: 60%;
		    max-width: 600px;
		    border-radius: 10px;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
		    z-index: 1100;
		    display: none; /* 초기 숨김 */
		}
		
		.hidden {
		    display: none;
		    opacity: 1;
		}
		
		input.form-control, textarea.form-control {
		    display: block;
		    width: 100%;
		    padding: 0.5rem;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    background-color: #fff;
		    color: #000;
		}
		
		.close-btn {
		    position: absolute;
		    top: 10px;
		    right: 15px;
		    background: none;
		    border: none;
		    font-size: 1.5rem;
		    color: #333;
		    cursor: pointer;
		}
		
		.close-btn:hover {
		    color: red;
		}
		
		/* Center the 닫기 button */
		.popup .btn-secondary {
		    width: 100px;
		    font-weight: bold;
		    text-align: center;
		}
    </style>

</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  
    <!-- Sidebar -->
    <jsp:include page="/resources/include/menu_tab.jsp">
        <jsp:param name="pageName" value="menuTab"/>
    </jsp:include>
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
        
        <!-- hidden input -->
		<input type="hidden" id="userNo" value="${userNo}">
    
            <!-- Topbar -->
            <jsp:include page="/resources/include/top_bar.jsp">
                <jsp:param name="pageName" value="topBar"/>
            </jsp:include>
            
            <!-- Begin Page Content -->
            <div class="container container-fluid">
                
                <!-- 페이지 명 -->
                <h5 class="h3 mb-4 text-gray-800">과제 제출 페이지</h5>
                
                	<!-- 출결 조회하려는 수강 중 강좌 선택 nav 바 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">수강중인 강좌 선택</h6>
                                </div>
                                <div class="card-body">
                                    <!-- 카테고리 드랍박스; 수강중인 강의 목록 가져와서 그에 대한 과제 표시토록 할 것임 -->
					                <select id="coursesDropdown" class="form-control">
								        <option value="">수강중인 강좌 선택</option>
								        <c:forEach var="course" items="${courses}">
								            <option value="${course.course_no}">${course.course_name} - ${course.instructor_name}</option>
								        </c:forEach>
								    </select>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end of 시험 응시 연도 조회 -->

                <!-- 과제 정보 출력 박스 -->
                <div class="row">
                    <!-- 과제 목록 출력 tbl -->
                    <div class="col">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">과제 목록</h6>
                            </div>
                            <!-- 과제 정보 tbl 출력 단 -->
                            <div class="card-body">
                            	<div class="assignment-list">
	                                <!-- 과제 카드들을 동적으로 추가할 div -->
	                                <div id="homeworkContainer">
									    <p>과제 조회를 위해서 수강중인 강좌를 먼저 선택해주세요.</p>
									</div>
                                    <!-- 과제 박스들이 동적으로 추가될 부분 -->
                                </div> <!-- end of assignment-list -->
                            </div> <!-- end of card-body -->
                        </div> <!-- end of card shadow mb-4 -->
                    </div> <!-- end of col - 과제 목록 출력 tbl -->
                </div> <!-- end of row - 과제 정보 출력 박스 -->
                
                <div class="col-sm-12 col-md-5">
                    <div class="dataTables_info pagintion-info" id="dataTable_info" role="status"
                     aria-live="polite"></div> <!-- 동적생성으로 고쳐야 함 -->
                </div> <!-- 페이지 표시부분 -->
                
                <div class="col-sm-12 col-md-7">
    				<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
        				<ul class="pagination" id="pagination">
            				<!-- 페이지네이션 버튼들이 여기에 동적으로 추가됨. -->
        				</ul> <!-- end of pagination list -->
    				</div> <!-- end of dataTable_paginate -->
				</div> <!-- end of pagination area -->

            </div> <!-- end of container-fluid -->
        </div> <!-- end of content -->
    </div> <!-- end of content Wrapper -->
</div> <!-- end of wrapper -->

<!-- Popup 오버레이 -->
<div id="overlay" class="overlay hidden">

	<!-- Popup 모달단. -->
	<div id="popup" class="popup hidden">
	    <div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">과제명: <span id="homeworkTitle" class="form-control"></span></h6>
			</div>
			<!-- 과제 정보 - hw_context 출력 단 -->
			<div class="card-body">
				<!-- 과제 관련 세부사항 여기 아래에 추가할 예정. -->
				<!-- 제출기한, 강의명, 담당 강사명 은 label : text 형식으로. text는 readonly. -->
				<div class="form-group">
					<label for="dueDate">제출기한 :</label>
					<input type="text" id="dueDate" class="form-control" readonly>
				</div>
				
				<div class="form-group">
					<label for="courseName">강의명 :</label>
					<input type="text" id="courseName" class="form-control" readonly>
				</div>
	
				<div class="form-group">
					<label for="instructorName">담당 강사명 :</label>
					<input type="text" id="instructorName" class="form-control" readonly>
				</div>
				
				<div class="form-group">
					<label for="assignmentContext">과제 세부사항 :</label>
					<textarea id="assignmentContext" class="form-control" rows="5" readonly>
				   </textarea>
				</div>
				<!-- 닫기버튼 -->
				<div class="d-flex justify-content-center mt-3">
                	<button class="btn btn-secondary" onclick="closePopup()">닫기</button>
            	</div>
			</div> <!-- end of card-body -->
		</div> <!-- end of card shadow mb-4 -->
	</div> <!-- end of popup -->
</div><!-- end of overlay -->

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

<!-- stu_homework.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/student/stu_homework.js"></script>

<!-- Page level custom scripts -->
<script src="resources/static/js/demo/chart-area-demo.js"></script>
<script src="resources/static/js/demo/chart-pie-demo.js"></script>

<!-- stu_homework.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/student/stu_homework.js"></script>

</body>
</html>