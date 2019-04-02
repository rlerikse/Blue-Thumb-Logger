/*
	Author : Eric Richard Widmann
	Date : 9.24.2018
	Purpose :
		Contains functions associated with maintaing and query the data stored in the browsers localstorage via the use of localforage.js.


*/

var logNumber=0; //the current log number
var maxLogNumber = 0; //the highest log number for user
var currKey;



/*
	Formats a logs obj structure to compatiable with backend implementation
	Params:
		log - the log to format
	Return
		reformated obj.

*/
function formatVolunteers(log){
	let keys = Object.keys(log);
	let final = [];
	for(let k of keys){
		let ogKey = k;
		if(k.match(/volunteer/)){
			let index = parseInt(k[k.length-1]);
			if(Number.isNaN(index))
				continue;
			k = k.split(index
				+'');
			console.log(index);
			if(!final[index])
				final[index] = {};
			final[index][k] = log[ogKey];
		}
	}
	console.log(final);
	final.forEach((value,index)=>{



		value.name=		 value["volunteerName,"];
		value.hours=	 value["volunteerHours,"];
		value.activity = value["volunteerActivity,"];

	});
	log.volunteers = final;
	return log;
}

/*
	Post the log with the specified key to the server.
	Params:
		key - the "log"+lognumber of the log you are attempting to submit.
	Return
		void

*/
function postToServer(key){
	localforage.getItem('logs')
	.then((logs)=>{
		let log = logs[key];
		log = formatVolunteers(log);
		console.log(log);
		$.ajax({
			type : 'POST',
			contentType: "application/json; charset=utf-8",
			url : "sample",
			dataType: 'json',
			data : JSON.stringify(log),
			success : (response)=>{
				console.log(response);
				log.submitted = true;
				alert("Upload Success!");
				localforage.setItem('logs',logs)
				.then(()=>window.location.reload(false));
			},
			error : (response)=>{
				console.log(response);
				alert('Upload Failed!');
				window.location.reload(false);
				$('.uploadModal').fadeOut(300);

			}
		});

	})
}



/*
	Post all all unsubmitted logs to server.
	Params:
		void.
	Return :
		void
*/
function postAllToServer(){
	localforage.getItem('logs')
	.then(async (logs)=>{
		console.log(logs);
		for(let key in logs){
			let curr = logs[key];
			if(!curr.submitted){
				await new Promise((res,rej)=>{
					curr = formatVolunteers(curr);
					$.ajax({
						type : 'POST',
						contentType: "application/json; charset=utf-8",
						url : "sample",
						dataType: 'json',
						data : JSON.stringify(curr),
						success : (response)=>{
							curr.submitted = true;
							alert('Upload Success!');
							localforage.setItem('logs',logs)
							.then(res)
						},
						error : (response)=>{
							alert('Upload Failed!');
						}
					});
				});
			}

		}
		window.location.reload(false);
	});
}

/*
	Clears the fields of a form before loading.
	Params:
		void
	Return :
		void
*/
function emptyForm(){
	$('input').val('');
	$('textarea').val('');
	//TODO
}


/*
	Loads the final review page of a log whenever it is accessed.
	Params:
		void
	Return :
		void
*/
function populateFinalPage(){
	localforage.getItem('logs') //load the logs from memory
	.then((logs)=>{

		let log = logs[currKey]; //get our log at the
		for(let prop in log){

			let msg = log[prop]+"";

			if(log[prop]===false)
				msg="not observed";
			if(log[prop]===true)
				msg = "observed"
			$(`.${prop}Final`).html(msg);
		}
	});
}

/*
	Deletes log from local storage
	Parameters:
		key - key of to be deleted log in localstorage
	Return :
		A promise resoliving when localstorage has been succesfully updated
*/
function deleteLog(key){
	return localforage.getItem('logs')
	.then((logs)=>{
		delete logs[key];
		return localforage.setItem('logs',logs);
	})
	.catch((err)=>{
		console.log(err);
		console.err("!!FAILED TO DELETE LOG");
	});
}

