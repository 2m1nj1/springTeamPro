<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>stu_profile.jsp</title>

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
                                                <!-- 기본 이미지 -->
                                                <img id="profile_Img" src="" style="width: 150px; height: 150px;" alt="프로필 이미지"/>
                                            </div>
                                        </div>                                        
                                    </div>

                                    <!-- 오른쪽: 개인정보 항목 -->
                                    <div class="col-md-8">
                                        <div class="card-body">
                                        <input type="hidden" id="no" name="user_No" value="${log.user_No}" /> <%-- ${log.user_No} --%>
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
                                                    <input type="text" class="form-control form-control-sm" id="email" name="user_Email" value="${log.user_Email}" readonly>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학교</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="school" name="user_School" value="${log.user_School}" readonly>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학년</label>
                                                <div class="col-sm-8">                                                    
                                                    <input type="text" class="form-control form-control-sm" id="grade" name="user_Grade" value="${log.user_Grade}" readonly>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-4 col-form-label">학부모 연락처</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control form-control-sm" id="parentTel" name="user_Parent_tel" value="${log.user_Parent_tel}" readonly>
                                                </div>
                                            </div>                                           
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="freeTable" width="100%" cellspacing="0">
                                            <!-- 자유 게시판 DataTable 내용 -->
                                            <thead>
                                                <tr>
                                                    <th width="10%">번호</th>
                                                    <th width="10%">카테고리</th>
                                                    <th width="50%">제목</th>
                                                    <th width="10%">글쓴이</th>
                                                    <th width="10%">등록일</th>
                                                    <th width="10%">조회수</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${boardList}" var="board">
                                                <c:if test="${(board.board_Cate == '자유' || board.board_Cate == '질문') && board.board_Writer eq 181}">
                                                    <tr>
                                                        <td>${board.board_No}</td>
                                                        <td>${board.board_Cate}</td>
                                                        <td align="left"><a href="board_getBoard.do?board_No=${board.board_No}">${board.board_Title}</a></td>
                                                        <td>${board.board_Writer}</td>
                                                        <td>${board.board_Date}</td>
                                                        <td>${board.board_Cnt}</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                        </div>
                    
                </div>

            </div>
        </div>
	</div>
</div>

</body>

<script type="text/javascript">


</script>


</html>
