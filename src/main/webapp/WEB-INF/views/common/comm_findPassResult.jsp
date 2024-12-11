<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>comm_findPassResult.jsp</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        .tab-content {
            margin-top: 20px;
        }
        .nav-tabs {
            display: flex;
            justify-content: center;
            width: 100%;
        }
    </style>
    
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">아이디 / 비밀번호 찾기</h1>
                                    </div>
                                    <div class="card shadow mb-4">
                                        <div class="card-body" id="comm_findId_tab">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link" aria-current="page" href="#tab_find_id">아이디 찾기</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" href="#tab_find_pass">비밀번호 찾기</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab_find_pass">
                                                    <form class="user" method="POST" action="changePass.do">
                                                    	<input type="text" id="user_Email" name="user_Email" value="${user_Email}">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control form-control-user" id="user_Pass" name="user_Pass" placeholder="새로운 비밀번호를 입력하세요.">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control form-control-user" id="user_Pass2" placeholder="한번 더 입력하세요.">
                                                            </div>
                                                        </div>
                                                        <button type='submit' class="btn btn-primary btn-user btn-block">비밀번호 변경</button>
                                                        <a href="comm_loginform.do?user_No=value" class="btn btn-primary btn-user btn-block">
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
        </div>
    </div>
    <script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/static/js/sb-admin-2.min.js"></script>
</body>
</html>
