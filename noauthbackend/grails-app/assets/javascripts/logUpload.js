/**
 * Created by bakriz on 10/10/18.
 */

 
/*
	Uploads log to Blue Thumb Server
	Parameters:
		key - key of the target log in localstorage
	Return : 
		
*/

async function uploadLog(key) {
	console.log("\n\nuploadLog's key = " + key + "\n");
    var promises = [];
    var toUpload = null; // CSV as a string
	var uploadTarget = "https://www.bluethumb.org/logs/sanitaryData" // URL TO UPLOAD TO! CHANGE ME!
	
	//str = str.replace(/["]{2}/g, "null");
	var theCSV = '';
	try{
			theCSV = await getCSV(key);
			//theCSV.resolve();
			// Wait for it
			console.log("\nCSV got with no issues!\n");
			// Start construction of the survey clump
			toUpload = theCSV.toString(); 

			// get user name and password for encoding
			//var usrpw = $("#username-field").val()+":"+$("#password-field").val();

			console.log("toUpload", toUpload);
	}catch(err){
			console.log(err);
			console.log("\n!! FAILED TO FIND LOG !!\n");
			//alert("\n!! FAILED TO FIND LOG !!\n");
	}
	
    
/*
    // POST the clump
    promises.push({ // AJAX
        type: 'POST',
        //crossDomain: true, // CHECK IF VALID!
        contentType: 'application/json; charset=utf-8',
        url: uploadTarget,
        dataType: 'json',
        data: toUpload,getCSV
        //headers: {
        //    "Authorization": "Basic " + btoa(usrpw)
        //}, // SUCCESSFUL UPLOAD BELOW
        success: function (response) {
            alert("Report submitted successfully\n <details>" + response.responseText + "</details>");

            for(i = 0; i < surveys.length; i += 1) {
                if(surveys[i] != null) {
                    surveys[i].submitted = true;
                    localforage.setItem(surveys[i].id, surveys[i], toPage('home', false));
                }
            }
        }, // ERROR SECTION BELOW
        error: function (response) {
            var array = JSON.parse(response.responseText);
            var builtResponse = "";
            array.forEach(function(validationErr) {
               console.log("validationErr:",validationErr.validationErrors.validationErrors);
                builtResponse = builtResponse + "Issue with survey idNo " + validationErr.idNo + "\n";
                validationErr.validationErrors.validationErrors.forEach(function(msg) {
                    console.log("msg:",msg.message);
                   builtResponse = builtResponse + "\t" + msg.message + "\n";
                });
            });
            if (builtResponse == "") {
                builtResponse =  response.responseText;
            }

            if (response.status == 500) {
                alert("Problem with submit\nA survey with this location and date/time has already been submitted\n <details>" + builtResponse + "</details>");
            } else if (response.status == 400) {
                alert("Problem with submit\nThere was an issue with the data in the request\n <details>" + builtResponse + "</details>");
            } else if (response.status == 401) {
                alert("Problem with submit\nThere was an issue with sign-in/auth \n <details>" + builtResponse + "</details>");
            } else if (response.status == 404) {
                alert("Problem with submit\nUpload destination not found (404)@@@logUpload.js \n <details>" + builtResponse + "</details>");
            } else {
                alert("Problem with submit\n <details>", + builtResponse + "</details>");
            }
			return false;
        }
    });
    */
   
	for(let p of promises){
		await p;
	}
//    Promise.all(promises).then(function() { /* waiting for promises to return */ });
	return true;
};
