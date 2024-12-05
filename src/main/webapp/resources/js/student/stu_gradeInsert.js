$(function() {
	// infobtn1, infobtn2 버튼 옆에 문구 없으면 보이도록, 없으면 안 보이도록 토글.
	let txt1 = " * 표시는 필수기재항목. ";
	let txt2 = " * 응시 여부: 응시=1, 미응시=0. ";

	$('#infobtn1').click(function() {
		// 버튼 옆에 문구가 없으면 추가하고, 있으면 토글
		let infoText = $(this).next('.info-text');
		if (infoText.length == 0) {
			//문구 없으면 추가
			$(this).after('<span class="info-text">' + txt1 + '</span>')
		} else {
			// 문구 있으면 토글(보이거나 숨김)
			infoText.toggle();
		}

	});// end of #infobtn1 click

	$('#infobtn1').click(function() {
		let infoText = $(this).next('.info-text');
		if (infoText.length == 0) {
			$(this).after('<span class="info-text">' + txt2 + '</span>')
		} else {
			infoText.toggle();
		}
	});// end of #infobtn2 click

	
	$(document).ready(function () {
		
	    $("#stu_gradeInsertButton").on("click", function () {
	        // 폼으로부터 입력값 받아오는데... 유효성 검사 요함.
	        const data = {
	            exam_name: $("#exam_name").val()
	            ,exam_context: $("#exam_context").val()
	            ,exam_date: $("#exam_date").val()
	            ,user_no: $("#userNo").val()
	            ,user_name: $("#user_name").val()
	            ,original_score: $("#original_score").val()
	            ,percentile_score: $("#percentile_score").val()
	            ,kor: $("#kor").val()
	            ,kor_took: $("#kor_took").is(":checked") ? 1 : 0 
	            ,math: $("#math").val()
	            ,math_took: $("#math_took").is(":checked") ? 1 : 0 
	            ,eng: $("#eng").val()
	            ,eng_took: $("#eng_took").is(":checked") ? 1 : 0 
	        };

	        // 백단에 AJAX.
	        $.ajax({
	            type: "POST",
	            url: "insertGradesAndExams",
	            contentType: "application/json",
	            data: JSON.stringify(data),
	            success: function (response) {
	                if (response === "successInsertGradesAndExams") {
	                    alert("성적 정보 입력 성공! [학생]성적조회 화면으로 돌아갑니다.");
	                    
	                    // stu_grade.jsp 로 돌아감.
	                    window.location.href="stu_grade.do" //currently showing 404...ㅠㅠ
	                } else {
	                    alert("Grade + Exam 데이터 DB 삽입 실패! 재시도 요망.");
	                }
	            },
	            error: function () {
	                alert("An error occurred while inserting data via ajax.");
	            }
	        });
	    });

	    // 추가 기능 예시;
	    function refreshGradeList() {
	        $.ajax({
	            type: "GET",
	            url: "stu_grade", 
	            success: function (data) {
	                $("#gradeTable").html(data); // Assuming your table has id="gradeTable"
	            },
	            error: function () {
	                alert("Failed to refresh grade list.");
	            }
	        });
	    }
	});
		
});// end of function