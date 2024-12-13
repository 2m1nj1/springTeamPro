$(function(){
	// ---------------------------------
	//     timpicker - 시작값 < 종료값 유지
	// ---------------------------------
	// default setting - startTime
	$('#setStartTime').timepicker({
	    timeFormat: 'HH:mm',
	    use24hours: true,
	    interval: 60,
	    minTime: '8',
	    maxTime: '23:00',
	    startTime: '08:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true,
	    change: setEndTimeMin // 선택 값 변경 시 실행
	});
	
	// default setting - endTime
	$('#setEndTime').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 60,
	    minTime: '8',
	    maxTime: '23:00',
	    startTime: '08:00',
	    use24hours: true,
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	
	// 시작시간 변경 시, 적용 함수
	function setEndTimeMin() {
		let selectedStartTime =  $('#setStartTime').val();
		
		// 값 선택 확인
		if (selectedStartTime) {
            // 선택한 시간을 Date 객체로 변환
            let [hours, minutes] = selectedStartTime.split(':').map(Number);
            let time = new Date();
            time.setHours(hours, minutes, 0);
            time.setHours(time.getHours() + 1);

            // 새로운 시간을 HH:mm 형식으로 변환
            let newTime = time.toTimeString().slice(0, 5);
            $('#setEndTime').timepicker('option', 'minTime', newTime);
            $('#setEndTime').val(""); // 선택한 종료 시간 초기화
        } // end of if

	} // end of setEndTimeMin()
		
});