$(function(){

	// 전체 input 초기화
	$('a.btnConClear').click(function(){
		$('input').val("");
	}); 
	
	$('button.btnModal').click(function(){
		// click 한 btn의 id 값에 해당되는 modal 창을 연다.
		// e.g.) 
		// 	btn의 id 	: btnModal_course_instructor
		//  modal id 	: modal_course_instructor
		$("#modal_" + $(this).attr("id").replace("btnModal_", "")).modal();
	}); // end of .click()
	
	
	$('button.btnSysModalAdd').click(function(){
		
		// 선택한 라디오의 바로 다음 열 값
		let selectedRs = $("input[type='radio']:checked").parent("td").next().html();
		
		// 열려있는 modal의 id 값
		let modalId = $(this).parents("div.modal").attr("id");
		
		// modal의 id 값을 이용하여, 짝이 되는 input에 value 지정
		$('input#' + modalId.replace("modal_", "")).val(selectedRs);
	
		// modal 닫기
		$('#' + modalId).modal('hide');
	
	});
	
	
}); // end of .function()