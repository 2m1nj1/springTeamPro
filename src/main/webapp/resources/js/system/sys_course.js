$(function(){
	
	// ---------------------------------
	// 			 강사 목록 불러오기
	// ---------------------------------
	$('button#btnModal_course_instructor').click(function(){
		$.ajax({
			type:'get'
			, url: '../tchList'
			, dataType : 'json'
			, success : makeTchList
			, error : function(){
				alert ("모달 - 강사 목록 로딩 실패");
			} 
		}); // end of .ajax() 
	}); // end of .click()
	
	function makeTchList(result) {
		let resultTable = $('table#modalTchList tbody');
		
		resultTable.empty();
		
		for(row of result) {
			let tr = $('<tr/>');
			
			tr.append('<td><input class="chk_tch" type="radio" name="chk_selector" width="10%"></td>');
			tr.append($('<td/>').html(row['user_no']).css('width', '20%'));
			tr.append($('<td/>').html(row['user_name']).css('width', '30%'));
			tr.append($('<td/>').html(row['user_tel']).css('width', '40%'));
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		$('table#modalTchList').addClass('table-head-fix');
	} // end of makeTchList()
	
	
	// ---------------------------------
	// 		   모달 - 강사 키워드 검색
	// ---------------------------------
	$('div#btnOptSelectTch').click(function(){
		let selectedOpt = $(this).parents('div.modal-body').find('div select').val();
		let selectKeyWord = $('input#selectKeyWord').val();
		
		if(selectedOpt == 0) {
			$(this).parents('div.modal-body').find('div select').focus().click();
		} else if (selectedOpt == 1) {
			$.ajax({
				type:'get'
				, url: '../tchList?user_no=' + selectKeyWord
				, dataType : 'json'
				, success : makeTchList
				, error : function(){
					alert ("모달 - 강사 목록 로딩 실패");
				} 
			}); // end of .ajax() 
		} else {
			$.ajax({
				type:'get'
				, url: '../tchList?user_name=' + selectKeyWord
				, dataType : 'json'
				, success : makeTchList
				, error : function(){
					alert ("모달 - 강사 목록 로딩 실패");
				} 
			}); // end of .ajax()
		} // end of if
	}); // end of .click() 
	
	
	// ---------------------------------
	// 		   모달 - 강의실 키워드 검색
	// ---------------------------------
	$('div#btnOptSelectClassroom').click(function(){
		
		let selectKeyword = $('input#selectKeyword').val();
		
		$.ajax({
			type:'get'
			, url: '../classroomList?classroom_name=' + selectKeyword
			, dataType : 'json'
			, success : makeClassroomList
			, error : function(){
				alert("모달 - 강의실 목록 로딩 실패")
			}
		}); // end of .ajax() 
	}); // end of .click()
	
	
	function makeClassroomList(result) {
		let resultTable = $('table#modalClassroomList tbody');
		
		resultTable.empty();
		
		for(row of result) {
			let tr = $('<tr/>');
			
			tr.append('<td><input class="chk_classroom" type="radio" name="chk_selector" width="10%"></td>');
			tr.append($('<td/>').html(row['classroom_no']).css('width', '30%'));
			tr.append($('<td/>').html(row['classroom_name']).css('width', '30%'));
			tr.append($('<td/>').html(row['classroom_location']).css('width', '30%'));
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		$('table#modalClassroomList').addClass('table-head-fix');
	} // end of makeTchList()
	
	
}); // end of function()