<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>stu_profileSetting.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
<script src="resources/static/vendor/jquery/jquery.min.js"></script>
<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="resources/static/js/sb-admin-2.min.js"></script>

<style type="text/css">
    /* 기본 글꼴 설정 */
    * {
        font-family: 'Noto Sans KR', sans-serif;
    }
    #addCareer, #removeCareer, #addBook, #removeBook {
        margin-bottom: 15px; /* 필요한 만큼 여백 조정 */
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

                <!-- 페이지 명 -->
                <h1 class="h3 mb-4 text-gray-800">수강생 상세</h1>

                <!-- 수강생 개인 정보 -->
                <div class="col-12">
                    
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">개인정보 설정</h6>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <!-- 왼쪽: 프로필 이미지 및 버튼 -->
                                    <div class="col-md-4">
                                        <!-- 프로필 이미지 출력 -->
                                       <div class="card mb-4">
									        <div class="card-body d-flex justify-content-center align-items-center">
									            <c:choose>
											        <c:when test="${fileSize == 0}">
											            <!-- 첨부파일이 없을 경우 기본 이미지 출력 -->
											            <img id="profileImage" src="resources/static/images/프로필사진.png" style="width: 150px; height: 150px;">
											        </c:when>
											        <c:otherwise>
											            <!-- 첨부파일이 있을 경우 업로드된 이미지 출력 -->
											            <img id="profileImage" src="" name="upload_Location"style="width: 150px; height: 150px;">
											        </c:otherwise>
											    </c:choose>
									        </div>
									    </div>

                                        <!-- 프로필 이미지 삭제/등록 버튼 -->
                                        <div class="row">
									        <div class="col">
									            <button type="button" class="btn btn-secondary btn-block" onclick="deleteImage()">삭제</button>
									        </div>
									        <div class="col">
									            <input type="file" id="file" name="file" style="display: none;" onchange="uploadImage(event)"/></button>
									            <button type="button" class="btn btn-primary btn-block" onclick="document.getElementById('file').click()">등록</button>
									        </div>
									    </div>
									</div>

                                    <!-- 오른쪽: 개인정보 항목 -->
                                    <div class="col-md-8">
                                    <form action="updateProfile.do" method="post">
                                        <div class="card-body">
                                        <input type="text" name="user_No" value="${log.user_No}" /> <%-- ${log.user_No} --%>
                                            <!-- 수강생 정보 항목 -->
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">이름</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="name" name="user_Name" value="${log.user_Name}" readonly>
                                                </div>
                                            </div>                                           
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">아이디</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="id" name="user_Id" value="${log.user_Id}" readonly>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">이메일</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="email" name="user_Email" value="${log.user_Email}">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학교</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="school" name="user_School">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학년</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control form-control-sm" id="grade" name="user_Grade">
                                                        <option value="1" ${user_Grade == '1' ? 'selected' : ''}>1학년</option>
                                                        <option value="2" ${user_Grade == '2' ? 'selected' : ''}>2학년</option>
                                                        <option value="3" ${user_Grade == '3' ? 'selected' : ''}>3학년</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학부모 연락처</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="parentTel" name="user_Parent_tel" value="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <a href="comm_findPassResult2.do" class="btn btn-secondary btn-block"><span class="text">비밀번호 변경</span></a>
                                                </div>                                                
                                                <div class="col">
                                                    <button type="submit" class="btn btn-primary btn-block">완료</button>
                                                </div>
                                            </div>  
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
	</div>
</div>

</body>

<script>
    function uploadImage(event) {
        const file = event.target.files[0]; // 선택된 파일
        if (file) {
            const reader = new FileReader(); // 파일 읽기
            reader.onload = function(e) {
                const img = document.getElementById('profileImage');
                img.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function deleteImage() {
        const img = document.getElementById('profileImage');
        img.src = "/resources/static/images/프로필사진.png";
        document.getElementById('file').value = '';
    }
    
    System.out.println("logvo: " + logvo);
    System.out.println("logvo user_No: " + logvo.getUser_No());
</script>


</html>
