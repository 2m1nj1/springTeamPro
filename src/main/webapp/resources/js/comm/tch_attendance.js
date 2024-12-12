// 초기화 함수 (페이지 로드 시 데이터 표시)
$(document).ready(function() {
	// 초기 로드시 모든 출석 상태를 표시
	filterAttendance('전체');
	
	// 드롭다운 항목을 클릭했을 때
    $('#courseDropdown li').click(function() {
        // 선택된 강좌명을 가져옵니다.
        var selectedCourse = $(this).data('course');
        // 강좌명을 #attendedCourse 입력 필드에 반영합니다.
        $('#attendedCourse').val(selectedCourse);
    });
	
	// AJAX 요청
	$.ajax({
	    url: '../tch_attendance.do',  // 서버의 필터링을 처리하는 URL 
	    type: 'GET',
	    data: { examdate: selectedDate },  // 선택된 날짜를 서버로 전달
	    success: function(response) {
	        // 서버에서 반환된 데이터로 테이블 갱신
	        console.log(response);
	        updateAttendanceTable(response);
	        filterAttendance();
	    },
	    error: function(xhr, status, error) {
	        alert('출결 데이터를 가져오는 데 실패했습니다.');
	        console.log(error);
	    }	// end of error
	}); //end of ajsx
	
	 $('#courseDropdown > .dropdown-item').click(function() {
	        // 선택된 강좌명을 가져옵니다.
	        var selectedCourse = $(this).data('course');
	        // 강좌명을 #attendedCourse 입력 필드에 반영합니다.
	        $('#attendedCourse').val(selectedCourse);
	    });

	
}); //end of function



//출결 현황 선택시 목록에서 선택한 항목에 해당하는 목록만 보이기
function filterAttendance(status) {
 const rows = document.querySelectorAll("#attendanceList tbody tr");
 
 rows.forEach(row => {
     const attendanceStatus = row.querySelector("td:nth-child(5)").textContent.trim();	// trim 사용해서 공백제거
     if (attendanceStatus === status || status === '전체') {
         row.style.display = '';  // 필터링된 상태는 보이도록 설정
     } else {
         row.style.display = 'none';  // 필터링된 상태는 숨기도록 설정
     }
 }); // end of forEach
}	// end of 출결현황

        
//        $(document).ready(function() {
//            // 날짜 선택 이벤트 처리
//            $('#examdate').change(function() {
//                var selectedDate = $(this).val();  // 선택된 날짜를 가져옵니다.
//
//                // 날짜가 선택되지 않았으면 요청하지 않도록 처리
//                if (!selectedDate) {
//                    alert('날짜를 선택해주세요.');
//                    return;
//                }
//
//                // AJAX 요청
//                $.ajax({
//                    url: '../tch_attendance',  // 서버의 필터링을 처리하는 URL 
//                    type: 'GET',
//                    data: { examdate: selectedDate },  // 선택된 날짜를 서버로 전달
//                    success: function(response) {
//                        // 서버에서 반환된 데이터로 테이블 갱신
//                        updateAttendanceTable(response);
//                    },
//                    error: function(xhr, status, error) {
//                        alert('출결 데이터를 가져오는 데 실패했습니다.');
//                    }
//                });
//            });
//        });


