<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
   *{
      font-family: 'Noto Sans KR', sans-serif;
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
					
					<!-- hidden input - userNo -->
					<input type="hidden" id="userNo" name="userNo" value="${param.userNo}">

					<!-- 페이지 명 -->
					<h5 class="h3 mb-4 text-gray-800">성적 입력</h5>

					<!-- 시험 정보 입력 박스 -->
					<div class="row ">

						<!-- 시험정보 -->
						<div class="col">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">시험 정보 입력</h6>
									<!-- 버튼 -->
									<button class="btn btn-info btn-circle btn-sm" id="infobtn1">
										<i class="fas fa-info-circle"></i>
									</button>
								</div>
								<div class="card-body">
									<div class="row">
									<!-- left -->
										<div class="col-6">
											<div class="row">
												<label class="col-sm-4 col-form-label">*시험명 : </label>
												<div class="col-sm-8">
												<!-- 시험명 Dropdown -->
													<select class="form-control form-control-sm" required name="exam_name" id="exam_name">
											            <option value="">시험명을 선택하세요</option>
											            <!-- Dropdown options will be dynamically loaded via JavaScript -->
											        </select>
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*시험 정보 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm" required
														name="exam_context" id="exam_context" placeholder="시험 상세설명 - 수능/모평/모의고사 등." readonly>
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*수험 번호 : </label>
												<div class="col-sm-8">
													<input type="number" class="form-control form-control-sm" required
														name="exam_no" id="exam_no" placeholder="수험번호 입력(6자리 숫자)">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*이름 : </label>
												<div class="col-sm-8">
													 <input type="text" class="form-control form-control-sm" required
														name="user_name" id="user_name" placeholder="수험생 이름 입력">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*원점수 총합   : </label>
												<div class="col-sm-8"> 
													<input type="number" class="form-control form-control-sm" required
													min="0" max="300"
													 name="original_score" id="original_score" placeholder="국영수 원점수 총점 입력(0~300)">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*백분위 총합 : </label>
												<div class="col-sm-8">
													<input type="number" class="form-control form-control-sm" required
													min="0"
													 name="percentile_score" id="percentile_score" placeholder="국영수 백분위 총점 입력">
												</div>		
											</div> <!-- end of row -->
										</div> <!-- end of col-5 -->
										<!-- end of left -->
										
										<div class="col-1"></div>
										
										<!-- right -->
										<div class="col-5">
										<button class="btn btn-info btn-circle btn-sm" id="infobtn2">
											<i class="fas fa-info-circle"></i>
										</button>
											<div class="col">
												<div class="row">
													<div class="custom-control custom-checkbox small">
                                                		<input type="checkbox" class="custom-control-input"
                                                		 name="kor_took" id="kor_took" checked>
                                            			<label class="custom-control-label" for="kor_took">* 국어 응시 여부 : </label>
                                            		</div>
                                            	</div>
												<div class="row">	
													<label class="col-sm-4 col-form-label">*국어 : </label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
														min="0" max="100" required
															name="kor" id="kor" value="" placeholder="국어 점수 입력(0~100)">
													</div>
												</div>
												<div class="row">		
													<div class="custom-control custom-checkbox small">
                                                		<input type="checkbox" class="custom-control-input" name="math_took" id="math_took" checked>
                                            			<label class="custom-control-label" for="math_took">* 수학 응시 여부 : </label>
                                            		</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">*수학 : </label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
														min="0" max="100" required
															name="math" id="math" value="" placeholder="수학 점수 입력(0~100)">
													</div>
												</div>
												<div class="row">
													<div class="custom-control custom-checkbox small">
                                                		<input type="checkbox" class="custom-control-input" name="eng_took" id="eng_took" checked>
                                            			<label class="custom-control-label" for="eng_took">* 영어 응시 여부 : </label>
                                            		</div>
												</div>
												<div class="row">
													<label class="col-sm-4 col-form-label">*영어 : </label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
														min="0" max="100" required
															name="eng" id="eng" value="" placeholder="영어 점수 입력(0~100)">
													</div>
												</div>
											</div>
										</div> <!-- end of row-5 -->
									<!-- end of right -->
									</div> <!-- row -->
								</div> <!-- end of card-body -->
							</div> <!-- end of card shadow mb-4 -->
							

							<div class="row">
								<div class="col-4">
									<a href="stu_grade.do" class="btn-secondary btn-icon-split btn">
										<span class="icon text-white-50">
											<i class="fas fa-arrow-right"></i>
										</span>
										<span class="text">이전 화면</span>
									</a>
								</div>
								<div class="col-6"></div>
								<div class="col-2">
									<!-- 등록 버튼 클릭시 먼저 유효성 검사. 추후 괜춘하면 이동. -->
									<button type="submit" class="btn btn-primary btn-icon-split btn" id="stu_gradeInsertButton">
										<span class="icon text-white-50">
											<i class="fas fa-paper-plane"></i>
										</span>
										<span class="text">등록</span>
									</button>
								</div>
							</div>
							
						</div> <!-- end of col -->
						
					</div> <!-- end of row - 시험정보 입력 끝 -->
					<!-- // 시험 정보 입력 박스 끝 -->

					<!-- //시험 정보 입력 -->
				</div> <!-- end of container-fluid-->
			</div> <!-- end of content -->
		</div> <!-- end of content-Wrapper -->


		<!-- Bootstrap core JavaScript-->
		<script src="resources/static/vendor/jquery/jquery.min.js"></script>
		<script
			src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="resources/static/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="resources/static/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="resources/static/js/demo/chart-area-demo.js"></script>
		<script src="resources/static/js/demo/chart-pie-demo.js"></script>
		
		<!-- stu_gradeInsert js -->
		<!-- exam score input page custom script -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="resources/js/student/stu_gradeInsert.js"></script>
		
</body>
</html>