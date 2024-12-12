$(function(){

   // 전체 선택 했을 때
    $('.checkbox_all').click(function() {
           // 모든 체크박스를 전체 선택/해제
           $('.checkbox').prop('checked', this.checked);
           		//alert("확인");
       });
    	
       // 개별 체크박스 클릭 시 전체 선택 체크박스의 상태 업데이트
       $('.checkbox').click(function() {
          // 개별 체크박스가 모두 선택되었는지 확인하여 전체 선택 체크박스의 상태를 업데이트
           if ($('.checkbox:checked').length == $('.checkbox').length) {
               // 모든 개별 체크박스가 선택되었으면 전체 선택 체크박스를 체크
               $('.checkbox_all').prop('checked', true);
           } else {s
               // 하나라도 선택되지 않으면 전체 선택 체크박스를 해제
               $('.checkbox_all').prop('checked', false);
           }
       });
   
    // 전체 선택 체크박스를 클릭했을 때 모든 체크박스를 선택/해제
    $('.checkbox_all').click(function() {
        var isChecked = this.checked;  // 전체 선택 체크박스의 상태를 가져옴
        $('.checkbox').prop('checked', isChecked);  // 모든 체크박스의 상태를 변경
    });

    // 개별 체크박스를 클릭했을 때 전체 선택 체크박스의 상태 업데이트
    $('.checkbox').click(function() {
        // 선택된 체크박스의 수가 전체 체크박스의 수와 같으면 전체 선택 체크박스를 체크
        var allChecked = $('.checkbox:checked').length === $('.checkbox').length;
        $('.checkbox_all').prop('checked', allChecked);  // 전체 선택 체크박스 상태 업데이트

        // 하나라도 체크되지 않으면 전체 선택 체크박스를 해제
        if ($('.checkbox:checked').length < $('.checkbox').length) {
            $('.checkbox_all').prop('checked', false);
        }
    });
      
}); // end of .function()