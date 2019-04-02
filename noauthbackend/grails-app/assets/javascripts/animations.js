/*
	Author : Eric Richard Widmann
	Date : 9.24.2018
	Purpose :
		Contains functions associated with website javascript triggered animations

	Updated : Brady Opsahl 3.18.2019

*/

var currentPage = 1; //current page of form
var animationLock = false; //global used to lock other animations from triggering during certain animations


function clearStyles(ele){
	console.log('clearing styles');
	ele.css({
		transition : '',
		transform : ''
	});
}

/*
	Used to change pages
	Params :
		page - the desired page to go to
*/
function changePage(page) {

	// Can't change from current page to current page
	if( currentPage == page ) {
		return;
	}

	console.log("Changing from page " + currentPage + " to page " + page);

	// Testing for populating final page
	if( page == 9 ) {
		populateFinalPage();
	}


	$('.page' + currentPage).collapse('hide');
	$('.page' + page).collapse('show');

	currentPage = page;
}


function reviewChangePage(page){

	if(animationLock)
		return;
	animationLock = true;

	if(page==9)
		populateFinalPage();



	const animationTiming = 500;
	$('.navoption.selected').removeClass('selected');
	$(`.navoption[nav=${page}]`).addClass('selected');

	let currentModal = $(`.modal[target=${currentPage}]`);
	let nextModal =  $(`.modal[target=${page}]`);
	return new Promise((res,rej)=>{
		currentModal.css({
		});
		setTimeout(res,animationTiming);
	})
	.then(()=>{
		currentModal.hide();
		currentModal.css({
			transform : ''
		});
		currentPage = page;
		nextModal.fadeIn(0,()=>animationLock=false);
	});
}




/*
	Despite misleading name - used to expand the help modal
	Params :
		void
	Return :
	 	void
*/
function expandTopBar(){


	const animationTiming = 300;

	return new Promise((res,rej)=>{
		$('.topExpandBtn').fadeOut();
		$('.topBar').css({
			transition : `all ${animationTiming}ms ease`
		});
		$('.topBar').addClass('expanded');
		setTimeout(res,animationTiming+100);
	})
	.then(()=>{
		$('.topOption').fadeIn(animationTiming);
	});
}


/*
	Fades out main menu
	Params :
		void
	Return :
	 	void
*/
function fadeOutMainMenu(){


	const animationTiming = 800;

	return new Promise((res,rej)=>{
		$('.mainMenu').css({
			transition : `transform ${animationTiming}ms ease`,
			transform : 'scale(.0001) rotate(15deg)'
		});
		setTimeout(res,animationTiming);
	});


}

/*
	Expands the page navigation menu
	Params :
		void
	Return :
	 	void
*/
function expandNavigation(){


	const animationTiming = 300;

	$('.expandBtn').fadeOut(300);
	return new Promise((res,rej)=>{
		let navbar = $('.navbar');

		navbar.css({
			transition : `all ${animationTiming}ms ease`,
		});
		navbar.addClass('expanded');
		setTimeout(res,animationTiming);
	})
	.then(()=>{
		$('.navoption').fadeIn(300);
	});
}

/*
    Fades to home
    Params:
        void
    Return :
        void
*/
function fadeToHome(){
	$('.topBar .downarrow').click();
	if($('.mainMenu:visible').length>0)
		return;

	const animationTiming = 300;
	$('.modal').fadeOut(animationTiming);
	$('.navbar').fadeOut(animationTiming);
	clearStyles($('.mainMenu'));
	$('.mainMenu').fadeIn(animationTiming);

	$('.navoption.selected').removeClass('selected');
	$(`.navoption[nav=1]`).addClass('selected');
	$('.navbar').removeClass('expanded');
	currentPage = 1;

	let maxVolunteer = $('.volunteerName').length;

	setTimeout(()=>{
		for(let i =1; i< maxVolunteer; i++)
			$(`.employee${i}`).remove();
	},1000);



	return new Promise((res,rej)=>setTimeout(res,animationTiming));
}
