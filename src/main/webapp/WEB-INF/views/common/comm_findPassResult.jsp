<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>comm_findId</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
        /* 탭 내용과 탭 버튼 사이에 여백 추가 */
        .tab-content {
            margin-top: 20px; /* 탭과 내용 사이의 공간을 20px로 설정 */
        }
        
         .nav-tabs {
            display: flex;
            justify-content: center; /* 가운데 정렬 */
            width: 100%; /* 전체 너비를 사용하도록 설정 */
        }
        
        
    </style>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">아이디 / 비밀번호 찾기</h1>
                                        <p class="mb-4">
                                    </div>
                                    
                                    <!-- tab -->
									<div class="card shadow mb-4" >
										<div class="card-body" id="comm_findId_tab">
											<!-- 탭 버튼 -->
											<ul class="nav nav-tabs">
									            <li class="nav-item">
									                <a class="nav-link" aria-current="page" href="#tab_find_id">아이디 찾기</a>
									            </li>
									            <li class="nav-item">
									                <a class="nav-link active" href="#tab_find_pass">비밀번호 찾기</a> <!-- active를 비밀번호 찾기 탭으로 이동 -->
									            </li>
									        </ul>
                                    
		                                    <!-- 탭 내용 -->
											<div class="tab-content">
												<div class="tab-pane" id="tab_find_id">
													
													 <form class="user">
				                                        <div class="form-group">
				                                            <div class="input-group">												        
														        <input type="text" class="form-control form-control-user" id="InputPhone" placeholder="휴대전화 번호를 입력하세요.">														
														        <div class="input-group-append">
														            <button class="btn btn-primary" type="button">인증번호 전송</button>
														        </div>
														    </div>
				                                        </div>
				                                        <div class="form-group">				                                            
			                                                <div class="input-group">												        
														        <input type="text" class="form-control form-control-user" id="InputCode" placeholder="인증번호를 입력하세요.">														
														        <div class="input-group-append">
														            <button class="btn btn-primary" type="button">인증번호 확인</button>
														        </div>
														    </div>
				                                        </div>
				                                        <a href="login.html" class="btn btn-primary btn-user btn-block">
				                                            아이디 찾기
				                                        </a>
				                                     </form>
													
												</div>
												<div class="tab-pane active" id="tab_find_pass">
													
													<form class="user">
				                                        <div class="form-group">
				                                            <div class="input-group">												        
														        <input type="text" class="form-control form-control-user" id="InputPass2" placeholder="새로운 비밀번호를 입력하세요.">																												        
														    </div>
				                                        </div>
				                                        <div class="form-group">				                                            
			                                                <div class="input-group">												        
														        <input type="text" class="form-control form-control-user" placeholder="한번 더 입력하세요.">														
														        
														    </div>
													 	</div>
													 	
				                                        <a href="comm_loginform.do" class="btn btn-primary btn-user btn-block">
				                                            로그인 화면으로 돌아가기
				                                        </a>
				                                     </form>
				                                     
												</div>
											</div>										                                  
                                </div>
                            </div>
                        </div>
                    </div>
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

</body>
</html>