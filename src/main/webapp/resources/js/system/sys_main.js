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
	    change: changeEndTimeMin // 선택 값 변경 시 실행
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
	
	function changeEndTimeMin() {
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
        } // end of if

	} // end of function
	

	// ---------------------------------
	// 			전체 input 초기화
	// ---------------------------------
	$('a.btnConClear').click(function(){
		$('input').val("");
	}); 
	
	// ---------------------------------
	// 			    모달 띄우기
	// ---------------------------------
	$('.btnModal').click(function(){
		// click 한 btn의 id 값에 해당되는 modal 창을 연다.
		// e.g.) 
		// 	btn의 id 	: btnModal_course_instructor
		//  modal id 	: modal_course_instructor
		let target = $(this).attr("id").replace("btnModal_", "");
		
		$("#modal_" + target).modal(); // 모달 실행
	}); // end of .click()
	
	
	// ---------------------------------
	// 			모달에서 선택한 값
	//       기존 input의 val로 지정
	// ---------------------------------
	$('button.btnSysModalAdd').click(function(){
		
		let modalChk = $(this).attr("id"); // 모달 비교용 id
		
		
		let resultPk 	= $("input[type='radio']:checked").parents("tr").find('td').eq(1).html();
		let resultName 	= $("input[type='radio']:checked").parents("tr").find('td').eq(2).html();
		
		
		// 강의실 모달의 경우 모달을 다르게 만들어서... if문으로 값 변경
		if (modalChk == "btnClassroom") {
			resultPk 	= $("input[type='radio']:checked").parents("tr").find('.pkElement').val();
			resultName 	= $("input[type='radio']:checked").parents("tr").find('td').eq(1).html();
		} // end of if
		
		let selectedRs; 
		
		if (resultPk === undefined || resultName === undefined) {
			// 선택 값이 없을 시 
			selectedRs = "";
		} else {
			// 선택 값이 있을 시
			selectedRs = "(" + resultPk + ") " + resultName;;
		} // end of if
		
		// 열려있는 modal의 id 값
		let modalId = $(this).parents("div.modal").attr("id");
		
		// modal의 id 값을 이용하여, 짝이 되는 input에 value 지정
		$('input#' + modalId.replace("modal_", "")).val(selectedRs);
	
		// modal 닫기
		$('#' + modalId).modal('hide');
	
	}); // end of .click()
	
	
	// ---------------------------------
	// 			  요일/시간 선택
	// ---------------------------------
	$('.btnSetDayOfWeek').click(function(){
		// class에 'btn-primary' 가 있는지 확인
		if($(this).hasClass('btn-primary')) {
			$(this).removeClass('btn-primary');
		} else {
			$(this).addClass('btn-primary');
		} // end of if
	}); // end of .click()
	
	// [추가] 버튼 클릭 시, tagfiy를 통해 태그 생성
	$('.btnAddSch').click(function() {
		
		// btn-primary class를 가지고 있는 요소들(요일) List에 담기
		let getSeletedDateOfWeekList = $('div.btnSetDayOfWeek.btn-primary').toArray();
		let setStartTime = $('#setStartTime').val();
		let setEndTime = $('#setEndTime').val();
		
		// 시간을 둘 다 선택 했는지 확인
		if(setStartTime !== "" && setEndTime !== "") {
			// tagify 객체 생성 
			let input = document.querySelector('input#setDateOfWeekAndTime')
					,tagify = new Tagify(input);
			
			
			 let arrayList = [
		                         ["월", 9, 10],
		                         ["화", 10, 11],
		                         ["수", 8, 9]
		                     ];
			// 선택한 요일들을 각각 처리함 
			getSeletedDateOfWeekList.forEach(function(element) {
				
				
				let setDateOfWeek = $(element).html(); // 요일
			    const startHour = parseInt(setStartTime.split(":")[0], 10); 	// 시작 시간
		        const endHour 	= parseInt(setEndTime.split(":")[0], 10); 		// 종료 시간
			    
		       
			    let currArray = [];
			    
			    currArray.push(setDateOfWeek); // 요일 집어 넣기
			    for (let i = startHour; i <= endHour; i++) {
			    	currArray.push(i); // 시작 시간, 종료 시간을 포함하여 그 사이의 숫자를 모두 push
			    } // end of for
			    
			    
			    // 입력 받는 요일이, arrayList의 array들의 0번째 값과 동일한 경우
			    if(arrayList.some(array => array[0] === currArray[0])) {
			    	const isMatch = arrayList.some(array => 
			        array[0] === currArray[0] && 
			        array.slice(1).some(value => currArray.slice(1).includes(value))
				    );
	
				    console.log("겹치는 요일 있음! " + isMatch);  // 하나라도 일치하면 true, 아니면 false
			    } else {
			    	console.log("겹치는 요일 없음!");
			    }
			    
			    //console.log(array + " / " + array[0]);
			    
			    
			    // 검증 작업 후에 중복되는 구간이 없을 시, 아래 코드를 실행
			    let result = setDateOfWeek + " / " + setStartTime + " ~ " + setEndTime;
			    tagify.addTags([result]); // 결과 값을 태그로 추가
			    
			    
			}); // end of forEach()
			
			
		} // end of if 
		
		
	});

	
	
}); // end of .function()