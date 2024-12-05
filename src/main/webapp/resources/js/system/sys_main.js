$(function(){
	

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
	
	let arrayList = [];
	resetArrayList();
	
	// arrayList 초기화
	function resetArrayList() {
		arrayList = [];
	} // end of resetArrayList()
	
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
			    for (let i = 0; i < arrayList.length; i++) {
			    	
			    	// 첫번째 비교대상인 요일이 false면,
			    	// 시간대를 비교하지 않고 무조건 false를 return 해야되기 때문에 &&를 사용
			    	if(arrayList[i][0]===currArray[0] 
			    			&& arrayList[i].slice(1, -1).some(value => currArray.slice(1, -1).includes(value))) {
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
				    arrayList.push(currArray); // arrayList에 push
				    console.log(arrayList); // 확인용
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
	    
	    // 기존 arrayList에서 removeArray와 동일하지 않은 array들만 다시 arrayList에 저장
	    arrayList = arrayList.filter(array => !arraysAreEqual(array, removeArray));
	    // alert(`태그가 삭제되었습니다: ${e.detail.data.value}`);
		
		console.log(arrayList); // 확인용
	}); // end of .on()
	
	// 동일한 배열인지 비교하는 함수
	function arraysAreEqual(arr1, arr2) {
	    return arr1.length === arr2.length && arr1.every((value, index) => value === arr2[index]);
	}
	
	
}); // end of .function()