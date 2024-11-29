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

    <script type="text/javascript">
 // 예시 과제 데이터 (서버에서 전달받은 데이터를 동적으로 처리할 예정.)
    let assignments = [
        { id: 1, title: '회차 1', attendanceDate: '2024-12-05 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '출석' },
        { id: 2, title: '회차 2', attendanceDate: '2024-12-07 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '조퇴' },
        { id: 3, title: '회차 3', attendanceDate: '2024-12-09 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '결석' },
        { id: 4, title: '회차 4', attendanceDate: '2024-12-11 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '출석' },
        { id: 5, title: '회차 5', attendanceDate: '2024-12-13 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '출석' },
        { id: 6, title: '회차 6', attendanceDate: '2024-12-15 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '조퇴' },
        { id: 7, title: '회차 7', attendanceDate: '2024-12-17 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '결석' },
        { id: 8, title: '회차 8', attendanceDate: '2024-12-19 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '출석' },
        { id: 9, title: '회차 9', attendanceDate: '2024-12-21 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '조퇴' },
        { id: 10, title: '회차 10', attendanceDate: '2024-12-23 09:28:00', course: 'Java Programming', instructor: '김 강사', attendanceStatus: '결석' }
    ];

    let currentPage = 1; // 현재 페이지
    const itemsPerPage = 3; // 한 페이지에 표시할 출석정보 개수

 	// 출석 상태를 관리하는 변수 (초기값은 '출석')
    var attendanceStatus = '결석';

    // 출석 목록 동적 생성 함수
    function loadAttendances() {
        let assignmentList = document.getElementById('attendance-list');
        assignmentList.innerHTML = ''; // 기존 항목 제거

        // 페이지에 맞는 출석 정보들만 가져오기
        let startIndex = (currentPage - 1) * itemsPerPage;
        let endIndex = startIndex + itemsPerPage;
        let assignmentsToShow = assignments.slice(startIndex, endIndex);

        assignmentsToShow.forEach(function(assignment) {
            // 각 회차에 대한 출석정보 카드 div 생성
            let cardDiv = document.createElement('div');
            cardDiv.className = 'card shadow mb-4';

            // 카드(Collapsable Card Example) 헤더
            let cardHeader = document.createElement('a');
            cardHeader.href = '#collapse' + assignment.id;
            cardHeader.className = 'd-block card-header py-3';
            cardHeader.setAttribute('data-toggle', 'collapse');
            cardHeader.setAttribute('role', 'button');
            cardHeader.setAttribute('aria-expanded', 'false');
            cardHeader.setAttribute('aria-controls', 'collapse' + assignment.id);

            let headerTitle = document.createElement('h6');
            headerTitle.className = 'm-0 font-weight-bold text-primary';
            headerTitle.innerText = assignment.title;
            cardHeader.appendChild(headerTitle);

            // 카드 본문 (Collapsible 부분)
            let collapseDiv = document.createElement('div');
            collapseDiv.className = 'collapse';
            collapseDiv.id = 'collapse' + assignment.id;

            let cardBody = document.createElement('div');
            cardBody.className = 'card-body';

            // 출석 일시, 강의명, 담당 강사명 추가
            let attendanceDate = document.createElement('p');
            attendanceDate.className = 'font-weight-bold';
            attendanceDate.innerText = '출석일시: ' + assignment.attendanceDate;

            let courseName = document.createElement('p');
            courseName.className = 'font-weight-bold';
            courseName.innerText = '강의명: ' + assignment.course;

            let instructorName = document.createElement('p');
            instructorName.className = 'font-weight-bold';
            instructorName.innerText = '담당 강사: ' + assignment.instructor;

            // 카드 본문에 출석 일시, 강의명, 담당 강사명 추가
            cardBody.appendChild(attendanceDate);
            cardBody.appendChild(courseName);
            cardBody.appendChild(instructorName);

            // 버튼 추가 ( 출석/조퇴/결석, 과제 담당 강사에게 쪽지보내기)
            let buttonContainer = document.createElement('div');
            buttonContainer.className = 'row mt-3';

            // 출석/조퇴/결석 표시 버튼 (col-3)
            let submitBtnCol = document.createElement('div');
            submitBtnCol.className = 'col-4';

            let submitBtn = document.createElement('button');
            submitBtn.className = 'btn btn-block';

            // 출석 상태에 따라 색상 변경
            if (attendanceStatus === '출석') {
                submitBtn.classList.add('btn-success');
                submitBtn.innerText = '출석';
            } else if (attendanceStatus === '조퇴') {
                submitBtn.classList.add('btn-warning');
                submitBtn.innerText = '조퇴';
            } else if (attendanceStatus === '결석') {
                submitBtn.classList.add('btn-danger');
                submitBtn.innerText = '결석';
            }

            submitBtnCol.appendChild(submitBtn);
            buttonContainer.appendChild(submitBtnCol);

            // 버튼 사이 여백 추가 (col-3)
            let detailBtnCol = document.createElement('div');
            detailBtnCol.className = 'col-4'; // 여백 공간
            buttonContainer.appendChild(detailBtnCol);

            // (담당 강사에게)쪽지 보내기 버튼 (col-3)
            let messageBtnCol = document.createElement('div');
            messageBtnCol.className = 'col-4';
            let messageBtn = document.createElement('button');
            messageBtn.className = 'btn btn-primary btn-block';
            messageBtn.innerText = '쪽지 보내기';
            messageBtn.onclick = function() {
                alert('담당 강사에게 쪽지 보내기 기능은 아직 구현되지 않았습니다.');
            };
            messageBtnCol.appendChild(messageBtn);
            buttonContainer.appendChild(messageBtnCol);

            cardBody.appendChild(buttonContainer);
            collapseDiv.appendChild(cardBody);
            cardDiv.appendChild(cardHeader);
            cardDiv.appendChild(collapseDiv);
            assignmentList.appendChild(cardDiv);
        });

        // 페이지네이션 업데이트
        updatePagination();
    }

    // 페이지네이션 업데이트 함수
    function updatePagination() {
        let totalPages = Math.ceil(assignments.length / itemsPerPage);
        let pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        // Previous 버튼
        let prevBtn = document.createElement('li');
        prevBtn.className = 'paginate_button page-item ' + (currentPage === 1 ? 'disabled' : '');
        let prevLink = document.createElement('a');
        prevLink.href = '#';
        prevLink.className = 'page-link';
        prevLink.innerText = 'Previous';
        prevLink.onclick = function() {
            if (currentPage > 1) {
                currentPage--;
                loadAttendances();
            }
        };
        prevBtn.appendChild(prevLink);
        pagination.appendChild(prevBtn);

        // 페이지 번호들
        for (let i = 1; i <= totalPages; i++) {
            let pageBtn = document.createElement('li');
            pageBtn.className = 'paginate_button page-item ' + (i === currentPage ? 'active' : '');
            let pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.className = 'page-link';
            pageLink.innerText = i;
            pageLink.onclick = function() {
                currentPage = i;
                loadAttendances();
            };
            pageBtn.appendChild(pageLink);
            pagination.appendChild(pageBtn);
        }

        // Next 버튼
        let nextBtn = document.createElement('li');
        nextBtn.className = 'paginate_button page-item ' + (currentPage === totalPages ? 'disabled' : '');
        let nextLink = document.createElement('a');
        nextLink.href = '#';
        nextLink.className = 'page-link';
        nextLink.innerText = 'Next';
        nextLink.onclick = function() {
            if (currentPage < totalPages) {
                currentPage++;
                loadAttendances();
            }
        };
        nextBtn.appendChild(nextLink);
        pagination.appendChild(nextBtn);
    }

    // 페이지 로딩 시 과제 목록 불러오기
    window.onload = function() {
        loadAttendances();
    };
 	// 강좌 선택 시 호출되는 함수
    function selectCourse(courseName) {
        // 선택한 강좌명을 #selectedCourse에 표시
        document.getElementById('selectedCourse').textContent = courseName;
    }
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
                
                <!-- 카테고리 드랍박스; 수강중인 강의 목록 가져와서 그에 대한 과제 표시토록 할 것임 -->
                <nav class="navbar navbar-expand navbar-light bg-light mb-4">
				    <a class="navbar-brand" href="#">Navbar</a>
				    <ul class="navbar-nav ml-auto">
				        <li class="nav-item dropdown">
				            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                <span id="selectedCourse">수강중인 강좌 선택</span> <!-- 기본 텍스트 -->
				            </a>
				            <div class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">
				                <a class="dropdown-item" href="#" onclick="selectCourse('IT front+back')">IT front+back</a>
				                <a class="dropdown-item" href="#" onclick="selectCourse('Java Programming')">Java Programming</a>
				                <div class="dropdown-divider"></div>
				                <a class="dropdown-item" href="#">Something else here</a>
				            </div>
				        </li>
				    </ul>
				</nav>
                
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