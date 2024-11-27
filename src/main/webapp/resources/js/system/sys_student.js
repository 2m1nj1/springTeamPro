$(function(){

	// ------------------------------------------
	// 					Tab 구현 js 
	// ------------------------------------------
	
	// Tab
	let btn_tab = $('div#sys_stu_tab a');
	
	// Tab 클릭 시 보일 내용
	let panelDivs = $('div#sys_stu_tab > div.tab-content > div.tab-pane');
	
	btn_tab.show();
	//panelDivs.hide();
	
	// default로 열려있는 tab 과 내용
	var lastAnchor	= btn_tab.filter('.active');
	var lastPanel	= $(lastAnchor.attr('href'));
	
	// Tab 클릭 시 이벤트
	btn_tab.click(function(){
		// 이벤트가 발생한 요소
		let currentAnchor	= $(this);
		
		// 이벤트가 발생한 요소의 속성 href 값
		let currentPanel	= $(currentAnchor.attr('href'));
		
		lastAnchor.removeClass('active');
		currentAnchor.addClass('active')
		
		lastPanel.hide();
		currentPanel.show();
		
		lastAnchor = currentAnchor;
		lastPanel = currentPanel;
		
	}); // end of .click()
	
	
}); // end of .function()