/*
	Routine that populates the form fields with the saved values in localstorage.
	Parameters:
		key - key of the to be loaded data
	Return :
		void

*/
function loadForm(key){
	emptyForm();

	$('.noNav').collapse('hide');
	$('.withNav').collapse('show');

	let tmp = key.replace('log',''); //remove log prefix from the key to get the number
	logNumber = Number(tmp); //parse the string into a number
	localforage.getItem('logs') //load the logs from memory
	.then((logs)=>{
		let log = logs[key]; //get our log at the parameter key.
		currKey = key;
		if(log.doPercent){
			$('.doPercent').html(`<div>${log.doPercent.toFixed(3)}%</div>`);
			$('.doPercent').attr('value',log.doPercent);
		}
		//console.log(`::Number of volunteers : ${log.numberOfVolunteers}`);
		if(log.numberOfVolunteers>1){
			for(let i =0; i<log.numberOfVolunteers-1;i++)
				$('#addVolunteer').click();
		}
		console.log(log);
		for(let field in log){ //itwerage over the fields of the log
			let value = log[field];
			if(typeof value === "string") //if the field is a string, it goes to a text input
				$(`.${field}`).val(value);
			else if(value){ //or else it is a checkbox
				$(`input[val=${field}]`).prop('checked',true);
			}
			else{
				$(`input[val=${field}]`).prop('checked',false);
			}
		}
		$('.time').val(log['time']);
	})
	.then(()=>{
		$('.startPage').collapse('hide');
        $('.pages').collapse('show');
	});
}


