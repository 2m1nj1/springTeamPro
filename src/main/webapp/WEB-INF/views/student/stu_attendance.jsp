<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>출결 조회 페이지</title>

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
    </style>

<!-- js - ajax 이용... -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
        let attendanceRecords = [];
        let currentPage = 1;
        const itemsPerPage = 3;

        // Load attendance data for the selected course
        function loadAttendances(courseNo, userNo) {
            $.ajax({
                type: "GET",
                url: "getAttendanceList", // Your backend endpoint to fetch attendance data
                data: {
                    courseNo: courseNo,
                    userNo: userNo
                },
                success: function (response) {
                    attendanceRecords = response;
                    renderAttendances();
                },
                error: function (xhr, status, error) {
                    console.error("Failed to load attendance records:", error);
                    alert("출석 정보를 불러오는 데 실패했습니다.");
                }
            });
        }

        // Render attendance records dynamically
        function renderAttendances() {
            let attendanceList = document.getElementById("attendance-list");
            attendanceList.innerHTML = "";

            let startIndex = (currentPage - 1) * itemsPerPage;
            let endIndex = startIndex + itemsPerPage;
            let recordsToShow = attendanceRecords.slice(startIndex, endIndex);

            recordsToShow.forEach(function (record) {
                let cardDiv = document.createElement("div");
                cardDiv.className = "card shadow mb-4";

                // Card Header
                let cardHeader = document.createElement("a");
                cardHeader.href = `#collapse${record.attendance_date}`;
                cardHeader.className = "d-block card-header py-3";
                cardHeader.setAttribute("data-toggle", "collapse");
                cardHeader.setAttribute("role", "button");
                cardHeader.setAttribute("aria-expanded", "false");
                cardHeader.setAttribute("aria-controls", `collapse${record.attendance_date}`);

                let headerTitle = document.createElement("h6");
                headerTitle.className = "m-0 font-weight-bold text-primary";
                headerTitle.innerText = `출석일: ${record.attendance_date}`;
                cardHeader.appendChild(headerTitle);

                // Card Body
                let collapseDiv = document.createElement("div");
                collapseDiv.className = "collapse";
                collapseDiv.id = `collapse${record.attendance_date}`;

                let cardBody = document.createElement("div");
                cardBody.className = "card-body";

                let courseName = document.createElement("p");
                courseName.className = "font-weight-bold";
                courseName.innerText = `강의명: ${record.course_name}`;

                let instructorName = document.createElement("p");
                instructorName.className = "font-weight-bold";
                instructorName.innerText = `담당 강사: ${record.course_instructor}`;

                let attendanceStatus = document.createElement("p");
                attendanceStatus.className = "font-weight-bold";
                attendanceStatus.innerText = `상태: ${record.attendance_status}`;

                cardBody.appendChild(courseName);
                cardBody.appendChild(instructorName);
                cardBody.appendChild(attendanceStatus);

                // Buttons
                let buttonContainer = document.createElement("div");
                buttonContainer.className = "row mt-3";

                let submitBtnCol = document.createElement("div");
                submitBtnCol.className = "col-4";

                let submitBtn = document.createElement("button");
                submitBtn.className = "btn btn-primary btn-block";
                submitBtn.innerText = "출석 상세보기";
                submitBtn.onclick = function () {
                    alert(`출석 상세보기 기능 준비 중: ${record.attendance_date}`);
                };

                submitBtnCol.appendChild(submitBtn);
                buttonContainer.appendChild(submitBtnCol);

                let messageBtnCol = document.createElement("div");
                messageBtnCol.className = "col-4 offset-4";

                let messageBtn = document.createElement("button");
                messageBtn.className = "btn btn-primary btn-block";
                messageBtn.innerText = "쪽지 보내기";
                messageBtn.onclick = function () {
                    alert(`담당 강사에게 쪽지 보내기 기능 준비 중: ${record.course_instructor}`);
                };

                messageBtnCol.appendChild(messageBtn);
                buttonContainer.appendChild(messageBtnCol);

                cardBody.appendChild(buttonContainer);
                collapseDiv.appendChild(cardBody);
                cardDiv.appendChild(cardHeader);
                cardDiv.appendChild(collapseDiv);

                attendanceList.appendChild(cardDiv);
            });

            updatePagination();
        }

        // Pagination
        function updatePagination() {
            let totalPages = Math.ceil(attendanceRecords.length / itemsPerPage);
            let pagination = document.getElementById("pagination");
            pagination.innerHTML = "";

            let prevBtn = document.createElement("li");
            prevBtn.className = `paginate_button page-item ${currentPage == 1 ? "disabled" : ""}`;
            let prevLink = document.createElement("a");
            prevLink.href = "#";
            prevLink.className = "page-link";
            prevLink.innerText = "Previous";
            prevLink.onclick = function () {
                if (currentPage > 1) {
                    currentPage--;
                    renderAttendances();
                }
            };
            prevBtn.appendChild(prevLink);
            pagination.appendChild(prevBtn);

            for (let i = 1; i <= totalPages; i++) {
                let pageBtn = document.createElement("li");
                pageBtn.className = `paginate_button page-item ${i == currentPage ? "active" : ""}`;
                let pageLink = document.createElement("a");
                pageLink.href = "#";
                pageLink.className = "page-link";
                pageLink.innerText = i;
                pageLink.onclick = function () {
                    currentPage = i;
                    renderAttendances();
                };
                pageBtn.appendChild(pageLink);
                pagination.appendChild(pageBtn);
            }

            let nextBtn = document.createElement("li");
            nextBtn.className = `paginate_button page-item ${currentPage == totalPages ? "disabled" : ""}`;
            let nextLink = document.createElement("a");
            nextLink.href = "#";
            nextLink.className = "page-link";
            nextLink.innerText = "Next";
            nextLink.onclick = function () {
                if (currentPage < totalPages) {
                    currentPage++;
                    renderAttendances();
                }
            };
            nextBtn.appendChild(nextLink);
            pagination.appendChild(nextBtn);
        }

        // Select course
        function selectCourse(courseNo, courseName) {
            document.getElementById("selectedCourse").textContent = courseName;
            let userNo = document.getElementById("userNo").value; // Assuming there's a hidden input for userNo
            loadAttendances(courseNo, userNo);
        }

        // Initial load
        window.onload = function () {
            let initialCourseNo = 1; // Default course ID (update as needed)
            let userNo = document.getElementById("userNo").value; // Fetch from hidden input
            loadAttendances(initialCourseNo, userNo);
        };
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
            
            <!-- Begin Page Content -->
            <div class="container container-fluid">
                
                <!-- 페이지 명 -->
                <h5 class="h3 mb-4 text-gray-800">[학생]출결 조회 페이지</h5>
                
                <!-- 시험 응시 연도 조회 -->
                    <div class="row">
                        <div class="col">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">수강중인 강좌 선택</h6>
                                </div>
                                <div class="card-body">
                                    <!-- 카테고리 드랍박스; 수강중인 강의 목록 가져와서 그에 대한 과제 표시토록 할 것임 -->
					                <nav class="navbar navbar-expand navbar-light bg-light mb-4">
									    <a class="navbar-brand" href="#">Navbar</a>
									    <ul class="navbar-nav ml-auto">
									        <li class="nav-item dropdown">
									            <a class="nav-link dropdown-toggle" href="#" id="lectureDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									                <span id="selectedCourse">수강중인 강좌 선택</span> <!-- 기본 텍스트 -->
									            </a>
									            <div class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">
									                <a class="dropdown-item" href="#" onclick="selectCourse(1, 'IT front+back')">IT front+back</a>
                									<a class="dropdown-item" href="#" onclick="selectCourse(2, 'Java Programming')">Java Programming</a>
									            </div>
									        </li>
									    </ul>
									</nav>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of 시험 응시 연도 조회 -->
                
                <!-- 과제 정보 출력 박스 -->
                <div class="row">
                    <!-- 과제 목록 출력 tbl -->
                    <div class="col">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">출석 목록</h6>
                            </div>
                            <!-- 과제 정보 tbl 출력 단 -->
                            <div class="card-body">
                                <!-- 과제 카드들을 동적으로 추가할 div -->
                                <div id="attendance-list">
                                    <!-- 과제 박스들이 동적으로 추가될 부분 -->
                                </div> <!-- end of attendance-list -->
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
            				<!-- 페이지네이션 버튼들이 여기에 동적으로 추가됩니다. -->
        				</ul><!-- end of pagination list -->
    				</div><!-- end of dataTable_paginate -->
				</div><!-- end of pagination area -->

                
            </div> <!-- end of container-fluid -->
        </div> <!-- end of content -->
    </div> <!-- end of content Wrapper -->
</div> <!-- end of wrapper -->

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