$(function(){
	
	
	let selectedTch = [];	// 선택 강사 담아 둘 배열
	let selectedItem = ''; 	// 선택 카테고리
	
	clickCateItem('.courseConGrade');
	clickCateItem('.courseConArea');
	clickCateItem('.courseConSubject')
	
	// 각 분류 클릭 시, 이벤트 함수
	function clickCateItem(clickItem) {
		// cateList 클릭 시, css 변경
		$('.courseConCard').on("click", clickItem, function(){
			$(clickItem).removeClass("courseConItemClick");
			
			if($(this).hasClass("courseConItemClick")) {
				$(this).removeClass("courseConItemClick");
			} else {
				$(this).addClass("courseConItemClick");
			} // end of if
			
			selectedTch = [] // 배열 초기화
			//console.log(selectedTch); // 확인용
			
			// 선택한 분류에 포함된 강좌를 담당하는 강사 불러오기
			selectedItem = $(this).find('div input').val();
			loadCategoryData(selectedItem, '#courseConTch', 'selectConTch', 'courseConTch');
			loadCourseList(selectedItem);
		}); // end of .on
	} // end of clickCateItem()
	
	
	// ----------------------------------
	// 		 분류 선택 시, 하위 분류 불러오기
	// ----------------------------------
	function loadCategoryData(selectedValue, targetDivSelector, url, newClass) {
		if(targetDivSelector === '#courseConTch') {
    		$.ajax({
    			type: 'post'
    			, url: url
    			, data: {selected: selectedValue}
    			, success: function(result) {
    				setTchList(result, targetDivSelector, newClass);
    			}, error: function(){
    				alert('강좌 분류 (강사) 불러오기 실패');
    			}
    		});
    	} else {
    		$.ajax({
    	        type: 'post'
    	        , url: url
    	        , data: {selected: selectedValue}
    	        , success: function(result) {
    	        	setCategoryList(result, targetDivSelector, newClass);
    	        }, error: function() {
    	            alert('강좌 분류 불러오기 실패');
    	        }
    	    });
    	} // end of if
	} // end of loadCategoryData()
	
	// 분류 List html 구성
	function setCategoryList(result, targetDivSelector, newClass) {
	    let resultDiv = $(targetDivSelector).find('.card-body');
	    resultDiv.empty();
	    
	    if(targetDivSelector === '#courseConArea') {
	    	$('#courseConArea').find('.card-body').empty();
	    	$('#courseConSubject').find('.card-body').empty();
	    } // end of if
	    
	    for (let row of result) {
	        let hiddenPKInput = $('<input/>', {
	            type: "hidden",
	            value: row['course_cate_no']
	        });

	        let textSpan = $('<span/>', {
	            class: 'text',
	            text: row['course_cate_name']
	        });

	        let colDiv = $('<div/>', {
	            class: 'col'
	        }).append(hiddenPKInput, textSpan);

	        let rowDiv = $('<div/>', {
	            class: 'row courseConItem ' + newClass // 여기에 newClass를 적용
	        }).append(colDiv);

	        resultDiv.append(rowDiv);
	    } // end of for
	} // end of setCategoryList()

	$('.courseConCard').on("click", ".courseConGrade", function() {
	    let selectedGrade = $(this).find('div input').val();
	    loadCategoryData(selectedGrade, '#courseConArea', 'selectCourseCateDownList', 'courseConArea');
	}); // end of .on()

	$('.courseConCard').on("click", ".courseConArea", function() {
	    let selectedArea = $(this).find('div input').val();
	    loadCategoryData(selectedArea, '#courseConSubject', 'selectCourseCateDownList', 'courseConSubject');
	}); // end of .on()
	

	// ----------------------------------
	// 			선택한 분류에 포함된
	//        강좌를 담당하는 강사 불러오기
	// ----------------------------------
	function setTchList(result, targetDivSelector, newClass) {
		let resultDiv = $(targetDivSelector).find('.card-body');
	    resultDiv.empty();

	    if(result.length === 0) {
	    	let textSpan = $('<span/>', {
	            class: 'text',
	            text: '해당 과목에 강사가 없습니다.'
	        });

	        let colDiv = $('<div/>', {
	            class: 'col'
	        }).append(textSpan);

	        let rowDiv = $('<div/>', {
	            class: 'row courseConItem ' + newClass // 여기에 newClass를 적용
	        }).append(colDiv);
	        
	    	resultDiv.append(rowDiv);
	    } else {
	    	for (let row of result) {
		        let hiddenPKInput = $('<input/>', {
		            type: "hidden",
		            value: row['user_no']
		        });
		        
		        let chkTch = $('<input/>', {
		        	type: "checkbox"
		        	, class: "chkBoxConTch"
		        	, name: "chkBoxConTch"
		        	, style: "margin-right: 10px;"
		        });

		        let textSpan = $('<span/>', {
		            class: 'text',
		            text: row['user_name']
		        });

		        let colDiv = $('<div/>', {
		            class: 'col'
		        }).append(chkTch, hiddenPKInput, textSpan);

		        let rowDiv = $('<div/>', {
		            class: 'row courseConItem ' + newClass // 여기에 newClass를 적용
		        }).append(colDiv);

		        resultDiv.append(rowDiv);
		    } // end of for
	    } // end of if
	} // end of setTchList()
	
	
	$('div#courseConTch').on("click", ".chkBoxConTch", function(e){
		e.stopImmediatePropagation();
		selectedTch = []; // 초기화
		
		// 현재 선택 중인 chkBoxConTch 를 배열화
		$('input.chkBoxConTch:checked').each(function(){
			selectedTch.push($(this).next('input').val());
		}); // end of .each()
		
		//console.log(selectedTch); // 확인용
		loadCourseList(selectedItem, selectedTch)
	}); // end of .on()
	
	
	// ----------------------------------
	//			선택한 조건에 해당하는
	//			 강좌 목록 불러오기
	// ----------------------------------
	function loadCourseList(selectedItem, selectedTch) {
		
		//console.log('>> .ajax 직전 선택 카테고리 : ' + selectedItem);
		//console.log('>> .ajax 직전 선택 강사 : ' + selectedTch);
		
		$.ajax({
			type: 'post'
			, url: 'selectConCourseList'
			, data: {
				selected: selectedItem
		        , checked: selectedTch
			} , dataType: 'json'
			, success: makeConCourseList
			, error: function(){
				alert('강좌 목록 조건 검색 실패');
			}
		}); // end of .ajax()
	} // end of loadCourseList()
	
	function makeConCourseList(courseInfoList) {
		// console.log(courseInfoList);
		// 검색 결과 수
		let cntConCourseList = courseInfoList.length;
		$('#cntConCourseList').html(cntConCourseList);
		
        let content = '';

        // 데이터 반복 처리
        courseInfoList.forEach(item => {
            let scheduleContent = '';
            // course_sch_list 배열 처리
            item.course_sch_list.forEach(schList => {
                scheduleContent += `
                    <div class="row">
                        <div class="col text-center">
                            <span class="text">${schList}</span>
                        </div>
                    </div>`;
            });

            // 각 강좌에 대한 HTML 생성
            content += `
                <div class="row">
                    <div class="col-1 d-flex justify-content-center">
                        <input type="checkbox">
                        <input type="hidden" value="${item.course_no}">
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <span class="text">${item.course_cate_name}</span>
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <span class="text">${item.course_instructor}</span>
                    </div>
                    <div class="col-5">
                        <div class="row">
                            <div class="col">
                                <h6 class="font-weight-bold text-primary" style="display: inline;">${item.course_name}</h6>
                            </div>
                        </div>
                        <hr/>
                        <div class="row">
                            <div class="col">
                                <span class="text">강좌 기간 : ${item.course_startDate}</span>
                                <span class="text"> ~ ${item.course_endDate} | </span>
                                <span class="text">${item.course_fee} 원</span>
                            </div>
                        </div>
                    </div>
            		<div class="col-1 d-flex justify-content-center align-items-center">
							<span class="text">${item.course_person}</span>
					</div>
                    <div class="col-2 d-flex justify-content-center align-items-center flex-column">
                        ${scheduleContent}
                    </div>
                    <div class="col-1 d-flex justify-content-center align-items-center">
                        <div class="btn btn-primary">담기</div>
                    </div>
                </div>
                <hr/>`;
        }); // end of forEach

        // 생성한 HTML을 페이지에 추가
        $('#conCourseList').html(content);
       
	} // end of makeConCourseList()
	
	
	// 선택한 강좌 배열 담기
	let selectedCourse = [];
	
	// ----------------------------------
	//			체크 박스 클릭
	// ----------------------------------
	$('#conCourseList').on("click", "input.chkCourseRegi", function(e){
		e.stopImmediatePropagation();
		selectedCourse = []; // 초기화
		
		// 현재 선택 중인 chkCourseRegi 를 배열화
		$('input.chkCourseRegi:checked').each(function(){
			selectedCourse.push($(this).next('input').val());
		}); // end of .each()
		
		// console.log(selectedCourse); // 확인용
		
		$('.cntChkCourse').html(selectedCourse.length);
	}); // end of .on()
	
	$('#btnCourseRegiPay').click(function(){
		if(selectedCourse.length > 0) {
			$.ajax({
				type: 'post'
				, url: 'courseRegiTimeTable'
				, data: {
					selectedCourse: selectedCourse
				} , dataType: 'json'
				, success: function(){
					//alert('결제 페이지 로딩 성공!')
				} , error: function(){
					//alert('결제 페이지 로딩 실패!');
				}
			}); // end of .ajax()
		} else {
			alert('결제할 강좌를 선택해주세요!');
		} // end of if
	}); // end of .click()
	
}); // end of function()