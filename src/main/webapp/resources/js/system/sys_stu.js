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
	//        	상태별 수강생 목록 보기
	// ----------------------------------
	function loadStudentList(url) {
	    $.ajax({
	        type: 'POST',
	        url: url,
	        success: makeStuList,
	        error: function () {
	            alert("수강생 목록 로딩 실패");
	        }
	    });
	} // end of loadStudentList

	$('#showAllStu').click(function () {
	    loadStudentList('showAllStu');
	});

	$('#showRegiStu').click(function () {
	    loadStudentList('showRegiStu');
	});
	
	$('#showNotRegiStu').click(function () {
	    loadStudentList('showNotRegiStu');
	});
	
	$('#showSecStu').click(function () {
	    loadStudentList('showSecStu');
	});
	
	
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
	}); // end of .on()
	
	// ----------------------------------
	// 		수강생의 수강 중인 강좌 - 수강 취소
	// ----------------------------------
	$('div#conCourseList').on("click", "div#btnStuDetailCourseCancel", function(){
		
		let stuUserNo = $('input#user_no').val();
		let cancelCourse = $(this).parents('div.stuDetailCourse').find('input.stuDetailCourseNo').val();
		
		$.ajax({
			type:'POST'
			, url: 'stuDetailCourseCancel'
			, data: {
						stuUserNo: stuUserNo
						,cancelCourse: cancelCourse
					}
			, success : makeDetailCourse
			, error : function(){
				alert("수강생 상세 - 수강 취소 실패");
			}
		}); // end of .ajax()
	}); // end of .on()
	
	function makeDetailCourse(courseInfoList){
		 let html = '';
	        courseInfoList.forEach(item => {
	            html += `
	            <div class="row stuDetailCourse">
	                <input class="stuDetailCourseNo" type="hidden" value="${item.course_no}">
	                
	                <div class="col-5">
	                    <div class="row">
	                        <div class="col">
	                            <h6 class="font-weight-bold text-primary" style="display: inline;">${item.course_name}</h6>
	                            <span class="text">&nbsp;|&nbsp;${item.course_instructor}</span>
	                            <span class="text">&nbsp;|&nbsp;${item.classroom_name}</span>
	                        </div>
	                    </div>
	                    <hr />
	                    <div class="row">
	                        <div class="col">
	                            <span class="text">강좌 기간 : ${item.course_startDate}</span>
	                            <span class="text"> ~ ${item.course_endDate}&nbsp;|&nbsp;</span>
	                            <span class="text">${item.course_fee}&nbsp;원</span>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-2 d-flex justify-content-center align-items-center flex-column">
	                    ${item.course_sch_list.map(sch => `
	                        <div class="row">
	                            <div class="col text-center">
	                                <span class="text">${sch}</span>
	                            </div>
	                        </div>
	                    `).join('')}
	                </div>
	                <div class="col-4 justify-content-center align-items-center">
	                    <div class="row">
	                        <div class="col">
	                            <span class="text">출석률 : </span>
	                            <span class="text">${item.attendance_rate}%</span>
	                        </div>
	                    </div>
	                    <hr/>
	                    <div class="row">
	                        <div class="col">
	                            <div class="progress" style="width: 100%;">
	                                <div class="progress-bar" role="progressbar"
	                                    style="width: ${item.attendance_rate}%;" 
	                                    aria-valuenow="${item.attendance_rate}" aria-valuemin="0" aria-valuemax="100">
	                                    ${item.attendance_rate}%
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-1 d-flex justify-content-center align-items-center">
	                    <div id="btnStuDetailCourseCancel" 
	                        class="btn btn-sm btn-secondary btn-block">수강<br>취소</div>
	                </div>
	            </div>
	            <hr />
	            `;
	        });

	        // 동적으로 생성된 HTML을 삽입
	        $('#conCourseList').html(html);
	} // end of makeDetailCourse()
	
	
	
	
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