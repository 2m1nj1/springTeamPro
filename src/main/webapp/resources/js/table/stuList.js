$(function(){
	
	// ----------------------------------
	// 			수강생 목록 불러오기
	// ----------------------------------
	selectStuList();
	
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
			
			tr.append('<td><input type="checkbox" name="students"></td>');
			tr.append($('<td/>').html(row['user_no']));
			tr.append($('<td/>').html(row['user_name']));
			tr.append($('<td/>').html(row['user_tel']));
			tr.append($('<td/>').html(row['user_parent_tel']));
			tr.append($('<td/>').html(row['user_signupdate']));
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		
	} // end of makeStuList()
	
	
}); // end of function()