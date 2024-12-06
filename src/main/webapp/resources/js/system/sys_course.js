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
	// 		 	모달 - 분류 선택
	// ---------------------------------
	// jstree
	$('button#btnModal_course_cate').click(function(){
		
		$.ajax({
			type: 'post'
			, url: 'courseCateList'
			, dataType: 'json'
			, success: function(result){
				
				// json -> jstee 양식으로 변환
				let treeData = result.map(row => ({
				    id: row.course_cate_no
				    , parent: row.course_cate_upno === 0 ? "#" : row.course_cate_upno
				    , text: row.course_cate_name
				    , state: {
				    	opened: true
				    }
				})); // end of map()
				
				// 지정 위치에 jstree 생성
				$('#jstreeCourseCate').jstree({
					'core': {
						'data': treeData
						, 'multiple': false
			          }
					,'checkbox': {
					        'keep_selected_style': false
					        , 'three_state' : false
							, 'cascade' : 'none'
					    }
					, 'plugins': ['checkbox']
			    }); // end of jstree()
								
			} , error: function() {
				alert('모달 - 강좌 분류 목록 로딩 실패');
			}
		}); // end of .ajax()
	}); // end of .click()
	
	// [선택] 버튼 누르면, input에 값 지정
	$('button#btnCourseCateAdd').click(function(){
		let selected = $('#jstreeCourseCate').jstree('get_selected',true);
		
		$('input#courseCatePk').val(selected[0].id);
		$('input#courseCateText').val(selected[0].text);
		$('#modal_course_cate').modal('hide');
	}); // end of .click()
	
	
	// ---------------------------------
	// 		 	  교육과정 Front
	// ---------------------------------
	$('div#btnAddLecture').click(function(){
		
		let tr = $('<tr/>');
		
		 // 새로운 tr에 번호 추가
	    let rowCount = $('table#table_lecture tbody tr').length + 1; 
	    
	    
	    // 강의 회차 번호 input
	    let lectureNoInput = $('<input/>', {
	        type: 'text'
	        , class: 'form-control form-control-sm lectureNo'
	        , name: 'list[' + (rowCount-1) + '].lecture_rownum'
	        , value: rowCount
	        , readonly: true
	    }); // end of let
	    
	    // 강의명 input
	    let lectureNameInput = $('<input/>', {
	        type: 'text'
	        , class: 'form-control form-control-sm lectureName'
	        , name: 'list[' + (rowCount-1) + '].lecture_name'
	    }); // end of let
	    
	    // 강의내용 input
	    let lectureDetailInput = $('<input/>', {
	        type: 'text'
	        , class: 'form-control form-control-sm lectureDetail'
	        , name: 'list[' + (rowCount-1) + '].lecture_detail'
	    }); // end of let

	    tr.append($('<td/>').append(lectureNoInput));
		//tr.append($('<td/>').html('<input type="text" class="form-control form-control-sm lectureName" id="" name="" value="">'));
		//tr.append($('<td/>').html('<input type="text" class="form-control form-control-sm" id="" name="" value="">'));
	    tr.append($('<td/>').append(lectureNameInput));
	    tr.append($('<td/>').append(lectureDetailInput));
	    tr.append($('<td/>').html('<div class="btn btn-sm btn-secondary btnDeleteLecture"> <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></div>'));

		$('table#table_lecture tbody').append(tr);
		
		tr.find('td').eq(1).find('input').focus(); // 새로 생성된 td의 첫번째 input에 focus
		
		reNumber();
		$(window).scrollTop($(document).height()); // 스크롤을 가장 아래로
	}); // end of .click()
	
	$('table#table_lecture').on("click", "div.btnDeleteLecture", function(){
	    // 테이블에 tr이 1개일 때는 삭제 불가능
	    if ($('table#table_lecture tbody tr').length <= 1) {
	        return;  // click 이벤트 중단
	    } // end of if
	    
		$(this).closest('tr').remove();
		
		reNumber();
	}); // end of .on()
	
	function reNumber() {
		// 회차 넘버링 다시
		$('table#table_lecture tbody tr').each(function(index) {
			// lectureNo의 값을 설정
		    let lectureNoInput 		= $(this).find('.lectureNo');
		    let lectureNameInput 	= $(this).find('.lectureName');
		    let lectureDetailInput 	= $(this).find('.lectureDetail');
		    let newValue = index + 1;
		    
		    // 값 설정
		    lectureNoInput.val(newValue);
		    
		    // name 태그 재설정
		    lectureNoInput.attr('name', 'list[' + (newValue-1) + '].lecture_rownum');
		    lectureNameInput.attr('name', 'list[' + (newValue-1) + '].lecture_name');
		    lectureDetailInput.attr('name', 'list[' + (newValue-1) + '].lecture_detail');
		    
		    // HTML 속성 값 재설정
		    lectureNoInput.attr('value', newValue); // HTML에서 value 속성 업데이트
		}); 
	} // end of reNumber()
	
	
	// ---------------------------------
	// 			 강좌 [등록] 버튼
	// ---------------------------------
	$('div#btnCourseInsert').click(function(){
		
		// 강좌 정보
		//$('form#insertCourseForm').submit();
		$.ajax({
			type: 'post'
			, url: 'insertCourse'
			, data: $('form#insertCourseForm').serialize()
			, success: insertLectureList
			, error: function() {
			
			}
		});
		
		// 교육 과정
		function insertLectureList() {
			$('form#insertLectureForm').submit();	
		} // end of insertLectureList()
		
		
		// 강좌 일정
		
		
		
		
	}); // end of .click()
	
}); // end of function()