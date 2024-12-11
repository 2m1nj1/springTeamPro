$(function(){
	
	// ---------------------------------
	// 			 강좌 [상세] 버튼
	// --------------------------------- 
	$('table#courseList').on("click", "div.btnCourseDetail", function(){
		// 선택한 행의 pk(회원번호) 값
		let course_no = $(this).parents('tr').find('td').eq(1).text();
		window.location = "courseDetail?course_no=" + course_no; 
	}); // end of .on click()
});