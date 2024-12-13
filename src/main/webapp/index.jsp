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

    <title>comm_loginform.jsp</title>

   <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="resources/static/vendor/jquery/jquery.min.js"></script>
<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/static/js/sb-admin-2.min.js"></script>

<script type="text/javascript">
	$(function() {
		//'로그인' 버튼이 눌렸을 떄
		$('#Login').click(function() {
			alert("로그인 버튼 눌림!");

			//window.location = "userLogin.do"
			$('form[name="form"]').submit();
		});

	}); // end of function
</script>

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
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" name="form" action="userLogin.do" method="post">
                                        <div class="form-group">
                              
                                           <input type="text" class="form-control form-control-user"
                                                id="id" name="user_Id"
                                                placeholder="아이디를 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="Password" name="user_Pass" placeholder="비밀번호를 입력하세요.">
                                        </div>
                                        
                                                                                
                                        <div class="form-group">
                                            
                                            <div class="text-center">
										       <!-- 아이디 찾기 및 비밀번호 찾기 링크 추가 -->
										       <a class="small" href="comm_findId.do">아이디 찾기</a>
										       &nbsp;|&nbsp;
										       <a class="small" href="comm_findPass.do">비밀번호 찾기</a>
										    </div>
                                        </div>
                                      </form>
                                        <input type='button' value='Login' id='Login' class="btn btn-primary btn-user btn-block">
                                     
                                        <hr>
                                        <div style="display: flex; justify-content: center; gap: 20px; margin-top: 20px;">
	                                        <!-- 카카오 아이콘 -->
	                                        <a href="index.html">
										        <img src="resources/static/img/카카오.png" alt="kakao" style="height: 50px;">
										    </a>
										    <!-- 구글 아이콘 -->
										    <a href="index.html">
										        <img src="resources/static/img/구글.png" alt="google" style="height: 50px;">
										    </a>
										    <!-- Naver 아이콘 -->
										    <a href="index.html">
										        <img src="resources/static/img/네이버.png" alt="Naver" style="height: 50px;">
										    </a>
                                        </div>
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="comm_register.do">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    


</body>
<<<<<<< HEAD
=======

>>>>>>> origin/main
</html>