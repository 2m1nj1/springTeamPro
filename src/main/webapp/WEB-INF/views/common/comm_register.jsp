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
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumZipCode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_Addr1").value = extraAddr;
                
                } else {
                    document.getElementById("user_Addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("user_Addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_Addr2").focus();
            }
        }).open();
    }
    
function check(){
	//주소 체크
	var zipcode = $("#zipcode").val();
	if(zipcode ==""){
		alert("도로명 검색을 누르세요.");
		$("#zipcode").focus();
		return;
	}
	document.form1.submit();
}
</script>
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
                            <form class="user" id="userinput" name="userinput" action="userInsert.do" method="post">
                                <!-- <div class="form-group row"> -->
                                   	<div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="InputId" name='user_Id'
                                            placeholder="아이디를 입력하세요.">
                                    </div>
                                    <!-- <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name">
                                    </div> -->
                                <!-- </div> -->
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="InputEmail" name='user_Email'
                                        placeholder="이메일을 입력하세요.">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="InputPassword" name="user_Pass" placeholder="비밀번호를 입력하세요.">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="RepeatPassword" placeholder="한번 더 입력하세요.">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="InputName" name="user_Name"
                                        placeholder="이름을 입력하세요.">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="phone" name="user_Tel"
                                        placeholder="휴대전화 번호를 입력하세요.( - 제외)">
                                </div>
                                
                                
                                <!-- 성별 선택 -->
							    <div class="form-group d-flex align-items-center">
								    <label for="gender" class="form-label mb-0" style="margin-right: 120px;">성별 </label>
								    <div class="d-flex align-items-center" >
								        <div class="form-check form-check-inline">
								            <input type="radio" class="form-check-input" id="male" value="m" name="user_Gender" >
								            <label class="form-check-label" for="male" style="margin-right: 60px;">남자</label>
								        </div>
								        <div class="form-check form-check-inline">
								            <input type="radio" class="form-check-input" id="female" value="f" name="user_Gender" >
								            <label class="form-check-label" for="female" >여자</label>
								        </div>
								    </div>
								</div>
                                
                                <div class="form-group d-flex align-items-center">
								    <label for="dob" class="form-label mb-0 me-4" style="margin-right: 80px;">생년월일</label>
								    <div class="d-flex">
								        <input type="number" id="year" name='user_Birthday' class="form-control me-2" placeholder="년" min="1900" max="2100" style="margin-right: 10px;">
								        <input type="number" id="month" name='user_Birthday' class="form-control me-2" placeholder="월" min="1" max="12" style="margin-right: 10px;">
								        <input type="number" id="day" name='user_Birthday' class="form-control" placeholder="일" min="1" max="31">
								    </div>
								</div>
                                
                                <!-- 도로명 주소 입력 및 검색 버튼 -->
								<div class="form-group">
								    <label for="roadAddress" class="form-label">주소</label>
								    <div class="d-flex">
									    <input type="text" id="zipcode" name="zipcode" class="form-control me-2" placeholder="도로명 주소를 입력하세요" style="flex-grow: 1;" readonly/>
									    <button type="button" class="btn btn-primary" onclick="daumZipCode()" style="flex-shrink: 0;">도로명 검색</button>
									</div>
								</div>
								
								<!-- 자동 채워지는 기본 주소 -->
								<div class="form-group">
								    <input type="text" id="user_Addr1" name="user_Addr1" class="form-control" placeholder="기본 주소" readonly/>
								</div>
								
								<!-- 상세 주소 입력란 -->
								<div class="form-group">
								    <input type="text" id="user_Addr2" name="user_Addr2" class="form-control" placeholder="상세 주소를 입력하세요" />
								</div>
                                
                                <!-- <a href="userInsert.do" class="btn btn-primary btn-user btn-block">
                                    가입하기
                                </a> -->
                                <input type='submit' name="join" id="join" value='가입하기' class="btn btn-primary btn-user btn-block">
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