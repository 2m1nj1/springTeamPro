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
	// 			  요일/시간 선택
	// ---------------------------------
	$('.btnSetDayOfWeek').click(function(){
		// class에 'btn-primary' 가 있는지 확인 (해당 class를 선택 여부로 판단)
		if($(this).hasClass('btn-primary')) {
			$(this).removeClass('btn-primary');
			$(this).removeClass('text-light');
		} else {
			$(this).addClass('btn-primary');
			$(this).addClass('text-light');
		} // end of if
	}); // end of .click()
	
	// tag를 추가할 input
	let inputTagify = document.querySelector('input#setDateOfWeekAndTime');
	// tagify 객체 생성
	let tagify = new Tagify(inputTagify);
	
	let arrayListSch = []; // 선택한 요일/시간을 저장해둘 공간 
	resetArrayListSch();
	
	// course_no (PK) 가져오기
	let courseNo = $('input#course_no').val();
	
	setCurrTagify();
	// ---------------------------------
	// 		 tagify 기존 값 불러오기
	// ---------------------------------
	function setCurrTagify () {
		$.ajax({
			type: 'post'
			, url: 'selectCourseSch'
			, data: {course_no : courseNo}
			, success: makeCurrTagify
			, error: function(){
				console.log("강좌 일정 로딩 실패");
			} 
		}); // end of ajax
		
		function makeCurrTagify(result) {
			//console.log(result)
			
			result.forEach(data => {
				const startTime = `${data.course_startTime}:00`;
			    const endTime = `${data.course_endTime}:00`;
			    
			    // 원하는 형식으로 데이터 조합
			    const result = `${data.course_dayOfWeek} / ${startTime} ~ ${endTime}`;
			    
			    // Tagify에 태그 추가
			    tagify.addTags([result]);
			    
			    
			    let currArray = [];
			    currArray.push(`${data.course_dayOfWeek}`); // currArray에 요일 push
			    
			    for (let i =  Number(data.course_startTime); i <= Number(data.course_endTime); i++) {
			    	currArray.push(i); // 시작 시간, 종료 시간을 포함하여 그 사이의 숫자를 모두 push
			    } // end of for
			    
			    arrayListSch.push(currArray);
			   
			});
			
			 console.log(arrayListSch);
		} // end of makeCurrTagify()
		
		
	} // end of setCurrTagify()
		
	
	// arrayList 초기화
	function resetArrayListSch() {
		arrayListSch = [];
	} // end of resetArrayListSch()
	
	// [추가] 버튼 클릭 시, tagfiy를 통해 태그 생성
	$('.btnAddSch').click(function() {
		$('div#chkAddResult').html("");
		//console.log(arrayList); // 확인용
		
		// btn-primary class를 가지고 있는 요소들(요일) List에 담기
		let getSeletedDateOfWeekList = $('div.btnSetDayOfWeek.btn-primary').toArray();
		let setStartTime = $('#setStartTime').val();
		let setEndTime = $('#setEndTime').val();
		
		// 요일/시작시간/종료시간을 모두 선택 했는지 확인
		if(getSeletedDateOfWeekList.length !== 0 && setStartTime !== "" && setEndTime !== "") {
			// tagify 객체 생성 
			//let input = document.querySelector('input#setDateOfWeekAndTime'),tagify = new Tagify(input);

			// 새로 넣을 값들이 기존 값List와 비교했을 때, 요일/시간이 겹치는지 확인
			getSeletedDateOfWeekList.forEach(function(element) {
				let setDateOfWeek = $(element).html(); // 선택 요일
			    const startHour = parseInt(setStartTime.split(":")[0], 10); 	// 선택 시작 시간
		        const endHour 	= parseInt(setEndTime.split(":")[0], 10); 		// 선택 종료 시간
		        
		        let chkAdd = true; // 추가 여부 
			    
		        let currArray = [];
			    currArray.push(setDateOfWeek); // currArray에 요일 push
			    
			    for (let i = startHour; i <= endHour; i++) {
			    	currArray.push(i); // 시작 시간, 종료 시간을 포함하여 그 사이의 숫자를 모두 push
			    } // end of for
			    
			    // arrayList.length 만큼 반복해서 요일/시간을 비교
			    for (let i = 0; i < arrayListSch.length; i++) {
			    	
			    	// 첫번째 비교대상인 요일이 false면,
			    	// 시간대를 비교하지 않고 무조건 false를 return 해야되기 때문에 &&를 사용
			    	if(arrayListSch[i][0]===currArray[0] 
			    			&& arrayListSch[i].slice(1, -1).some(value => currArray.slice(1, -1).includes(value))) {
		    			// arrayList의 array에 대해서 첫번째(요일), 마지막(종료시간)을 제외한 나머지 값을
			    		// currArray의 첫번째(요일)을 제외한 값과 비교
			    		// .slice() : 배열해서 원하는 구간의 요소만을 잘라서 씀 (변경 값 반영X)
			    		// .some()  : 1개라도 겹친다면 ture
			    		
			    		//console.log("요일과 시간 겹침!!!"); // 확인용
			    		chkAdd = false;
			    	} // end of if
		    	} // end of for
			    
			    
			    if(chkAdd) { // 조건 만족
				    let result = setDateOfWeek + " / " + setStartTime + " ~ " + setEndTime;
				    tagify.addTags([result]); // 태그로 추가
				    arrayListSch.push(currArray); // arrayList에 push
				    console.log(arrayListSch); // 확인용
			    } else { // 조건 만족 X
			    	$('div#chkAddResult').html("중복되는 요일/시간이 존재합니다.").addClass("text-danger");
			    } // end of if 
			    
			}); // end of forEach()
			
		} else {
			// 요일/시작시간/종료시간 중 하나라도 선택하지 않았다면
			$('div#chkAddResult').html("요일/시간을 선택해주세요.").addClass("text-danger").css("text-align", "center");
		} // end of if - check input
	}); // end of .click()
	
	// tagify 삭제 시
	tagify.on('remove', function(e) {
		
		let removeTag = e.detail.data.value; // 삭제 태그
		let removeDateOfWeek;
		let removeStartHour;
		let removeEndHour;
		
		// 정규식 이용
		const match = removeTag.match(/(\S+) \/ (\d{2}):\d{2} ~ (\d{2}):\d{2}/);
		
		if (match) {
			removeDateOfWeek = match[1];
		    removeStartHour = parseInt(match[2], 10);
		    removeEndHour = parseInt(match[3], 10);
		} // end of if
		
        let removeArray = [];
        removeArray.push(removeDateOfWeek); // removeArray에 요일 push
	    
	    for (let i = removeStartHour; i <= removeEndHour; i++) {
	    	removeArray.push(i); // 시작 시간, 종료 시간을 포함하여 그 사이의 숫자를 모두 push
	    } // end of for
	    
	    // 기존 arrayListSch에서 removeArray와 동일하지 않은 array들만 다시 arrayList에 저장
	    arrayListSch = arrayListSch.filter(array => !arraysAreEqual(array, removeArray));
	    // alert(`태그가 삭제되었습니다: ${e.detail.data.value}`);
		
		console.log(arrayListSch); // 확인용
	}); // end of .on()
	
	// 동일한 배열인지 비교하는 함수
	function arraysAreEqual(arr1, arr2) {
	    return arr1.length === arr2.length && arr1.every((value, index) => value === arr2[index]);
	} // end of arrayAreEqul()
		
	
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
		 let completedRequests = 0;
		 
		// 강좌 정보의 pk 를 강좌일정/교육과정 table에서 fk로 쓰고 있기 때문에 동시에 submit 할 수 없다.
		// 강좌 정보
		$.ajax({
			type: 'post'
			, url: 'insertCourse'
			, data: $('form#insertCourseForm').serialize()
			, success: function(result) {
				
				insertCourseSchList(result); 	// 강좌일정 
				insertLectureList(result); 		// 교육과정
				checkCompletion();
			}, error: function() {
				alert("강좌 등록 실패");
			}
		}); // end of .ajax
		
		// 강좌일정
		function insertCourseSchList(result) {
			
			let insertArrayListSch = arrayListSch.map(function(item) {
		        return {
		            course_schedule_no: 0,
		            course_no: result,
		            course_startTime: item[1],
		            course_endTime: item[2],
		            course_dayOfWeek: item[0]
		        };
		    }); // end of .map()
			
			$.ajax({
				type: 'post'
				, url: 'insertCourseSchList'
				, contentType: 'application/json'
				, data: JSON.stringify(insertArrayListSch)
				, success: function(){
					checkCompletion();
				}, error: function(){
					alert('강좌일정 등록 실패');
				}
			}); // end of .ajax()
		} // end of insertSchList()
		
		// 교육과정
		function insertLectureList(result) {
			$('<input>').attr({
				  type: 'hidden',
				  name: 'list[0].course_no',
				  value: result
			}).appendTo('form#insertLectureForm');
			
		    // let result = $('form#insertLectureForm').submit();
			$.ajax({
	            type: 'post',
	            url: $('form#insertLectureForm').attr('action'),
	            data: $('form#insertLectureForm').serialize(),
	            success: function () {
	                checkCompletion();
	            }, error: function () {
	                alert('교육과정 등록 실패');
	            }
	        }); // end of .ajax()
			
		} // end of insertLectureList()		
		
		// 요청을 모두 수행했는지 확인 후, 페이지 바꾸기
		function checkCompletion() {
			completedRequests++;
			
			if(completedRequests == 3) {
				 window.location.href = 'sys_course.do';
			} // end of if
		} // end of checkCompletion()
		
	}); // end of .click()

	
}); // end of function()