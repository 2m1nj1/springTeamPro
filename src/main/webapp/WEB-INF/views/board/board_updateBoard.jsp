<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_updateBoard.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<!-- SmartEditor2 라이브러리 -->
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

                    <form id="updateForm" action="updateBoard.do" method="post">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">게시글 수정</h6>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="d-flex">
                                    	<input type="text" class="form-control" id="board_No" name="board_No" value="${board.board_No}" readonly style="width: 10%; background-color: transparent; border: none;">
                                        <!-- 카테고리 -->
                                        <select class="form-control mr-2" id="board_Cate" name="board_Cate" style="width: 20%;">
                                            <option value="${board.board_Cate}" selected>${board.board_Cate}</option>
                                            <option value="자유">자유</option>
                                            <option value="질문">질문</option>
                                        </select>

                                        <!-- 제목 -->
                                        <input type="text" class="form-control" id="board_Title" name="board_Title" value="${board.board_Title}" placeholder="제목을 입력하세요" style="width: 70%;">
                                    </div>
                                </div>

                                <!-- 작성자 -->
                                <div class="form-group">
                                    <div class="d-flex">
                                        <label for="board_Writer" style="width: 10%; font-size: 1rem; line-height: 2.2; height: 38px;">작성자</label>
                                        <input type="text" class="form-control" id="board_Writer" name="board_Writer" value="${board.board_Writer}" style="width: 90%; background-color: transparent; border: none;">
                                    </div>
                                </div>

                                <!-- SmartEditor -->
                                <div class="editor">
                                    <div class="fr-box fr-basic fr-top" role="application">
                                        <div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;">
                                            <textarea name="board_Context" id="smartEditor" style="width: 100%; height: 412px;">${board.board_Context}</textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- 저장 버튼 -->
                        <div class="d-flex justify-content-end">
                            <input type="submit" class="btn btn-primary btn-user btn" id="updatebutton" name="updatebutton" value="수정 완료" />
                        </div>
                    </form>
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

    <!-- SmartEditor2 초기화 -->
    <script type="text/javascript">
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef : oEditors,
            elPlaceHolder : "smartEditor", 
            sSkinURI : "resources/se2/SmartEditor2Skin.html",
            fCreator : "createSEditor2",
            htParams : {
                bUseToolbar : true,
                bUseVerticalResizer : false, 
                bUseModeChanger : false 
            }
        });

        $(function() {
            $("#updatebutton").click(function() {
                oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 

                var selcatd = $("#selcatd > option:selected").val();
                var title = $("#board_Title").val();
                var content = document.getElementById("smartEditor").value;

                if (selcatd == "") {
                    alert("카테고리를 선택해주세요.");
                    return;
                }
                if (title == null || title == "") {
                    alert("제목을 입력해주세요.");
                    $("#board_Title").focus();
                    return;
                }
                if(content == "" || content == null || content == '&nbsp;' || 
                    content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
                    alert("본문을 작성해주세요.");
                    oEditors.getById["smartEditor"].exec("FOCUS"); // 포커싱
                    return;
                }

                $("form#updateForm").submit();
            });
        });
    </script>

</body>
</html>
