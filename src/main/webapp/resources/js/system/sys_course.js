$(function(){
	
	// ---------------------------------
	// 		모달 - 강사 목록 불러오기
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
			tr.append($('<td/>').html(row['user_no']).css('width', '20%').addClass('pkElement'));
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
	// 		모달 - 강의실 목록 불러오기
	// ---------------------------------
	$('button#btnModal_course_classroom').click(function(){
		selectClassroomList()
	}); // end of .click()
	
	function selectClassroomList() {
		$.ajax({
			type:'get'
			, url: '../classroomList'
			, dataType : 'json'
			, success : makeClassroomList
			, error : function(){
				alert ("모달 - 강의실 목록 로딩 실패");
			} 
		}); // end of .ajax() 
		
	} // end of selectClassroomList();
	
	
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
			tr.append($('<input/>').attr('type', 'hidden').attr('value', row['classroom_no']).addClass('hiddenPk').addClass('pkElement'));
			tr.append($('<td/>').html(row['classroom_name']).css('width', '40%'));
			tr.append($('<td/>').html(row['classroom_location']).css('width', '40%'));
			tr.append('<td><div class="btn-sm btn-secondary btnClassroomDetail"><i class="fa-solid fa-gear fa-sm" style="color: #ffffff;"></i></div></td>');
			
			resultTable.append(tr);
		} // end of for
		
		resultTable.find('tr').find('td').css('text-align', 'center');
		$('table#modalClassroomList').addClass('table-head-fix');
	} // end of makeTchList()
	
	
	// ---------------------------------
	// 		  모달 - 강의실 상세
	// ---------------------------------
	$('table#modalClassroomList').on("click", "div.btnClassroomDetail", function(){
		$.ajax({
			type:'get'
			, url: '../classroomDetail?classroom_no=' + $(this).parents('tr').find('input.hiddenPk').val()
			, dataType : 'json'
			, success : function(result){
				$('input#detailClassroomNo').val(result.classroom_no);
				$('input#detailClassroomName').val(result.classroom_name).removeAttr('readonly');
				$('input#detailClassroomLoc').val(result.classroom_location).removeAttr('readonly');
				
				$('div.btnDetail').show();
				
			} , error : function(){
				alert("모달 - 강의실 상세 로딩 실패")
			}
		}); // end of .ajax()
	}); // end of .on click()
	
	
	// ---------------------------------
	// 		  모달 - 강의실 수정
	// ---------------------------------
	$('div#btnClassroomUpdate').click(function(){
		// submit() 은 새로고침을 해서, modal창이 닫히기 때문에 ajax로 요청
		$.ajax({
			type: 'post'
			, url: '../updateClassroom'
			, data: $('form#classroomDetailForm').serialize()
			, success: selectClassroomList
			, error: function(){
				alert("모달 - 강의실 수정 실패");
			}
		}); // end of .ajax()
	}); // end of .click()
	
	
	// ---------------------------------
	// 		  모달 - 강의실 삭제
	// ---------------------------------
	$('div#btnClassroomDeleteOn').on("click", "div#btnClassroomDelete", function(){
		$.ajax({
			type: 'post'
			, url: '../deleteClassroom?classroom_no=' + $('input#detailClassroomNo').val()
			, success: function(){
				
				selectClassroomList();
				
				$('input#detailClassroomNo').val("");
				$('input#detailClassroomName').val("").attr("readonly", true);
				$('input#detailClassroomLoc').val("").attr("readonly", true);
				
				$('div.btnDetail').hide();
			} , error: function(){
				alert("모달 - 강의실 수정 삭제")
			}
		}); // end of .ajax()
	}); // end of .on click()
	
	
	// ---------------------------------
	// 		  모달 - 강의실 등록
	// ---------------------------------
	$('div#btnClassroomInsert').click(function(){
		// submit() 은 새로고침을 해서, modal창이 닫히기 때문에 ajax로 요청
		$.ajax({
			type: 'post'
			, url: '../insertClassroom'
			, data: $('form#classroomInsertForm').serialize()
			, success: function(){
				selectClassroomList();
				
				$('input#classroomName').val("");
				$('input#classroomLoc').val("");
				
			} , error: function(){
				alert("모달 - 강의실 등록 실패");
			}
		}); // end of .ajax()
	}); // end of .click()
	
	
	// ---------------------------------
	// 		모달 - 요일/시간 선택
	// ---------------------------------
	
}); // end of function()