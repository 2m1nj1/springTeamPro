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

<!-- js -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- exam score input page custom script -->
<script type="text/javascript">
	$(function() {
		// 버튼 옆에 문구 없으면 추가, 있으면 토글.
		let txt1 = " * 표시는 필수기재항목. ";
		let txt2 = " 응시=1, 미응시=0. ";

		/* 버튼의 id 값을 infobtn1 대신에 넣어주면 됩니다 */
		$('#infobtn1').click(function() {
			// 버튼 옆에 문구가 없으면 추가하고, 있으면 토글
			let infoText = $(this).next('.info-text');
			if (infoText.length == 0) {
				//문구 없으면 추가
				$(this).after('<span class="info-text">' + txt1 + '</span>')
			} else {
				// 문구 있으면 토글(보이거나 숨김)
				infoText.toggle();
			}

		});// end of infobtn1 click

		$('#infobtn2').click(function() {
			let infoText = $(this).next('.info-text');
			if (infoText.length == 0) {
				$(this).after('<span class="info-text">' + txt2 + '</span>')
			} else {
				infoText.toggle();
			}
		});// end of infobtn2 click

	});// end of function
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

				<!-- Begin Page Content -->
				<div class="container container-fluid">

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
										<div class="col-5">
											<div class="row">
												<label class="col-sm-4 col-form-label">*시험 일자 : </label>
												<div class="col-sm-8">
													<input type="date" class="form-control form-control-sm"
														 name="examdate" id="examdate">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*시험명 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														name="examname" id="examname">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*수험번호 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
														name="examno" id="examno">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*이름 : </label>
												<div class="col-sm-8">
													 <input type="text" class="form-control form-control-sm"
														name="user_name" id="user_name">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*원점수 총합   : </label>
												<div class="col-sm-8"> 
													<input type="text" class="form-control form-control-sm"
													 name="original_score" id="original_score">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*표준점수 총합: </label>
												<div class="col-sm-8"> 
													<input type="text" class="form-control form-control-sm"
													 name="standard_score" id="standard_score">
												</div>
											</div>
											<div class="row">
												<label class="col-sm-4 col-form-label">*백분위 총합 : </label>
												<div class="col-sm-8">
													<input type="text" class="form-control form-control-sm"
													 name="percentile_score" id="percentile_score">
												</div>		
											</div> <!-- end of row -->
										</div> <!-- end of col-5 -->
										<!-- end of left -->
										
										<!-- right -->
										<div class="col-5">
										<button class="btn btn-info btn-circle btn-sm" id="infobtn2">
											<i class="fas fa-info-circle"></i>
										</button>
											<div class="col">
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
							<div class="col-4"></div>
								<div class="col-4">
									<a href="#" class="btn btn-primary btn-icon-split btn">
										<span class="icon text-white-50">
											<i class="fas fa-paper-plane"></i>
										</span>
										<span class="text">등록</span>
									</a>
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
</body>
</html>