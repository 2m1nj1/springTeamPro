$(function(){
	
	// ----------------------------------
	//			초기 실행할 함수
	// ----------------------------------
	selectTchAllCount();	// 전체 강사 수
	selectTchList(); 		// 강사 목록
	
	
	// ----------------------------------
	//        	전체 강사 수
	// ----------------------------------
	function selectTchAllCount() {
		$.ajax({
			type:'get'
			, url: '../tchAllCount'
			, dataType : 'text'
			, success : function(result){
				$('div#tchAllCount').html(result);
			}, error : function(){
				alert("전체 수강생 수 로딩 실패");
			}
		}); // end of .ajax
	} // end of selectStuCount()
	
	
	// ----------------------------------
	//        	상태별 강사 목록 보기
	// ----------------------------------
	function loadStudentList(url) {
	    $.ajax({
	        type: 'POST',
	        url: url,
	        success: makeTchList,
	        error: function () {
	            alert("강사 목록 로딩 실패");
	        }
	    });
	} // end of loadStudentList

	$('#showAllTch').click(function () {
	    loadStudentList('showAllTch');
	});

	$('#showRegiTch').click(function () {
	    loadStudentList('showRegiTch');
	});
	
	$('#showNotRegiTch').click(function () {
	    loadStudentList('showNotRegiTch');
	});
	
	$('#showSecTch').click(function () {
	    loadStudentList('showSecTch');
	});
	
	
	
	// ----------------------------------
	// 			강사 목록 불러오기
	// ----------------------------------
	function selectTchList() {
		$.ajax({
			type:'get'
			, url: '../tchList'
			// , data : 검색 조건 설정 
			, dataType : 'json'
			, success : makeTchList
			, error : function(){
				alert("강사 목록 로딩 실패");
			}
		}); // end of .ajax()
	} // end of selectStuList()
	
	function makeTchList(result) {
		let resultTable = $('table#tchList tbody');
		
		resultTable.empty();
		
		for(row of result) {
			let tr = $('<tr/>');
			
			tr.append('<td><input type="checkbox" name="chkStus" class="checkbox" width = "5%"></td>');
			tr.append($('<td/>').html(row['user_no']).css('width', '10%'));
			tr.append($('<td/>').html(row['user_name']).css('width', '15%'));
			tr.append($('<td/>').html((row['user_tel']			=== "" || row['user_tel'] === undefined) 		? "-" : row['user_tel']).css('width', '20%'));
			tr.append($('<td/>').html(row['user_email']).css('width', '20%'));
			tr.append($('<td/>').html(row['user_signupdate']).css('width', '20%'));
			tr.append('<td><div id="btnTchDetail" class="btn btn-sm btn-secondary" width="10%"><i class="fas fa-magnifying-glass fa-xs text-gray-300"/></div></td>');
			
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		$('table#tchList').addClass('table-head-fix');
	} // end of makeStuList()
	
	
	// ----------------------------------
	// 		    강사 상세 페이지 이동
	// ----------------------------------
	$('table#tchList tbody').on("click", "div#btnTchDetail" ,function(){

		// 선택한 행의 pk(회원번호) 값
		let user_no = $(this).parents('tr').find('td').eq(1).text();
		window.location = "tchDetail.do?user_no=" + user_no; 
	}); // end of .on click()
	
	
	// ----------------------------------
	// 		    강사 정보 수정
	// ----------------------------------
	$('div#btnSave').click(function(){
		$('form#tchDetailForm').submit();
	}); // end of .click()
	
	
	// ----------------------------------
	// 		       강사 삭제
	// ----------------------------------
	$('button#btnDelete').click(function(){
		let user_no = $(this).val();
		window.location = "tchDelete.do?user_no=" + user_no;
	}); // end of .click()

	// ----------------------------------
	// 		       강사 등록
	// ----------------------------------
	$('div#btnInsert').click(function(){
		$('form#tchInsertForm').submit();
	}); // end of .click()
	
	
	// 등록 취소
	$('#btnInsertCancel').click(function(){
		window.location = "sys_teacher.do";
	});
	
}); // end of function()