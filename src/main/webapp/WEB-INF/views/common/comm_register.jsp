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

    <title>comm_register.jsp</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user" action="register" method="post">
                                <!-- <div class="form-group row"> -->
                                   	<div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="InputId"
                                            placeholder="아이디를 입력하세요.">
                                    </div>
                                    <!-- <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name">
                                    </div> -->
                                <!-- </div> -->
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="InputEmail"
                                        placeholder="이메일을 입력하세요.">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="InputPassword" placeholder="비밀번호를 입력하세요.">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="RepeatPassword" placeholder="한번 더 입력하세요.">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="InputName"
                                        placeholder="이름을 입력하세요.">
                                </div>
                                
                                <!-- 성별 선택 -->
							    <div class="form-group d-flex align-items-center">
								    <label for="gender" class="form-label mb-0" style="margin-right: 120px;">성별 </label>
								    <div class="d-flex align-items-center">
								        <div class="form-check form-check-inline">
								            <input type="radio" class="form-check-input" id="male" name="gender" value="male">
								            <label class="form-check-label" for="male" style="margin-right: 60px;">남자</label>
								        </div>
								        <div class="form-check form-check-inline">
								            <input type="radio" class="form-check-input" id="female" name="gender" value="female">
								            <label class="form-check-label" for="female" >여자</label>
								        </div>
								    </div>
								</div>
                                
                                <div class="form-group d-flex align-items-center">
								    <label for="dob" class="form-label mb-0 me-4" style="margin-right: 80px;">생년월일</label>
								    <div class="d-flex">
								        <input type="number" id="year" class="form-control me-2" placeholder="년" min="1900" max="2100" style="margin-right: 10px;">
								        <input type="number" id="month" class="form-control me-2" placeholder="월" min="1" max="12" style="margin-right: 10px;">
								        <input type="number" id="day" class="form-control" placeholder="일" min="1" max="31">
								    </div>
								</div>
                                
                                <!-- 도로명 주소 입력 및 검색 버튼 -->
								<div class="form-group">
								    <label for="roadAddress" class="form-label">주소</label>
								    <div class="d-flex">
									    <input type="text" id="roadAddress" class="form-control me-2" placeholder="도로명 주소를 입력하세요" style="flex-grow: 1;" />
									    <button type="button" class="btn btn-primary" onclick="searchAddress()" style="flex-shrink: 0;">도로명 검색</button>
									</div>
								</div>
								
								<!-- 자동 채워지는 기본 주소 -->
								<div class="form-group">
								    <input type="text" id="basicAddress" class="form-control" placeholder="기본 주소" disabled />
								</div>
								
								<!-- 상세 주소 입력란 -->
								<div class="form-group">
								    <input type="text" id="detailAddress" class="form-control" placeholder="상세 주소를 입력하세요" />
								</div>
                                
                                <a href="login.html" class="btn btn-primary btn-user btn-block">
                                    가입하기
                                </a>
                            </form>
                                <!-- <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div> -->
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