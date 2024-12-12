$(function(){
	
		
	// ---------------------------------
	//     	date - 시작값 < 종료값 유지
	// ---------------------------------
		
		

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
		// input type="hidden" 에 pk값 지정
		$('input#' + modalId.replace("modal_", "") + "_pk").val(resultPk);
		
		// modal 닫기
		$('#' + modalId).modal('hide');
	
	}); // end of .click()
	
	
}); // end of .function()