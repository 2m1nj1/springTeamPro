$(function(){
	
	loadHomeworks();
	
	
	
	// ------------------------------------------
	// 					Tab 구현 js 
	// ------------------------------------------
	// Tab
	let btn_tab = $('div#tch_hom_tab a');

	// Tab 클릭 시 보일 내용
	let panelDivs = $('div#tch_hom_tab > div.tab-content > div.tab-pane');

	btn_tab.show();
	//panelDivs.hide();

	// default로 열려있는 tab 과 내용
	var lastAnchor	= btn_tab.filter('.active');
	var lastPanel	= $(lastAnchor.attr('href'));

	// Tab 클릭 시 이벤트
	btn_tab.click(function(){
		// 이벤트가 발생한 요소
		let currentAnchor	= $(this);

		// 이벤트가 발생한 요소의 속성 href 값
		let currentPanel	= $(currentAnchor.attr('href'));

		lastAnchor.removeClass('active');
		lastPanel.hide();

		currentAnchor.addClass('active');
		currentPanel.show();

		lastAnchor = currentAnchor;
		lastPanel = currentPanel;

	}); // end of .click()

	//체크박스 전체 선택 했을 때
	$('.checkbox_all').click(function() {
		// 모든 체크박스를 전체 선택/해제
		$('.checkbox').prop('checked', this.checked);
	});

	// 개별 체크박스 클릭 시 전체 선택 체크박스의 상태 업데이트
	$('.checkbox').click(function() {
		// 개별 체크박스가 모두 선택되었는지 확인하여 전체 선택 체크박스의 상태를 업데이트
		if ($('.checkbox:checked').length == $('.checkbox').length) {
			// 모든 개별 체크박스가 선택되었으면 전체 선택 체크박스를 체크
			$('.checkbox_all').prop('checked', true);
		} else {
			// 하나라도 선택되지 않으면 전체 선택 체크박스를 해제
			$('.checkbox_all').prop('checked', false);
		}
	}); // end of checkbox click

	var user_no 	= "${user_account.user_no}";  // JSP에서 user_account를 사용하여 user_no 가져오기
	var hw_course	= "${homework.hw_course}";
	var course_no 	= "${course.course_no}";
	
	// 메시지 목록을 AJAX로 불러오기
	function loadHomeworks() {
			$.ajax({
				url: '/teacher/tch_homework.do',  // 목록을 가져오는 AJAX 호출
				type: 'GET',
				success: function(response) {
					 //alert("성공");
								
					 var homeworks = response;  // 서버에서 받은 JSON 데이터를 그대로 사용

					// 받은 쪽지와 보낸 쪽지 목록을 구분하여 테이블에 추가
					var $tbody = $('#tb_hom_work .tbody_board');
					//var $sentTbody = $('#tab_msg_send .tbody_board');

					$tbody.empty(); 			// 받은 쪽지 목록 초기화
					//$sentTbody.empty();      	// 보낸 쪽지 목록 초기화

					
					// 
					homework.forEach(function(homework) {
						// 
						if (homework.hw_course === course.course_no) {
							var row = '<tr data_id=1"' + homework.hw_no + '">'
									+ '<td><input type="checkbox" class="checkbox"></td>'
									+ '<td>' + homework.user_no + '</td>'
									+ '<td>' + homework.user_name + '</td>'
									+ '<td><a href="tch_homework.do?hw_no=' + homework.hw_no + '">' + homework.hw_title + '</a></td>'
									+ '<td>' + formatDate(homework.hw_enddate) + '</td>'
									+ '<td>' + homework.service_no + '</td>'
									+ '</tr>';
							$tbody.append(row);
						}  //end of if

//						// 보낸 쪽지 목록을 추가
//						if (message.msg_sender === user_account.user_no) {
//							var row = '<tr data_id=2"' + message.msg_no + '">'
//									+ '<td><input type="checkbox" class="checkbox"></td>'
//									+ '<td>' + message.msg_sender + '</td>'
//									+ '<td><a href="comm_getMessage.do?msg_no=' + message.msg_no + '">' + message.msg_Title + '</a></td>'
//									+ '<td>' + formatDate(message.msg_Date) + '</td>'
//									+ '</tr>';
//							$sentTbody.append(row);
//						}  // end of if
					});  // end of forEach
				},			//end of success
				error: function(xhr, status, error) {
					//consol.log("ajax 요청 오류: ", sattus, error);
					//alert('쪽지 목록을 불러오는 데 실패했습니다.');
				}
			});  // end of ajax
		
//		// 서버로부터 데이터 받아오는 부분
//		fetch('/api/getReceivedMessages')
//		    .then(response => response.json())
//		    .then(data => renderMessages(data))
//		    .catch(error => console.error('Error fetching messages:', error));
	
			
			
			
//				// 메세지 목록 클릭시 상세페이지로 넘어가기
//				document.addEventListener('DOMContentLoaded', function() {
//			    // 받은 메시지 목록에서 클릭 이벤트 처리
//			    const receivedRows = document.querySelectorAll('#receivedMessagesTable tr');
//			    receivedRows.forEach(function(row) {
//			    			alert("여기까지 오나");
//			        row.addEventListener('click', function() {
//			            const messageId = row.querySelector('a').getAttribute('href');
//			            window.location.href = messageId;
//			        }); // end of click
//			    });		// end of forEach
//
//			    // 보낸 메시지 목록에서 클릭 이벤트 처리
//			    const sentRows = document.querySelectorAll('#sentMessagesTable tr');
//			    sentRows.forEach(function(row) {
//			        row.addEventListener('click', function() {
//			            const messageId = row.querySelector('a').getAttribute('href');
//			            window.location.href = messageId;
//			        });	// end of click
//			    });		// end of forEach
//			    				alert("다 왔다아");
//			}); 	// end of addEventListener 
			
		// 날짜 포맷팅 함수
		function formatDate(dateString) {
			var date = new Date(dateString);
			return date.toISOString().split('T')[0];  // yyyy-MM-dd 형식
		} 	// 날짜 포맷팅 함수 끝

		// 탭 전환시 메시지 목록 갱신
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			var target = $(e.target).attr("href");  // 활성화된 탭 확인
			if (target === '#tab_msg_recive') {
				loadMessages();  // 받은 쪽지 목록 갱신
			} else if (target === '#tab_msg_send') {
				loadMessages();  // 보낸 쪽지 목록 갱신
			}
		});  // 맵 전환시 메세지 목록 갱신 끝
	
	} // end of loadmessages 
	
}); // end of .function()