/*
	Author : Eric Richard Widmann
	Date : 9.24.2018
	Purpose :
		Script intended to contain function related to event listener managment.

    Update : Brady Opsahl 3.18.2019

*/

/*
	Instantiates all of the persistent listeners on the webapp
	Params :
		void
	Return :
		void

*/


function updateDOPercent(){
       let p = .96;
        let do1 = parseFloat($('.do1').val()),
            do2 = parseFloat($('.do2').val()),
            tempC= parseFloat($('.waterTemp').val());
            //console.log("%d %d %d",do1,do2,tempC);

        if(Number.isNaN(do1) || Number.isNaN(do2) || Number.isNaN(tempC)){
            $('.doPercent').html("-");
            return;
        }

        let avgDO = (do1+do2)/2,
            cStar = Math.exp(7.7117 - 1.31403 * Math.log(tempC + 45.93)),
            pWV = Math.exp(11.8571 - (3840.7 / (tempC + 273.15)) - (216961 / Math.pow((tempC + 273.15), 2))),
            theta = 9.75E-4 - (1.426E-5 * tempC) + (6.436E-8 * Math.pow(tempC, 2));

        let upper = ((1-pWV)/p)*((1-(theta*p)));
        let lower = ((1-pWV))*((1-theta));
        let cp = cStar * p *((upper)/(lower));
            final1 = (100*do1)/cp;
            final2 = (100*do2)/cp;

        let final = Math.min(final1,final2);
        $('.doPercent').html(`<div>${final.toFixed(3)}%</div>`);
        $('.doPercent').attr('value',final);
}

