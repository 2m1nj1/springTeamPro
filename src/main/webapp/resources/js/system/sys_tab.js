$(function(){

	// ------------------------------------------
	// 					Tab 구현 js 
	// ------------------------------------------
	
	const tabBtns = document.querySelectorAll('.tab-wrap > li > a');
	const tabConts = document.querySelectorAll('.tab-content > div');

	tabBtns.forEach((btn, index) => {
	  btn.addEventListener('click', () => {
	    tabBtns.forEach(otherBtn => {
	      otherBtn.classList.remove('active');
	    });
	    tabConts.forEach(othercont => {
	      othercont.classList.remove('active');
	    });
	    tabBtns[index].classList.add('active');
	    tabConts[index].classList.add('active');
	  });
	});
	
}); // end of .function()