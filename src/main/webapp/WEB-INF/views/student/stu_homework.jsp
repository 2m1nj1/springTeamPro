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
   *{
      font-family: 'Noto Sans KR', sans-serif;
   }
</style>


<script type="text/javascript">
// 예시 과제 데이터 (서버에서 전달받은 데이터를 동적으로 처리할 예정.)
let assignments = [
    { id: 1, title: '과제명 1', description: '과제 1의 설명입니다.' },
    { id: 2, title: '과제명 2', description: '과제 2의 설명입니다.' },
    { id: 3, title: '과제명 3', description: '과제 3의 설명입니다.' },
    { id: 4, title: '과제명 4', description: '과제 4의 설명입니다.' },
    { id: 5, title: '과제명 5', description: '과제 5의 설명입니다.' },    
];

// 과제 목록을 동적으로 생성 함수
function loadAssignments() {
    let assignmentList = document.getElementById('assignment-list');

    assignments.forEach(function(assignment) {
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
        cardBody.innerText = assignment.description;
        collapseDiv.appendChild(cardBody);

        // 카드 div에 추가
        cardDiv.appendChild(cardHeader);
        cardDiv.appendChild(collapseDiv);

        // 과제 리스트에 카드 추가
        assignmentList.appendChild(cardDiv);
    });
}

// 페이지 로드 시 과제 목록 불러오기
window.onload = loadAssignments;

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
     			<div class="dataTables_info" id="dataTable_info" role="status"
     			 aria-live="polite">Showing 1 to 10 of 57 entries</div> <!-- 동적생성으로 고쳐야 함 -->
     		</div> <!-- 페이지 표시부분 -->
     		
     		<div class="col-sm-12 col-md-7">
     			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
     				<ul class="pagination">
     					<li class="paginate_button page-item previous disabled" id="dataTable_previous">
     						<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
     					</li>
     					<li class="paginate_button page-item active">
     						<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
     					</li>
     					<li class="paginate_button page-item ">
     						<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
     					</li>
     					<li class="paginate_button page-item ">
     						<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
     					</li>
     					<li class="paginate_button page-item ">
     						<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
     					</li>
     					<li class="paginate_button page-item ">
     						<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
     					</li>
     					<li class="paginate_button page-item ">
     						<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
     					</li>
     					<li class="paginate_button page-item next" id="dataTable_next">
     						<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
     					</li>
     				</ul> <!-- end of pagination list -->
     			</div> <!-- end of dataTable_paginate -->
     		</div> <!-- end of pagination area -->
     		
     	</div> <!-- end of container-fluid -->

    </div> <!-- end of content -->
    </div> <!-- end of content Wrapper -->

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