function initEventListeners(){

	//new log btn function

	$('.logBtn').on('click touch',()=>{
		emptyForm();
		logNumber = maxLogNumber + 1;
		$('.startPage').collapse('hide');
        $('.noNav').collapse('hide');
        $('.pages').collapse('show');
        $('.withNav').collapse('show');


	});
	//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
	//To reach the reviewLogs page
	$('.reviewLogsBtn').on('click touch', ()=>{
		location.href='reviewLogs.html'
	});

	//To get back to home
	$('.homeBtn').on('click touch', ()=>{
		location.href='index.html'
	});
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	//naviation menu
	$('.navbar .expandBtn').on('click touch',()=>{
		expandNavigation();
	});

	//help menu
	$('.topBar .topExpandBtn').on('click touch',()=>{
		expandTopBar();
	});


	//unexpand navigation modal
	$('.navbar .downarrow').on('click touch',()=>{
		$('.navbar').removeClass('expanded');
		$('.navoption').hide();
		setTimeout(()=>$('.expandBtn').fadeIn(500),100);
	});

	//unexpand help modal
	$('.topBar .downarrow').on('click touch',()=>{
		$('.topOption').hide();
		$('.topBar').removeClass('expanded');
		setTimeout(()=>$('.topExpandBtn').fadeIn(500),100);

	});

	//naviage to page clicked in nav menu
	$('.navoption:not(.downarrow)').on('click touch',function(){
		if($(this).hasClass('selected'))
			return;
		let page = $(this).attr('nav');
		changePage(Number(page));
	})

	//advance or regress page of form from arrow click
	$('.forward i').on('click touch',()=>changePage(currentPage+1));
	$('.back i').on('click touch',()=>changePage(currentPage-1));
  $('.backReview i').on('click touch',()=>reviewChangePage(1));

	$('.homeBtn').on('click touch',()=>{

		initLogs().then(fadeToHome);
	});

    // Shows first page at start (delete this once main page is back in)
    //document.getElementById("page1").show();

	//save the log in these events
	$('.inputField[type=text], textarea, inputField[type=number]').on('keyup',saveLog);
	$('input[type=checkbox]').on('click touch',saveLog);
	$('.inputField[type=date], .inputField[type=time], select').on('blur',saveLog);


	//Volunteer Event Listeners
	// addVolunteer event listener
    // appends new volunteerInput_ID formDiv to volunteerHolder div
    $('#addVolunteer').on('click touch', function() {

        //output test text to console
        console.log("Adding Volunteer");

        // max 10 volunteers
        if ($('.volunteerName').length >= 5) {
            alert("Max volunteers met!");
            return;
        }

        let num = $('.volunteerName').length;

        console.log("Num of volunteers: " + num);

        // create html for volunteer form
        var volunteerHTML =`
                <div class="row employee${num}">
                    <div class="col text-center">
                        <h2>Volunteer ${num + 1}</h2>
                    </div>
                </div>
                <div class="row employee${num}">
                        <div class="col text-center employee${num}">
                            <div class="fieldName employee${num}">Name</div>
                        </div>
                        <div class="col text-center employee${num}">
                            <input type="text" class="inputField volunteerName${num} volunteerName employee${num}">
                        </div>
                    </div>
                    <div class="row employee${num}">
                        <div class="col text-center employee${num}">
                            <div class="fieldName employee${num}">Date</div>
                        </div>
                        <div class="col text-center employee${num}">
                            <input type="date" class="inputField date${num} employee${num}">
                        </div>
                    </div>
                    <div class="row employee${num}">
                        <div class="col text-center employee${num}">
                            <div class="fieldName employee${num}">Activity</div>
                        </div>
                        <div class="col text-center employee${num}">
                            <input type="text" class="inputField volunteerActivity${num} employee${num}">
                        </div>
                    </div>
                    <div class="row employee${num}">
                        <div class="col text-center employee${num}">
                            <div class="fieldName employee${num} bottomEmp">Hours</div>
                        </div>
                        <div class="col text-center employee${num}">
                            <input type="text" class="inputField volunteerHours${num} employee${num} bottomEmp inputmode="numeric"">
                        </div>
                    </div>
            `;


        // put html into volunteerHolder div
        $(".volunteerHolder").append(volunteerHTML);

        // scroll down page to show removeVolenteer btn
        // $('html, body').animate({
        //     scrollTop: $("#removeVolunteer").offset().top
        // }, 1000);

        // $('.inputField[type=text], textarea, inputField[type=number]').off('keyup');
        // $('input[type=checkbox]').off('keyup');
        // $('.inputField[type=date], .inputField[type=time], select').off('blur');
        // $('.inputField[type=text], textarea, inputField[type=number]').on('keyup',saveLog);
        // $('input[type=checkbox]').on('click touch',saveLog);
        // $('.inputField[type=date], .inputField[type=time], select').on('blur',saveLog);

    });

    $('#removeVolunteer').on('click touch', function() {
        // get count of volunteer

        let num = $('.volunteerName').length-1;
        if ($('.volunteerName').length!=1)
            $(`.employee${num}`).remove();
        $('.mainContainer').scrollTop(0)
    });


    $('input[type=checkbox]').on('click touch',function(ev){
        ev.stopPropagation();
    });





    $('.inputField').on('click touch',function(){
        let ele = $(this).find('input[type=checkbox]');
        if(ele.length>0)
           ele.prop('checked',!ele.prop('checked'));
    });

    var updateDOTimeout;
    $('.waterTemp, .do1, .do2').on('keypress blur', (ev) => {
        //console.log('in');
        clearTimeout(updateDOTimeout);
        updateDOTimeout = setTimeout(updateDOPercent,50);
    });

    $('.toggleBtn').on('click touch',function(){
        $('.toggleBtn').removeClass('selected');
        $(this).addClass('selected');
        let submitted = $(this).hasClass('submitted');
        localforage.getItem('logs')
        .then((logs)=>{
            populateLogs(logs,submitted);
        });
    });

    $('.logo').on('click touch',()=>{
        openNav();
        //window.location.reload(false);
    });

    $('.submitBtnFinal').on('click touch',()=>{
        $('.submitBtnFinal').html("Submitting...");
         $('.submitBtnFinal').off('click touch');
        postToServer(currKey);
    });

    $('.submitAll').on('click touch',()=>{

        if($('.previousLogs'))

        $('.massUploadModal').fadeIn(500);



    });

    $('.massUploadModal.noBtn').on('click touch',()=>{
        $('.massUploadModal').fadeOut();
    });

    $('.massUploadModal .yesBtn').on('click touch',()=>{
        $('.massUploadModal .yesBtn').hide();
        $('.massUploadModal .noBtn').hide();
        $('.uploadingText').show();
        postAllToServer();

    });
}
