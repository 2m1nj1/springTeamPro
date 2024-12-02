$(function(){
	
	// ----------------------------------
	//			초기 실행할 함수
	// ----------------------------------
	selectStuAllCount();	// 전체 수강생 수
	selectStuList(); 		// 수강생 목록
	
	
	// ----------------------------------
	//        	전체 수강생 수
	// ----------------------------------
	function selectStuAllCount() {
		$.ajax({
			type:'get'
			, url: '../stuAllCount'
			, dataType : 'text'
			, success : function(result){
				$('div#stuAllCount').html(result);
			}, error : function(){
				alert("전체 수강생 수 로딩 실패");
			}
		}); // end of .ajax
	} // end of selectStuCount()
	
	
	// ----------------------------------
	// 			수강생 목록 불러오기
	// ----------------------------------
	
	function selectStuList() {
		
		$.ajax({
			type:'get'
			, url: '../stuList'
			// , data : 검색 조건 설정 
			, dataType : 'json'
			, success : makeStuList
			, error : function(){
				alert("수강생 목록 로딩 실패");
			}
		}); // end of .ajax()
	} // end of selectStuList()
	
	function makeStuList(result) {
		let resultTable = $('table#stuList tbody');
		
		resultTable.empty();
		
		for(row of result) {
			let tr = $('<tr/>');
			
			tr.append('<td><input type="checkbox" name="chkStus" class="checkbox" width = "5%"></td>');
			tr.append($('<td/>').html(row['user_no']).css('width', '10%'));
			tr.append($('<td/>').html(row['user_name']).css('width', '15%'));
			tr.append($('<td/>').html((row['user_tel']			=== "" || row['user_tel'] === undefined) 		? "-" : row['user_tel']).css('width', '20%'));
			tr.append($('<td/>').html((row['user_parent_tel'] 	=== "" || row['user_parent_tel'] === undefined) 	? "-" : row['user_parent_tel']).css('width', '20%'));
			tr.append($('<td/>').html(row['user_signupdate']).css('width', '20%'));
			tr.append('<td><div id="btnStuDetail" class="btn btn-sm btn-secondary" width="10%"><i class="fas fa-magnifying-glass fa-xs text-gray-300"/></div></td>');
			
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		$('table#stuList').addClass('table-head-fix');
	} // end of makeStuList()
	
	
	// ----------------------------------
	// 		    수강생 상세 페이지 이동
	// ----------------------------------
	$('table#stuList tbody').on("click", "div#btnStuDetail" ,function(){

		// 선택한 행의 pk(회원번호) 값
		let user_no = $(this).parents('tr').find('td').eq(1).text();
		window.location = "stuDetail.do?user_no=" + user_no; 
	});
	
	// ----------------------------------
	// 		    수강생 정보 수정
	// ----------------------------------
	$('div#btnSave').click(function(){
		$('form#stuDetailForm').submit();
	}); 
	
	// ----------------------------------
	// 		       수강생 삭제
	// ----------------------------------
	$('button#btnDelete').click(function(){
		let user_no = $(this).val();
		window.location = "stuDelete.do?user_no=" + user_no;
	});

	// ----------------------------------
	// 		       수강생 등록
	// ----------------------------------
	$('div#btnInsert').click(function(){
		$('form#stuInsertForm').submit();
	}); // end of .click()
	
}); // end of function()