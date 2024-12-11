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

    <title>tch_attendance.jsp</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">


    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

	<script type="text/javascript">
		// 강좌 선택 시 호출되는 함수
	    function selectCourse(courseName) {
	        // 선택한 강좌명을 #selectedCourse에 표시
	        document.getElementById('selectedCourse').textContent = courseName;
	        
	     	// 필터링 후 출석 정보 업데이트
            updateAttendanceCounts(courseName);
		};
	        
		// 더미 데이터
        const attendances = [
            { courseName: '프로그래밍 기초', attendanceDate: '2024-11-25', instructorName: '김교수', attendanceStatus: '출석' },
            { courseName: '자료구조', attendanceDate: '2024-11-25', instructorName: '이교수', attendanceStatus: '조퇴' },
            { courseName: '웹 개발', attendanceDate: '2024-11-26', instructorName: '박교수', attendanceStatus: '결석' },
            { courseName: '데이터베이스', attendanceDate: '2024-11-26', instructorName: '최교수', attendanceStatus: '출석' },
            { courseName: '소프트웨어 공학', attendanceDate: '2024-11-27', instructorName: '송교수', attendanceStatus: '출석' },
            { courseName: '네트워크', attendanceDate: '2024-11-27', instructorName: '한교수', attendanceStatus: '결석' },
        ];

        function filterAttendance(status) {
            const rows = document.querySelectorAll("#attendanceTable tbody tr");
            
            rows.forEach(row => {
                const attendanceStatus = row.querySelector("td:nth-child(4)").textContent;
                if (attendanceStatus === status || status === '전체') {
                    row.style.display = '';  // 필터링된 상태는 보이도록 설정
                } else {
                    row.style.display = 'none';  // 필터링된 상태는 숨기도록 설정
                }
            });
        }

        function populateTable() {
            const tableBody = document.querySelector("#attendanceTable tbody");
            tableBody.innerHTML = ''; // 기존 데이터 비우기

            // 더미 데이터로 테이블 채우기
            attendances.forEach(attendance => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${attendance.courseName}</td>
                    <td>${attendance.attendanceDate}</td>
                    <td>${attendance.instructorName}</td>
                    <td>${attendance.attendanceStatus}</td>
                    <td>
                        <div class="col-8">
                            <a href="message.do" class="btn btn-primary btn-icon-split btn">
                                <span class="icon text-white-50">
                                    <i class="fas fa-paper-plane"></i>
                                </span>
                                <span class="text">강사님께 쪽지보내기</span>
                            </a>
                        </div>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        }

        // 초기화 함수 (페이지 로드 시 데이터 표시)
        window.onload = function() {
            populateTable();
            filterAttendance('전체');  // 초기 로드시 모든 출석 상태를 표시
	    
	</script>

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
     		
     		<!-- Begin Page Content - 네비게이터 등 기본 frame 빼고 다 여기 들어감 -->
            <div class="container container-fluid">
     			
     			<!--페이지 명 -->
				<h5 class="h3 mb-4 text-gray-800">[강사]출석부</h5>

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
														name="attended" id="attended" readonly>
													</div>
			                                	</div>
			                                	<div class="row">
				                                	<label class="col-sm-4 col-form-label">조퇴 : </label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
														name="left" id="left" readonly>
													</div>
												</div>
												<div class="row">
				                                	<label class="col-sm-4 col-form-label">결석 : </label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
														name="absent" id="absent" readonly>
													</div>
												</div>
											</div> <!-- end of card-body -->
			                            </div> <!-- end of card shadow mb-4 -->
	                           		</div> <!-- end of col-5 - 강의 출석 누계 end -->
	                           		<!-- end of left -->
	                           		
	                           		<!-- right -->
									<div class="col-7"> <!-- 해당 강의 출석 누계 -->
										<div class="card shadow mb-4">
	                               			<div class="card-header py-3">
	                                   			<!-- 강좌 선택 카테고리 드랍박스; 수강중인 강의 목록 가져와서 그에 대한 과제 표시토록 할 것임 -->
								                <div class="input-group">
														<button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">수강중 강좌 선택</button>
														<ul class="dropdown-menu">
															<li><a class="dropdown-item" href="#">Action</a></li>
															<li><a class="dropdown-item" href="#">Another
																	action</a></li>
															<li><a class="dropdown-item" href="#">Something
																	else here</a></li>
															<li><hr class="dropdown-divider"></li>
															<li><a class="dropdown-item" href="#">Separated
																	link</a></li>
														</ul>
													<input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="학생 이름 검색">
												</div>
	                               			</div> <!-- 카테고리 드랍박스 끝 -->
		                               		<div class="card-body"> <!-- card-body - 날짜 표시랑 출석현황 버튼들 지정 -->
			                                	<div class="row">
													<div class="col-sm-5">
														<input type="date" class="form-control form-control-sm" name="examdate" id="examdate">
													</div>
												</div>
												<div class="my-2"></div>
												<div class="row">
												    <label class="col-sm-2 col-form-label">출석현황</label>
												    <div class="col-sm-1"></div>
												    <!-- 출석만 보기 버튼 -->
												    <a href="#" class="btn btn-success btn-icon-split" onclick="filterAttendance('출석')">
												        <span class="icon text-white-50">
												            <i class="fas fa-check"></i>
												        </span>
												        <span class="text">출석</span>
												    </a>
												    <div class="col-sm-1"></div>
												    <!-- 조퇴만 보기 버튼 -->
												    <a href="#" class="btn btn-warning btn-icon-split" onclick="filterAttendance('조퇴')">
												        <span class="icon text-white-50">
												            <i class="fas fa-exclamation-triangle"></i>
												        </span>
												        <span class="text">조퇴</span>
												    </a>
												    <div class="col-sm-1"></div>
												    <!-- 결석만 보기 버튼 -->
												    <a href="#" class="btn btn-danger btn-icon-split" onclick="filterAttendance('결석')">
												        <span class="icon text-white-50">
												            <i class="fas fa-trash"></i>
												        </span>
												        <span class="text">결석</span>
												    </a>
												</div> <!-- class="row" 끝 - 출석현황 ~버튼들 있는 행 여기서 끝남. -->
											</div> <!-- end of card-body - 날짜 표시랑 출석현황 버튼들 지정 끝 -->
			                            </div> <!-- end of card shadow mb-4 -->
	                           		</div> <!-- end of col-5 - 강의 출석 누계 end -->
	                           		<!-- end of left -->
								<!-- end of right -->
	                           		
								</div> <!-- end of row --> <!-- <div class="row"> -->

								</div> <!-- <div class="card-body"> -->
							</div><!-- <div class="card shadow mb-4"> -->
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
                                        <!-- 시험 성적 데이터 출력 (동적으로 생성) -->
                                        <tbody>
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
																<span class="text">학생에게 쪽지보내기</span>
															</a><!-- end of 강사님께 쪽지보내기 버튼 -->
														</div>
													</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end of col - 시험정보테이블 표시 끝 -->

                    </div> <!-- end of row - 시험정보 출력단 끝 -->
     			
     			
     			<div class="row"> <!-- tch_attendance_detail.jsp 로 넘어가는 버튼 -->
     				<div class="col-10"></div>
					<div class="col-2">
						<a href="tch_attendance_details.do" class="btn btn-info btn-icon-split btn">
							<span class="icon text-white-50">
								<i class="fas fa-info-circle"></i>
							</span>
							<span class="text">출결 상세</span>
						</a>
					</div>
				</div> <!-- end of stu_attendance_detail.jsp btn -->
     			
     		</div> <!-- 여기까지 기본 프레임 안에 들어가는 콘텐츠들 -->
     	</div> <!-- Main content 여기서 끝남 -->
     </div> <!-- Content Wrapper 여기서 끝남 -->
    
    
    </div> <!-- Page Wrapper 여기서 끝남 -->

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