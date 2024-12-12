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

    <title>board_getBoardList</title>

    <!-- Custom fonts for this template-->
    <link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">
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

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
					    <li class="nav-item" role="presentation">
					        <a class="nav-link active" id="freeTab" href="#free" role="tab" aria-controls="free" aria-selected="true">자유</a>
					    </li>
					    <li class="nav-item" role="presentation">
					        <a class="nav-link" id="questionTab" href="#question" role="tab" aria-controls="question" aria-selected="false">질문</a>
					    </li>
					    <li class="nav-item" role="presentation">
					        <a class="nav-link" id="noticeTab" href="#notice" role="tab" aria-controls="notice" aria-selected="false">공지</a>
					    </li>
					</ul>

                    <!-- Tab content -->
                    <div class="tab-content" id="myTabContent">
                        <!-- 자유 Tab -->
                        <div class="tab-pane fade show active" id="free" role="tabpanel" aria-labelledby="freeTab">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-primary">자유 게시판</h6>
                                    <a href="board_insertBoard.do" type="button" class="btn btn-primary btn-user btn" style="padding: 8px 16px; height: 40px;">글쓰기</a>
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
                                                <c:if test="${board.board_Cate == '자유'}">
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

                        <!-- 질문 Tab -->
                        <div class="tab-pane fade" id="question" role="tabpanel" aria-labelledby="questionTab">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-primary">질문 게시판</h6>
                                    <a href="board_insertBoard.do" type="button" class="btn btn-primary btn-user btn" style="padding: 8px 16px; height: 40px;">글쓰기</a>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="questionTable" width="100%" cellspacing="0">
                                            <!-- 질문 게시판 DataTable 내용 -->
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
                                                <c:if test="${board.board_Cate == '질문'}">
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

                        <!-- 공지 Tab -->
                        <div class="tab-pane fade" id="notice" role="tabpanel" aria-labelledby="noticeTab">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-primary">공지 게시판</h6>
                                    <a href="board_insertBoard.do" type="button" class="btn btn-primary btn-user btn" style="padding: 8px 16px; height: 40px;">글쓰기</a>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="noticeTable" width="100%" cellspacing="0">
                                            <!-- 공지 게시판 DataTable 내용 -->
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
                                                <c:if test="${board.board_Cate == '공지'}">
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
                </div> <!-- End of Page Content -->
            </div> <!-- End of Main Content -->
        </div> <!-- End of Content Wrapper -->
    </div> <!-- End of Page Wrapper -->

   <!-- jQuery 먼저 로드 -->
<script src="resources/static/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap JS는 jQuery 이후에 로드 -->
<script src="resources/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- JQuery Easing, Custom JS 순서 -->
<script src="resources/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom JS -->
<script src="resources/static/js/sb-admin-2.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // Tab 클릭 버튼
        let btn_tab = $('ul#myTab a');

        // Tab 클릭 시 보일 내용
        let panelDivs = $('div#myTabContent > div.tab-pane');

        // 기본적으로 첫 번째 탭만 보이게 설정
        btn_tab.first().addClass('active'); // 첫 번째 탭을 active로 설정
        panelDivs.first().addClass('show active'); // 첫 번째 탭 내용만 보이게 설정

        // Tab 클릭 시 이벤트
        btn_tab.click(function(e){
            e.preventDefault();  // 기본 클릭 동작(링크 이동) 방지

            // 클릭한 탭 버튼
            let currentAnchor = $(this);

            // 해당 탭에 연결된 콘텐츠 영역
            let currentPanel = $(currentAnchor.attr('href'));

            // 기존 active 클래스 제거 및 콘텐츠 숨기기
            btn_tab.removeClass('active');
            panelDivs.removeClass('show active');

            // 현재 탭에 active 클래스 추가 및 해당 콘텐츠 보이기
            currentAnchor.addClass('active');
            currentPanel.addClass('show active');
        });
    });
</script>
</body>

</html>
