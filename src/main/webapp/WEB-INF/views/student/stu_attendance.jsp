<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

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
     	
     		<!-- Topbar -->
     		<jsp:include page="/resources/include/top_bar.jsp">
     			<jsp:param name="pageName" value="topBar"/>
     		</jsp:include>
     		
     		<!-- Begin Page Content -->
            <div class="container container-fluid">
     			
     			<!--페이지 명 -->
				<h5 class="h3 mb-4 text-gray-800">[학생]출결 조회</h5>

				<!-- 출결 정보 출력 박스 -->
                <div class="row">
	                <!-- 시험 정보 테이블 표시단 -->
                    <div class="col">
    	                <div class="card shadow mb-4">
        	                <div class="card-header py-3">
            	                <h6 class="m-0 font-weight-bold text-primary">출석부 조회하기</h6>
                            </div>
                            
                            <!-- 특정 날의 출석부 선택 단 -->
                            <div class="card-body">
                            	<div class="row">
                            <!-- left -->
									<div class="col-5"> <!-- 해당 강의 출석 누계 -->
										<div class="card shadow mb-4">
	                               			<div class="card-header py-3">
	                                   			<h6 class="m-0 font-weight-bold text-primary">강의명 1</h6>
	                               			</div>
		                               		<div class="card-body">
			                                   <div class="row">
													<label class="col-sm-4 col-form-label">출석 : </label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
														name="attended" id="attended">
													</div>
			                                	</div>
			                                	<div class="row">
				                                	<label class="col-sm-4 col-form-label">조퇴 : </label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
														name="left" id="left">
													</div>
												</div>
												<div class="row">
				                                	<label class="col-sm-4 col-form-label">결석 : </label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
														name="absent" id="absent">
													</div>
												</div>
											</div> <!-- end of card-body -->
			                            </div> <!-- end of card shadow mb-4 -->
	                           		</div> <!-- end of col-5 - 강의 출석 누계 end -->
	                           		<!-- end of left -->
	                           		
	                           		<!-- right -->
									<div class="col-5">
										<div class="col">
											<div class="row">
												<div class="col-sm-4">
													<input type="date" class="form-control form-control-sm" name="examdate" id="examdate">
												</div>
											</div> <!-- end of row -->
											<div class="row">
												<label class="col-sm-4 col-form-label">*국어 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														name="kor" id="kor" value="">
												</div>
												<div class="custom-control custom-checkbox small">
                                               		<input type="checkbox" class="custom-control-input" name="kor_took" id="kor_took">
                                           			<label class="custom-control-label" for="kor_took">* 국어 응시 여부 : </label>
                                           		</div> <!-- end of row -->
											</div> <!-- end of col -->
											<div class="row">
												<label class="col-sm-4 col-form-label">*수학 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														name="math" id="math" value="">
												</div>
												<div class="custom-control custom-checkbox small">
                                               		<input type="checkbox" class="custom-control-input" name="math_took" id="math_took">
                                           			<label class="custom-control-label" for="math_took">* 수학 응시 여부 : </label>
                                           		</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*영어 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														name="english" id="english" value="">
												</div>
												<div class="custom-control custom-checkbox small">
                                               		<input type="checkbox" class="custom-control-input" name="eng_took" id="eng_took">
                                           			<label class="custom-control-label" for="eng_took">* 영어 응시 여부 : </label>
                                           		</div>
											</div> <!-- end of last row -->
										</div> <!-- end of col -->
								</div> <!-- end of row-5 -->
								<!-- end of right -->
	                           		
								</div> <!-- end of row -->
								
									
								
									
								</div>
							</div>
                          </div>
                       </div> <!-- end of col -->
                    <!-- end of 출결정보 출력 박스 -->
     			
     			<!-- 시험 정보 출력 박스 -->
                    <div class="row">
                        <!-- 시험 정보 테이블 표시단 -->
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">출석 상세 목록</h6>
                                </div>
                                <!-- 시험 정보 tbl 출력할 단 -->
                                <div class="card-body">
                                    <table class="table table-bordered" id="gradeTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>강좌명</th>
                                                <th>출석일시</th>
                                                <th>강사명</th>
                                                <th>출석현황</th>
                                                <th>강사님께 쪽지보내기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- 시험 성적 데이터 출력 (동적으로 생성) -->
                                            <c:forEach var="grade" items="${grades}">
                                                <tr>
                                                    <td>${course.course_name}</td>
                                                    <td>${attendance.attendance_date}</td>
                                                    <td>${couser.course_instructor}</td>
                                                    <td>${attendance.attendance_status_no}</td>
                                                    <td>
                                                    	<div class="col-8"> <!-- 강사님께 쪽지보내기 버튼 -->
															<a href="message.do" class="btn btn-primary btn-icon-split btn">
																<span class="icon text-white-50">
																	<i class="fas fa-paper-plane"></i>
																</span>
																<span class="text">강사님께 쪽지보내기</span>
															</a><!-- end of 강사님께 쪽지보내기 버튼 -->
														</div>
													</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end of col -->

                    </div> <!-- end of row - 시험정보 출력단 끝 -->
     			
     			
     			<div class="row"> <!-- stu_attendance_detail.jsp 로 넘어가는 버튼 -->
					<div class="col-4">
						<a href="stu_attendance_detail.do" class="btn btn-info btn-icon-split btn">
							<span class="icon text-white-50">
								<i class="fas fa-info-circle"></i>
							</span>
							<span class="text">출결 상세보기</span>
						</a>
					</div>
				</div> <!-- end of stu_attendance_detail.jsp btn -->
     			
     		</div>
     	</div>
     </div>
    
    
    </div>

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

</body>
</html>