/*
	Routine used to load all stored logs into the main menu and set their even listeners.
	Params:
		logs - the logs obj from localforage
		submitted - true if you wish to load the submitted logs, false otherwise
	Return:
		void
*/
function populateLogs(logs,submitted){
	if(!logs)
		return;
	$('.previousLogs').empty();
	let matched = 0;
	for(let key in logs){ // iterate KEY over logs
		let log = logs[key];
		let siteName = '-';
		if(log.siteName && log.siteName.length>0) //if the site name has been stored - set in memory
		if(log.submitted && !submitted)
			continue;
		else if (!log.submitted && submitted)
			continue;
		siteName = log.siteName;

		// HTML for each log entry on main page
		let html = `
		<div class="logEntry" key="${key}">
			<div class="row siteName">
				<div class="col">
					<u>Site Name: </u>${siteName}
				</div>
			</div>
			<div class="row timestamp">
				<div class="col">
					<u>Last Saved: </u>${log.timestamp}
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<div type="button" class="deleteBtn" submitted="${submitted}">
						<i class="fas fa-trash"></i>Delete
					</div>
				</div>
				<div class="col text-center">
					<div type="button" class="uploadBtn" submitted="${submitted}">
						<i class="fas fa-upload"></i>Submit
					</div>
				</div>
				<div class="col text-center">
					<div type="button" class="email" submitted="${submitted}">
						<i class="fas fa-envelope"></i>Email
					</div>
				</div>
			</div>
		</div>`;
		
		/* OLD HTML FOR LOGS
		<div class="logEntry" key="${key}">
			<div class="siteName">
				<u>Site Name</u>${siteName}
			</div>
			<div class="timestamp">
				<u>Last Saved</u>${log.timestamp}
			</div>
			<div class="mainMenuBtnContiner">
				<div type="button" class="deleteBtn" submitted="${submitted}">
					<i class="fas fa-trash"></i>Delete
				</div>
				<div type="button" class="uploadBtn" submitted="${submitted}">
					<i class="fas fa-upload"></i>Upload
				</div>
				<div type="button" class="email" submitted="${submitted}">
					<i class="fas fa-envelope"></i>Email
				</div>
			</div>
		</div>
		*/

		$('.previousLogs').append(html);
		matched++;
	}
	if(matched==0){
		let html = `
			<div class="noLogsAvilable">No Logs Stored!</div>
		`;
		$('.previousLogs').append(html);
		return;
	}

	//Add the event listeners associated with the populated DOM elements
	$(document).ready(()=>{
		$('.logEntry .siteName, .timestamp').off('click touch')
		$('.logEntry .siteName, .timestamp').on('click touch',function(){
			let key = $(this).parent().attr('key');

			loadForm(key);
		});

		// Upload Log Button
		/*$('.uploadBtn').on('click touch',function(){

			console.log("lk;jfsdakjlsfdaklj;dsfa");

            let it = $(this).parent().parent().parent(); //Parent class= logEntry. Both delete and upload access this parent attribute.
			let key = it.attr('key');

			$('.yesBtn, .noBtn').off('click touch');
			$('.uploadModal').fadeIn(300);
			$('.yesBtn').on('click touch',function(){

				$('.yesBtn, .noBtn').off('click touch');
				$('.yesBtn, .noBtn').hide();
				$('.uloading').fadeIn(100);
				if(navigator.onLine)
					postToServer(key);
				else{
					alert("You are offline!");
					$('.uploadModal').fadeOut(300);
				}




				// Call for other confirm functions
				initLogs();

			});
			$('.noBtn').on('click touch',function(){
				$('.uploadModal').fadeOut(300);
			})


		}); // should that semi colon be there?*/

		// Submit Modal, opens when Submit button clicked
		$('.uploadBtn').on('click touch', function(){

			let it = $(this).parent().parent().parent(); //Parent class= logEntry. Both delete and upload access this parent attribute.
			let key = it.attr('key');

			$('.submitModal').modal();
			$('.yesBtn').on('click touch',function(){

				if(navigator.onLine)
					postToServer(key);
				else{
					alert("You are offline!");
				}

				// Call for other confirm functions
				initLogs();

			});
		});

		// Delete Log Button
		/*$('.deleteBtn').on('click touch',function(){
			let it = $(this).parent().parent().parent();
			let key = it.attr('key');

			$('.yesBtn, .noBtn').off('click touch');
			$('.deleteModal').fadeIn(300);
			$('.yesBtn').on('click touch',function(){
				it.remove();
				console.log(key);
				deleteLog(key);

				$('.deleteModal').fadeOut(300);
				initLogs();

			});
			$('.noBtn').on('click touch',function(){
				$('.deleteModal').fadeOut(300);
			})


		});*/

		// Delete Modal, opens when Delete button clicked
		$('.deleteBtn').on('click touch',function(){

			let it = $(this).parent().parent().parent();
			let key = it.attr('key');

			$('.deleteModal').modal();
			$('.yesBtn').on('click touch',function(){
				it.remove();
				console.log(key);
				deleteLog(key);

				initLogs();

			});
		});

		$(".email").on('click touch', function(){
	        console.log("working");
	        var neededKey = $('.email').parent().parent().parent().attr('key'); // Currently just grabs the first log, needs to grab the corresponding log
	        console.log("neededkey: " +  neededKey);
	        var csv = getCSV(neededKey).then(function(data){
	            console.log(data);
	            var stuff = data.split(",");
	            console.log(stuff);
	            var mailTo = "mailto:?subject=Blue Thumb Logger&body=" + stuff;
	            console.log(mailTo);
	            window.location.href = mailTo;
	        });
	    });

		if($('.logEntry').length>3)
			$('.logEntry:last-of-type').css({"border-bottom":"0px"});
	});
}



/*
	Initialize the logs, set max log number ect.
	Params:
		void
	Return:
		void
*/
function initLogs(){
	if(!localforage){
		alert('failed to load localforage!');
		return;
	}

	return localforage.getItem('maxLogNumber')
	.then((result)=>{
		if(result)
			maxLogNumber = result;
	})
	.then(()=>localforage.getItem('logs'))
	.then((logs)=>{
		populateLogs(logs,false);
	})
	.catch((err)=>{
		console.error(err);
		console.error("!!ERROR INSTANTATING LOGS");
	});
}


