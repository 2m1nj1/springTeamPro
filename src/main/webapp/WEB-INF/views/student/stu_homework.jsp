<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>과제 제출 페이지</title>

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

<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script type="text/javascript">
        // 예시 과제 데이터 (서버에서 전달받은 데이터를 동적으로 처리할 예정.)
        let assignments = [
            { id: 1, title: '과제명 1', description: '과제 1의 설명입니다.', deadline: '2024-12-05', course: 'Java Programming', instructor: '김 강사' },
            { id: 2, title: '과제명 2', description: '과제 2의 설명입니다.', deadline: '2024-12-07', course: 'Web Development', instructor: '김 강사' },
            { id: 3, title: '과제명 3', description: '과제 3의 설명입니다.', deadline: '2024-12-09', course: 'Database Systems', instructor: '김 강사' },
            { id: 4, title: '과제명 4', description: '과제 4의 설명입니다.', deadline: '2024-12-11', course: 'Operating Systems', instructor: '김 강사' },
            { id: 5, title: '과제명 5', description: '과제 5의 설명입니다.', deadline: '2024-12-13', course: 'Computer Networks', instructor: '김 강사' },
            { id: 6, title: '과제명 6', description: '과제 6의 설명입니다.', deadline: '2024-12-15', course: 'Java Programming', instructor: '김 강사' },
            { id: 7, title: '과제명 7', description: '과제 7의 설명입니다.', deadline: '2024-12-17', course: 'Web Development', instructor: '김 강사' },
            { id: 8, title: '과제명 8', description: '과제 8의 설명입니다.', deadline: '2024-12-19', course: 'Database Systems', instructor: '김 강사' },
            { id: 9, title: '과제명 9', description: '과제 9의 설명입니다.', deadline: '2024-12-21', course: 'Operating Systems', instructor: '김 강사' },
            { id: 10, title: '과제명 10', description: '과제 10의 설명입니다.', deadline: '2024-12-23', course: 'Computer Networks', instructor: '김 강사' }   
        ];

        let currentPage = 1; // 현재 페이지
        const itemsPerPage = 3; // 한 페이지에 표시할 과제 개수

        // 과제 목록 동적 생성 함수
        function loadAssignments() {
            let assignmentList = document.getElementById('assignment-list');
            assignmentList.innerHTML = ''; // 기존 항목 제거

            // 페이지에 맞는 과제들만 가져오기
            let startIndex = (currentPage - 1) * itemsPerPage;
            let endIndex = startIndex + itemsPerPage;
            let assignmentsToShow = assignments.slice(startIndex, endIndex);

            assignmentsToShow.forEach(function(assignment) {
                // 각 과제에 대한 카드 div 생성
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

                // 과제 제출 기한, 강의명, 담당 강사명 추가
                let deadline = document.createElement('p');
                deadline.className = 'font-weight-bold';
                deadline.innerText = '과제 제출 기한: ' + assignment.deadline;

                let courseName = document.createElement('p');
                courseName.className = 'font-weight-bold';
                courseName.innerText = '강의명: ' + assignment.course;

                let instructorName = document.createElement('p');
                instructorName.className = 'font-weight-bold';
                instructorName.innerText = '담당 강사: ' + assignment.instructor;

                // 카드 본문에 과제 제출 기한, 강의명, 담당 강사명 추가
                cardBody.appendChild(deadline);
                cardBody.appendChild(courseName);
                cardBody.appendChild(instructorName);

                // 버튼 추가 (과제 제출, 과제 상세보기, 과제 담당 강사에게 쪽지보내기)
                let buttonContainer = document.createElement('div');
                buttonContainer.className = 'row mt-3';

                // 과제 제출 버튼 (col-3)
                let submitBtnCol = document.createElement('div');
                submitBtnCol.className = 'col-4';
                let submitBtn = document.createElement('button');
                submitBtn.className = 'btn btn-primary btn-block';
                submitBtn.innerText = '과제 제출';
                submitBtn.onclick = function() {
                    // 파일 업로드 폼 생성
                    let form = document.createElement('form');
                    form.method = 'POST'; // POST 방식으로 전송
                    form.action = '/upload'; // 서버에서 파일을 처리할 URL로 변경
                    form.enctype = 'multipart/form-data'; // 파일 업로드를 위한 인코딩 타입 설정
                    
                    // 과제 ID를 숨겨서 전달
                    let assignmentIdInput = document.createElement('input');
                    assignmentIdInput.type = 'hidden';
                    assignmentIdInput.name = 'assignmentId';
                    assignmentIdInput.value = assignment.id;
                    form.appendChild(assignmentIdInput);
                    
                    // 파일 선택 input 요소 생성
                    let fileInput = document.createElement('input');
                    fileInput.type = 'file';
                    fileInput.name = 'file';
                    fileInput.accept = '.zip,.pdf,.docx,.txt'; // 업로드 가능한 파일 확장자 설정
                    form.appendChild(fileInput);
                    
                    // 제출 버튼 생성
                    let submitFileBtn = document.createElement('button');
                    submitFileBtn.type = 'submit';
                    submitFileBtn.className = 'btn btn-success btn-block mt-3';
                    submitFileBtn.innerText = '파일 제출';
                    form.appendChild(submitFileBtn);
                    
                    // 모달을 생성하여 사용자에게 표시
                    let modalContainer = document.createElement('div');
                    modalContainer.className = 'modal fade show';
                    modalContainer.style.display = 'block'; // 모달을 화면에 띄움
                    modalContainer.setAttribute('aria-labelledby', 'exampleModalLabel');
                    modalContainer.setAttribute('aria-hidden', 'true');
                    
                    let modalDialog = document.createElement('div');
                    modalDialog.className = 'modal-dialog';
                    
                    let modalContent = document.createElement('div');
                    modalContent.className = 'modal-content';
                    
                    let modalHeader = document.createElement('div');
                    modalHeader.className = 'modal-header';
                    let modalTitle = document.createElement('h5');
                    modalTitle.className = 'modal-title';
                    modalTitle.innerText = '과제 제출';
                    modalHeader.appendChild(modalTitle);
                    
                    // X 버튼을 클릭 시 모달을 닫도록 설정
                    let closeBtn = document.createElement('button');
                    closeBtn.type = 'button';
                    closeBtn.className = 'close';
                    closeBtn.setAttribute('data-dismiss', 'modal');
                    closeBtn.setAttribute('aria-label', 'Close');
                    closeBtn.innerHTML = '&times;';
                    closeBtn.onclick = function() {
                        // 모달 창을 닫고 DOM에서 제거
                        document.body.removeChild(modalContainer);
                    };
                    modalHeader.appendChild(closeBtn);
                    
                    let modalBody = document.createElement('div');
                    modalBody.className = 'modal-body';
                    modalBody.appendChild(form); // 파일 업로드 폼을 모달에 추가
                    
                    modalContent.appendChild(modalHeader);
                    modalContent.appendChild(modalBody);
                    modalDialog.appendChild(modalContent);
                    modalContainer.appendChild(modalDialog);
                    
                    // 페이지에 모달 추가
                    document.body.appendChild(modalContainer);
                };
                submitBtnCol.appendChild(submitBtn);
                buttonContainer.appendChild(submitBtnCol);

                // 과제 상세보기 버튼 (col-3)
                let detailBtnCol = document.createElement('div');
                detailBtnCol.className = 'col-4';
                let detailBtn = document.createElement('button');
                detailBtn.className = 'btn btn-info btn-block';
                detailBtn.innerText = '과제 상세보기';
                detailBtn.onclick = function() {
                    alert('과제 상세보기: ' + assignment.description);
                    
                    window.location.href = 'stu_homework_details.do'
                    //'?hw_no=' + hw_no; 붙여줘야 함. 나중에...
                };
                detailBtnCol.appendChild(detailBtn);
                buttonContainer.appendChild(detailBtnCol);

                // 쪽지 보내기 버튼 (col-3)
                let messageBtnCol = document.createElement('div');
                messageBtnCol.className = 'col-4';
                let messageBtn = document.createElement('button');
                messageBtn.className = 'btn btn-warning btn-block';
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
                    loadAssignments();
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
                    loadAssignments();
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
                    loadAssignments();
                }
            };
            nextBtn.appendChild(nextLink);
            pagination.appendChild(nextBtn);
        }

        // 페이지 로딩 시 과제 목록 불러오기
        window.onload = function() {
            loadAssignments();
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
                <h5 class="h3 mb-4 text-gray-800">과제 제출 페이지</h5>
                
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
				                <a class="dropdown-item" href="#" onclick="selectCourse('ㅇㅅㅇ')">ㅇㅅㅇ</a>
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
                                <h6 class="m-0 font-weight-bold text-primary">과제 목록</h6>
                            </div>
                            <!-- 과제 정보 tbl 출력 단 -->
                            <div class="card-body">
                                <!-- 과제 카드들을 동적으로 추가할 div -->
                                <div id="assignment-list">
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