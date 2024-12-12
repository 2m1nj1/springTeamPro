<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>tch_attendance_details.jsp</title>
    
	<!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>

<style>

.card-body {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.card-body .btn-group {
    margin-left: 1rem;
}

.btn {
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn-primary {
    background-color: #4e73df;
    border-color: #4e73df;
}

.btn-primary:hover {
    background-color: #375adf;
    border-color: #375adf;
}

</style>


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
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">[강사]출석부 상세보기</h1>

						 <div class="row">
						    <!-- 전체 출석 -->
						    <div class="col-lg-3 col-md-6 mb-4">
						        <a href="#" class="btn btn-primary btn-icon-split btn-lg w-100">
						            <span class="icon text-white">
						                <i class="fas fa-check-circle"></i>
						            </span>
						            <span class="text">
						                전체 출석 <span class="font-weight-bold ml-2">34</span>
						            </span>
						        </a>
						    </div>
						
						    <!-- 지각 -->
						    <div class="col-lg-3 col-md-6 mb-4">
						        <a href="#" class="btn btn-success btn-icon-split btn-lg w-100">
						            <span class="icon text-white">
						                <i class="fas fa-clock"></i>
						            </span>
						            <span class="text">
						                지각 <span class="font-weight-bold ml-2">4</span>
						            </span>
						        </a>
						    </div>
						
						    <!-- 조퇴 -->
						    <div class="col-lg-3 col-md-6 mb-4">
						        <a href="#" class="btn btn-warning btn-icon-split btn-lg w-100">
						            <span class="icon text-white">
						                <i class="fas fa-exclamation-triangle"></i>
						            </span>
						            <span class="text">
						                조퇴 <span class="font-weight-bold ml-2">2</span>
						            </span>
						        </a>
						    </div>
						
						    <!-- 결석 -->
						    <div class="col-lg-3 col-md-6 mb-4">
						        <a href="#" class="btn btn-danger btn-icon-split btn-lg w-100">
						            <span class="icon text-white">
						                <i class="fas fa-times-circle"></i>
						            </span>
						            <span class="text">
						                결석 <span class="font-weight-bold ml-2">1</span>
						            </span>
						        </a>
						    </div>
						</div>


                    <div class="row">
					    <!-- 파이 차트 -->
					    <div class="col-lg-6">
					        <div class="card shadow mb-4">
					            <div class="card-header py-3">
					                <h6 class="m-0 font-weight-bold text-primary">출석 비율</h6>
					            </div>
					            <div class="card-body">
					                <div class="chart-pie pt-4 pb-2">
					                    <canvas id="attendancePieChart"></canvas>
					                </div>
					                <!-- 2x2 Grid Legend -->
					                <div class="mt-3 d-flex flex-wrap justify-content-center">
					                    <div class="d-flex align-items-center mx-2 my-1">
					                        <i class="fas fa-square text-primary mr-2"></i> <span>출석</span>
					                    </div>
					                    <div class="d-flex align-items-center mx-2 my-1">
					                        <i class="fas fa-square text-success mr-2"></i> <span>지각</span>
					                    </div>
					                    <div class="d-flex align-items-center mx-2 my-1">
					                        <i class="fas fa-square text-warning mr-2"></i> <span>조퇴</span>
					                    </div>
					                    <div class="d-flex align-items-center mx-2 my-1">
					                        <i class="fas fa-square text-danger mr-2"></i> <span>결석</span>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>

                        <!-- 출석부 표 -->
                        <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">출석 기록</h6>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>날짜</th>
                                                <th>상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2024-12-01</td>
                                                <td>출석</td>
                                            </tr>
                                            <tr>
                                                <td>2024-12-02</td>
                                                <td>지각</td>
                                            </tr>
                                            <tr>
                                                <td>2024-12-03</td>
                                                <td>조퇴</td>
                                            </tr>
                                            <tr>
                                                <td>2024-12-04</td>
                                                <td>결석</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

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

    <!-- Page level custom scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- tch_attendance_details.jsp -->
    <script type="text/javascript">
	    // Pie Chart Example
	    var ctx = document.getElementById("attendancePieChart");
	    var attendancePieChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: {
	            labels: ["출석", "지각", "조퇴", "결석"],
	            datasets: [{
	                data: [34, 4, 2, 1],
	                backgroundColor: ['#4e73df', '#1cc88a', '#f6c23e', '#e74a3b'],
	                hoverBackgroundColor: ['#2e59d9', '#17a673', '#dda20a', '#be2617'],
	                hoverBorderColor: "rgba(234, 236, 244, 1)",
	            }],
	        },
	        options: {
	            maintainAspectRatio: false,
	            tooltips: {
	                backgroundColor: "rgb(255,255,255)",
	                bodyFontColor: "#858796",
	                borderColor: '#dddfeb',
	                borderWidth: 1,
	                xPadding: 15,
	                yPadding: 15,
	                displayColors: false,
	                caretPadding: 10,
	            },
	            legend: {
	                display: false, // Hide the default Chart.js legend
	            },
	            cutoutPercentage: 40, // Thicker doughnut
	        },
	    });
    </script>

</body>
</html>