/*
	Collect the data currently entered into the form.
	Parmeters :
		void
	Return :
		A promise which resolves once all the data has been collected.
*/
function collectCurrentData(){
	let result = {};
	return new Promise((res,rej)=>{

	//set timestamp
	let date = new Date();
	let timestamp = `${date.getMonth()+1}-${date.getDate()}-${date.getFullYear()} [${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}.${date.getMilliseconds()}]`
	result.timestamp = timestamp;


	result.numberOfVolunteers = $('.volunteerName').length;



	let doPercent = $('.doPercent').attr('value');
	if(!Number.isNaN(parseFloat(doPercent))){
		console.log('saved');
		result.doPercent = parseFloat(doPercent);
	}

	$('.inputField[type=date], .inputField[type=time]').each(function(){
		let it = $(this);
		let field = it.attr('class').split(' ')[1];
		result[field] = it.val();

	});

	//collect field
	$('.inputField[type=text], .inputField[type=number], textarea, select').each(function(){
		let it = $(this);
		let classes = it.attr('class').split(' ');
		let value = it.val();
		/* // Save result regardless if it has input or not yet
		if(value == '' || value ==' ') //no input yet
			return;
		*/
		for(var name of classes){
			if(name!='inputField'){
				result[name] = value;//save result
				break;
			}
		}
	}).promise()
	.done(()=>{
	$('input[type=checkbox]').each(function(){
		let it = $(this);
		let key = it.attr('val');
		//console.log(key);
		if(it.prop('checked'))
			result[key] = true;
		else
			result[key] = false;

	}).promise()
	.done(()=>res(result));
	});
	});
}


/*
	Used to load a log once it is clicked in the main menu. Populates the fields with the stored values.
	Params:
		key - the key of the log to load
	Return
		void

*/
function getLog(key){
	let tmp = key.replace('log',''); //remove log prefix from the key to get the number
	logNumber = Number(tmp); //parse the string into a number
	localforage.getItem('logs') //load the logs from memory
	.then((logs)=>{
		let log = logs[key]; //get our log at the parameter key.
		console.log(log)
		for(let field in log){ //itwerage over the fields of the log
			let value = log[field];
			if(typeof value === "string") //if the field is a string, it goes to a text input
				$(`.${field}`).val(value);
			else if(value){ //or else it is a checkbox
				$(`input[val=${field}]`).prop('checked',true);
			}
			else{
				$(`input[val=${field}]`).prop('checked',false);
			}
		}
	})

	return
}

/*
	Routine which save the current log.
	Parameter :
		void
	Return :
		void
*/
function saveLog(){

	let collectedData = null;
	collectCurrentData()
	.then((result)=>{
		collectedData = result; //collect the data
		return localforage.getItem('logs'); //get the log in memory
	})
	.then((logs)=>{
		if(!logs) //if there are no logs instantiate an obj
			logs = {}
		let key = 'log'+logNumber;
		logs[key] = collectedData; //write the collected results to the obj
		currKey=key;
		//console.log(logs[key]);
		return localforage.setItem('logs',logs); //save back into memory
	})
	.then(()=>{
		if(logNumber>maxLogNumber){ //if the logNumber is larger than the maxLogNumber - update the max log number

		maxLogNumber = logNumber;
		return localforage.setItem('maxLogNumber',maxLogNumber); //write max log number back into memory
		}
	})
	.catch((err)=>{
		console.log(err);
		console.error("!!LOG FAILED TO SAVE");
	});
}

/* Open Navigation Overlay*/
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

/* Close Navigation Overlay*/
function closeNav() {
    document.getElementById("myNav").style.width = "0";
}

function changePageFromMenu(page) {
	changePage(page);
	closeNav();
}