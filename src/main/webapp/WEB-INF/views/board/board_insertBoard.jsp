<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comm_insertBoard.jsp</title>

<!-- Custom fonts for this template-->
<link href="resources/static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- link -->
<!-- href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!-- rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/static/css/sb-admin-2.min.css" rel="stylesheet">

<!-- SmartEditor2 라이브러리  --> 
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
			<!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">커뮤니티</h1>

                <div class="tab-content" id="myTabContent">
			    <!-- 자유 Tab -->
				<form id="insertForm" action="saveBoard.do" method="post" class="tab-pane fade show active">
			        <div class="card shadow mb-4">
			            <div class="card-header py-3">
			                <h6 class="m-0 font-weight-bold text-primary">글쓰기</h6>
			            </div>
			            <div class="form-group">
				            <div class="d-flex">
			                    <select class="form-control mr-2" id="selcatd" name="board_Cate" style="width: 20%;">
			                        <option value="">카테고리 선택</option>
			                        <option value="자유">자유</option>
			                        <option value="질문">질문</option>	
			                        <option value="공지">공지</option>		                        
			                    </select>		                
			
			                <!-- 제목 -->
			                
			                    <input type="text" class="form-control" id="board_Title" name="board_Title" placeholder="제목을 입력하세요" style="width: 60%;">
			                	<input type="text" class="form-control" id="board_Writer" name="board_Writer" style="width: 20%;">
			                </div>
		                </div>
			            <!-- SmartEditor2 -->
			            <div class="jsx-2303464893 editor">
			                <div class="fr-box fr-basic fr-top" role="application">
			                    <div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;">
			                        <textarea name="board_Context" id="smartEditor" style="width: 100%; height: 412px;"></textarea>
			                    </div>
			                </div>
			            </div>
			        </div>
			
			        <!-- 저장 버튼 -->
			        <div class="d-flex justify-content-end">
			            <!-- 버튼을 <button> 태그로 변경 -->
			            <input type="submit" class="btn btn-primary btn-user btn" id="savebutton" name="savebutton"/>
			        </div>				
			    </form>
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

	<!-- Page level plugins -->
	<script src="resources/static/vendor/chart.js/Chart.min.js"></script>
	<script src="resources/static/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="resources/static/js/demo/chart-area-demo.js"></script>
	<script src="resources/static/js/demo/chart-pie-demo.js"></script>

	



</body>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
	sSkinURI : "resources/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
	fCreator : "createSEditor2",
	htParams : {
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,

		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,

		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false
	}
});

$(function() {
	$("#savebutton").click(function() {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
		//textarea의 id를 적어줍니다.

		var selcatd = $("#selcatd > option:selected").val();
		var title = $("#board_Title").val();
		var content = document.getElementById("smartEditor").value;;

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
			oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
			return;
		} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
		
		/* var result = confirm("발행 하시겠습니까?");
		
		if(result){
			alert("발행 완료"); */
			$("form#insertForm").submit();
		/* }else{
			return;
		} */
	});
})

</script>

</html>