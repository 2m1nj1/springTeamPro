<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link href="../resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

// 파일 입력 필드 추가 기능
function addFileInput() {
    var newFileInput = `
        <div class="form-group file-input-group">
            <label for="taskFile">첨부 파일</label>
            <input type="file" class="form-control-file" name="taskFile[]">
        	<button type="button" class="btn btn-danger btn-sm mt-2" 
        	onclick="removeFileInput(this)">삭 제</button>
        </div>
    `;
    $('#fileInputsContainer').append(newFileInput);  // 새로운 파일 입력 필드를 container에 추가
}

//파일 입력 필드 삭제 기능
function removeFileInput(button) {
    // 클릭된 버튼의 부모 div (파일 입력 필드 전체)를 제거
    $(button).closest('.file-input-group').remove();
}


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

				<!-- Begin Page Content - 네비게이터 등 기본 frame 빼고 다 여기 들어감 -->
				<div class="container container-fluid">


		<h1>과제 관리 페이지입니다.</h1>
				
				<!-- 과제 등록 폼 영역 -->
                <div class="row mt-4">
                    <div class="col-lg-8">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">과제 등록</h6>
                            </div>
                            <div class="card-body">
                                <form action="tch_homeworkList.do" method="post">
                                 <input name="hw_no" type="hidden" value="${homework.hw_no}" />
                                    <!-- 과제 제목 입력 -->
                                    <div class="form-group">
                                        <label for="taskTitle">과제 제목</label>
                                        <input type="text" class="form-control" id="taskTitle" name="hw_title"  
                                        value="${homework.hw_title}" placeholder="과제 제목을 입력하세요">
                                    </div>

                                    <!-- 과제 설명 입력 -->
                                    <div class="form-group">
                                        <label for="taskDescription">과제 설명</label>
                                        <textarea class="form-control" id="taskDescription" name="hw_context" rows="4" style="height: 300px;"
                                        value="${homework.hw_context}" placeholder="과제 설명을 입력하세요"></textarea>
                                    </div>

                                    <!-- 제출 기한 입력 -->
                                    <div class="form-group">
                                        <label for="dueDate">제출 기한</label>
                                        <input type="date" class="form-control" id="dueDate" 
                                        name="hw_enddate" value="${sysdate+2}">
                                    </div>

                                    <!-- 과제 파일 업로드 -->
                                <div id="fileInputsContainer">	<!-- 파일 입력 필드 추가 -->
                                    <div class="form-group">
                                        <label for="taskFile">첨부 파일</label>
                                        <input type="file" class="form-control-file" id="taskFile[]" 
                                        name="upload_location" value="${upload_location}">
                                    </div>
								</div>
							
							<!-- + 버튼으로 파일 필드 추가 -->
                             <button type="button" class="btn btn-success" onclick="addFileInput()">+ 파일 추가</button>
							
                                    <!-- 등록 버튼 -->
                             <button  align="right" type="submit" class="btn btn-primary">등록</button>
                                </form>
                            </div> <!-- end of card-body  -->
                        </div> <!-- end of card shadow mb-4 -->
                    </div>	<!-- end of col-lg-8 -->
                </div>	<!-- end of mt-4 -->
				
				
					</div> <!-- end of container-fluid -->
			</div> 	<!-- Main content 여기서 끝남 -->
		</div> 	<!-- Content Wrapper 여기서 끝남 -->
	</div>	<!-- Page Wrapper 여기서 끝남 -->

	<!-- Bootstrap core JavaScript-->
    <script src="/resources/static/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/static/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/static/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/static/js/demo/chart-area-demo.js"></script>
    <script src="/resources/static/js/demo/chart-pie-demo.js"></script>
    
    
</body>
</html>