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

    <title>게시글 상세보기</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/static/css/sb-admin-2.min.css" rel="stylesheet">

    <style type="text/css">
        * {
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
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">커뮤니티</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" name="board_Cate">${board.board_Cate}</h6>
                        </div>
                        <div class="card-body">
                            <!-- 게시글 상세 내용 -->
                            <div class="form-group">
							    <div class="d-flex">
								    <input type="text" class="form-control" id="board_No" name="board_No" value="${board.board_No}" readonly style="width: 10%; background-color: transparent; border: none;">
								    <input type="text" class="form-control" id="board_Title" name="board_Title" value="${board.board_Title}" readonly style="width: 70%; background-color: transparent; border: none;">
									<input type="text" class="form-control ml-auto" id="board_Date" name="board_Date" value="${board.board_Date}" readonly style="width: 20%; background-color: transparent; border: none; text-align: right;">
								</div>
							</div>

                            <div class="form-group">
                            	<div class="d-flex">
                            	<label for="board_Writer" style="width: 11%; margin-left: 10px; font-size: 1rem; line-height: 2.2; height: 38px; display: flex; align-items: center;">작성자</label>
                                <input type="text" class="form-control" id="board_Writer" name="board_Writer" value="${board.board_Writer}" readonly style="width: 95%; background-color: transparent; border: none;">
                            	<label for="board_Cnt" style="width: 10%; font-size: 1rem; line-height: 2.2; height: 38px; display: flex; align-items: center;">조회수</label>
                                <input type="text" class="form-control ml-auto" id="board_Cnt" name="board_Cnt" value="${board.board_Cnt}" readonly style="width: 5%; background-color: transparent; border: none;">
                            	</div>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" id="board_Context" name="board_Context" rows="10" readonly>${board.board_Context}</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- 돌아가기 버튼 -->
                    <div class="d-flex justify-content-end">
                    	<a href="board_updateBoard.do?board_No=${board.board_No}" class="btn btn-warning btn-user btn">수정</a>
    					<a href="deleteBoard.do?board_No=${board.board_No}" class="btn btn-danger btn-user btn" style="margin-left: 10px;">삭제</a>
                        <a href="board_getBoardList.do" class="btn btn-primary btn-user btn" style="margin-left: 10px;">목록으로 돌아가기</a>
                    </div>
                </div> <!-- End of Page Content -->
            </div> <!-- End of Main Content -->
        </div> <!-- End of Content Wrapper -->
    </div> <!-- End of Page Wrapper -->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/static/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/static/js/sb-admin-2.min.js"></script>

</body>
</html>
