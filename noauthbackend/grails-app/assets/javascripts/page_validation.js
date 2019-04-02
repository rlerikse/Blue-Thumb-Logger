
/**
 * The method of displaying this information to the user can be altered to be made prettier if we want.
 *
 * @param msg   feedback message given by system.  Usually an error stacktrace
 */

 
function valAlert (msg) {
    //console.log("\n\nThe following form validation error occurred:\n" + msg + "\n");
    alert("\n\nThe following form validation error occurred:\n" + msg + "\n");
	//throw 401;
	return false;
}

// Test if the pre-decimal part of the input number is too large for the database column
function isShorterThan(candidate, value){

    let num = Math.ceil(Number(candidate));

    if (value < num.toString().length){
        return false;
    }

    return true;
}

// Value used for isLongerThan call
function isEmptyOrIsNonnegativeInteger (candidate, value) {

    if (candidate === "" || candidate == null) {
        return true;
    }

    let num = Math.floor(Number(candidate));

    // if (num >= 0 && num == parseInt(Number(candidate), 10)){
    if (Number.isInteger(Number(candidate))){
		if (num < 0){
			return false;
		}
        if(isShorterThan(candidate, value)){
            return true;
        }
    }

    return false;

}

function isEmptyOrIsInteger (candidate) {

    if (candidate === "" || candidate == null) {
        return true;
    }

    let num = Math.floor(Number(candidate));

    // if (num == parseInt(Number(candidate), 10)){
    if(Number.isInteger(Number(candidate))){
        return true;
    }

    return false;

}

function isEmptyOrIsIntegerDegree (candidate) {

    if (candidate === "" || candidate == null) {
        return true;
    }

    let num = Math.floor(Number(candidate));

    if (num >= 0 && num <= 360 && Number.isInteger(Number(candidate))){
        return true;
    }

    return false;

}

// maxlen used for isShorterThan
// neg: true if number can be negative
function isNumeric(val, maxlen, neg) {

    let len;
    let decimalPoint;
    let i;
    let j;
    let ch;

    val = "" + val;
    len = val.length;
    decimalPoint = false;

    for (i = 0; i < len; i++) {

        ch = val.charAt(i);

        if (ch === ".") {
            if (decimalPoint === true) {
                return false;
            }
            decimalPoint = true;
            if (!isShorterThan(val, maxlen)){
                return false;
            }
        } else if (ch === "-") {
            if (neg == false || i != 0){
                return false;
            }
        }
        else {
            for (j = 0; j < 10; j++) {
                if (ch === "0123456789".charAt(j)) {
                    break;
                }
            }
            if (j === 10) {
                return false;
            }
        }
    }
    if(!decimalPoint && !isShorterThan(val, maxlen)){
        return false;
    }

    return  true;

}

/*
function isEmpty(canidate){
	if (candidate === "") {
        return true;
    }
	return false;
}
*/

function isPH (candidate) {

    if (candidate === "" || candidate == null) {
        return true;
    }

    let num = parseFloat("" + candidate);
    if (isNumeric(candidate, 2, false) === true && num >= 0 && num <= 14) {
        return true;
    }

    return false;

}

/**
 * Checks fields based on what page number is supplied.
 * Warns is invalid input is present
 *
 * @param curPage(int), totalQuestionPages(int)
 * @returns {boolean}
 */
async function validatePage (CD, curPage, totalQuestionPages){
	/* New Log Page */
	let bit_limit1 = 127;// Please match that values!
	let v = ",";
	
    if (curPage === 0 || curPage === totalQuestionPages) {
        // The input types do that
    }
    /* Site Conditions */
    if (curPage === 1 || curPage === totalQuestionPages) {
		let secchi_depth 		= CD["secciDepth"];		// Needs Validation POSITIVE
        let air_temp 			= CD["airTemp"];		// Needs Validation Clamping
        let water_temp 			= CD["waterTemp"];		// Needs Validation Clamping
		
		let h = Math.pow(2, bit_limit1); // Lets hope this doesnt overflow!
		let l = -1*h 
		
		if (isEmptyOrIsNonnegativeInteger(secchi_depth) === false) {
			return valAlert("Secchi depth is out of range " + secchi_depth);
            //return false;
		}
		if (air_temp < l || air_temp > h) {
			return valAlert("AIR TEMP is out of range...\n(Whats the future like?)");
            //return false;
		}
		if (water_temp < l || water_temp > h) {
			return valAlert("WATER TEMP is out of range");
            //return false;
		}
    }

    /* Observations Page */
    if (curPage === 2 || curPage === totalQuestionPages) {
		// Currently not needed for any vars
    }

    /* Bacteria Data */
    if (curPage === 3 || curPage === totalQuestionPages) {

        // Not requested?
    }

    /* DO & pH Page */
    if (curPage === 4 || curPage === totalQuestionPages) {
		
		let do_1 = CD["do1"]; 						// Needs Validation
        let do_2 = CD["do2"];						// Needs Validation
        let ph_1 = CD["ph1"];						// Needs Validation PH
        let ph_2 = CD["ph2"];						// Needs Validation PH
		
		if (isEmptyOrIsNonnegativeInteger(do_1) === false) {
            return valAlert("DO 1 level is not valid: " + do_1);
            //return false;
        }
		if (isEmptyOrIsNonnegativeInteger(do_2) === false) {
            return valAlert("DO 2 level is not valid" + do_2);
            //return false;
        }
        if (isPH(ph_1) === false) {
            return valAlert("pH 1 level is not in the inclusive range of 0 to 14. " + parseFloat(ph_1));
            //return false;
        }
        if (isPH(ph_2) === false) {
            return valAlert("pH 2 level is not in the inclusive range of 0 to 14." + parseFloat(ph_2));
            //return false;
        }
    }

    /* Nitrogen Page */
    if (curPage === 5 || curPage === totalQuestionPages) {
        let nitrate_1 = CD["nitrateTest1"];				// Needs Validation    
        let nitrate_2 = CD["nitrateTest2"];				// Needs Validation
		
        let nitrite_1 = CD["nitriteTest1"];				// Needs Validation
        let nitrite_2 = CD["nitriteTest2"];				// Needs Validation

        let ammonia_1 = CD["ammoniaNTest1"];				// Needs Validation
        let ammonia_2 = CD["ammoniaNTest2"];				// Needs Validation
		
		if (isEmptyOrIsNonnegativeInteger(nitrate_1) === false) {
            return valAlert("Nitrate 1 is not valid");
            //return false;
        }
        if (isEmptyOrIsNonnegativeInteger(nitrate_2) === false) {
            return valAlert("Nitrate 2 is not valid");
            //return false;
        }
        if (isEmptyOrIsNonnegativeInteger(nitrite_1) === false) {
            return valAlert("Nitrite 1 is not valid");
            //return false;
        }
        if (isEmptyOrIsNonnegativeInteger(nitrite_2) === false) {
            return valAlert("Nitrite 2 is not valid");
            //return false;
        }
        if (isEmptyOrIsNonnegativeInteger(ammonia_1) === false) {
            return valAlert("Ammonia 1 is not valid");
            //return false;
        }
        if (isEmptyOrIsNonnegativeInteger(ammonia_2) === false) {
            return valAlert("Ammonia 2 is not valid");
            //return false;
        }
    }

    /* Phosphorus and Chloride Page*/
    if (curPage === 6 || curPage === totalQuestionPages) {
		let op_blank = CD["op_blank"];					// Needs Validation?
        let op_1 = CD["orthoPHTest1"];							// Needs Validation
        let op_2 = CD["orthoPHTest2"];							// Needs Validation
        let chloride_blank = CD["chloride_blank"];		// Needs Validation?
        let chloride_1 = CD["chlorideTest1"];				// Needs Validation
        let chloride_2 = CD["chlorideTest2"];				// Needs Validation
		
		if (isEmptyOrIsNonnegativeInteger(op_blank) === false) {
			return valAlert("OP BLANK is not valid: " + op_blank);
            //return false;
		}
		if (isEmptyOrIsNonnegativeInteger(op_1) === false) {
			return valAlert("OP 1 is not valid: " + op_1);
            //return false;
		}
		if (isEmptyOrIsNonnegativeInteger(op_2) === false) {
			return valAlert("OP 2 is not valid: " + op_2);
            //return false;
		}
		if (isEmptyOrIsNonnegativeInteger(chloride_blank) === false) {
			return valAlert("Cl BLANK is not valid: " + chloride_blank);
            //return false;
		}
		if (isEmptyOrIsNonnegativeInteger(chloride_1) === false) {
			return valAlert("Cl 1 is not valid: " + chloride_1);
            //return false;
		}
		if (isEmptyOrIsNonnegativeInteger(chloride_2) === false) {
			return valAlert("Cl 2 is not valid: " + chloride_2);
            //return false;
		}
    }

	return true // Everything normal
}

async function getVolunteerCSV(key, CD) {
	var volunteerCSV = "";
	let v = ",";
	// Get volunteers
	for (let i = 0; i < CD.numberOfVolunteers; i++) {
		//@@@
		let volunteerName = CD["volunteer_name_" + i];
		// volunteerName = fixComments(volunteerName); // RLP fixes 6-21-18
		let volunteerDate = CD["volunteer_date_" + i];
		let volunteerActivity = CD["volunteer_activity_" + i];
		// volunteerActivity = fixComments(volunteerActivity); // RLP fixes 6-21-18
		let volunteerHours = Math.abs(CD["volunteer_hours_" + i]);

		volunteerCSV = volunteerCSV + volunteerDate +v+ volunteerName +v+ volunteerActivity +v+ volunteerHours + ",";
	}

	volunteerCSV 	= volunteerCSV.substring(0, volunteerCSV.length - 1); // remove last comma
	// ^ Please insert if(i < vC-1) block in the loop and remove this! ^
	return volunteerCSV;
}

function changeToZeroIfNull(data){
    if (data == null){
        data = 0;
    }
}
/**
 * Collects data feilds and validates
 * Warns is invalid input is present
 *
 * @returns {string}
 */
async function getCSV(key) {
		console.log("getCSV's KEY = " + key + "\n");
		let flag = false;
		var CSV = null;
		var CD = null;
		let v = ",";
		
		//I cant get these to sequence correctly, please fix later
		var logs = await localforage.getItem('logs');

		let val = logs[key];
		if (val == null) {
			console.log("\n\nLocalforage could not find: " + key + "!\n\n");
			return CSV;
		}
		console.log(">>>LF MASS returns: \n" + val.toString() + "\n>>>\n");
		CD = logs[key];
		
		try {
			flag = await validatePage(CD, -1,-1);
		//while(flag === false){
			//try{
				console.log("<<<LF SPEC returns: \n" + CD.toString() + "\n<<<\n");
				console.log("Flag: " + flag.toString() + "\n");
				/*
			}catch (err){
				console.log("Aborting getCSV! Caught Error!\n");
				console.log(err);
				return CSV;
			}
			*/
		}catch(err){
			console.log(err);
			console.log("Aborting getCSV! Caught Error!\n");
			return CSV;
		}
		
			
		if (flag == false) {
			console.log("Aborting getCSV! Caught Flag!\n");
			return CSV; // Do not pass go
		}
		
		/* New Log Page */
        let site_name 			= CD["siteName"];	// 
        let wbid 				= CD["wbid"];			// 
        let legal 				= CD["legal"];		// 
        let county 				= CD["county"];		// Needs Validation
        let date 				= CD["date"];			// Needs Validation
        let latitude 			= CD["latitude"];		// faked
        let longitude 			= CD["longitude"];	// faked
        let site_time 			= CD["siteTime"];	// Needs Validation
        let sampler_1 			= CD["sampler1"];	// 
        let sampler_2 			= CD["sampler2"];	// 
		
        /* Site Conditions */
        let weather 			= CD["weather"];
        let wind_spd			= CD["windSpeed"];
        let wind_dir			= CD["windDir"];
        let stage				= CD["streamStage"];
        let stage_qual			= CD["stageQualifier"];
        let secchi_depth 		= CD["secciDepth"];	// Needs Validation POSITIVE
        let secchi_vis 			= CD["secchi_vis"]; // RLP fixes 6-21-18.
        let air_temp 			= CD["airTemp"];		// Needs Validation Clamping
        let air_temp_comments 	= " ";    // no longer desired by BThumb
        let water_temp 			= CD["waterTemp"];	// Needs Validation Clamping
        let water_temp_comments = " ";  // no longer desired by BThumb
		
        /* Observations Page */
        let clean 			= CD["clean"];
        let manure 			= CD["manure"];
        let unsightly 		= CD["unsightly"];
        let foam 			= CD["foam"];
        let detritus 		= CD["detritus"];
        let trash 			= CD["trash"];
        let sig_algae 		= CD["sig_algae"];
        let fish_kill 		= CD["fish_kill"];
        let dead_animals 	= CD["dead_animals"];
        let iron_precip 	= CD["iron_precip"];
        let siltation 		= CD["siltation"];
        let flow_alter 		= CD["flow_alter"];
        let habitat_alter 	= CD["habitat_alter"];
        let oil_film 		= CD["oil_film"];
        let odor 			= CD["odor"];
        let exotic_spp 		= CD["exotic_spp"];
        let cattle 			= CD["cattle"];
        let other_obs 		= CD["other_obs"];
        let obs_comments = CD["obs_comments"]; // RLP fixes 6-21-18
        let site_obs_none = (clean | manure | unsightly | foam |
                detritus | trash | sig_algae | fish_kill | dead_animals |
                iron_precip | siltation | flow_alter | habitat_alter |
                oil_film | odor | exotic_spp | cattle | obs_comments) ? "Off" : "On";

        /* Scrub that shiiiiiiiitttttt */
        clean 			= clean ? "On" : "Off";
        manure 			= manure ? "On" : "Off";
        unsightly 		= unsightly ? "On" : "Off";
        foam 			= foam ? "On" : "Off";
        detritus 		= detritus ? "On" : "Off";
        trash 			= trash ? "On" : "Off";
        sig_algae 		= sig_algae ? "On" : "Off";
        fish_kill 		= fish_kill ? "On" : "Off";
        dead_animals 	= dead_animals ? "On" : "Off";
        iron_precip 	= iron_precip ? "On" : "Off";
        siltation 		= siltation ? "On" : "Off";
        flow_alter 		= flow_alter ? "On" : "Off";
        habitat_alter 	= habitat_alter ? "On" : "Off";
        oil_film 		= oil_film ? "On" : "Off";
        odor 			= odor ? "On" : "Off";
        exotic_spp 		= exotic_spp ? "On" : "Off";
        cattle 			= cattle ? "On" : "Off";
        other_obs 		= other_obs ? "On" : "Off";
        // obs_comments = obs_comments ? "On" : "Off"; // RLP fixes 6-21-18
		
        /* Bacteria Data */
        // TODO: We should contact Blue Thumb about this... its not in the CSV.
		
        /* DO & pH Page */
        let do_1 = CD["do1"]; 						// Needs Validation
        let do_1_comments = CD["do_1_comments"];

        let do_ph_comments = CD["DO_pH_comments"]; // RLP fixes 6-21-18

        let do_2 = CD["do2"];						// Needs Validation
        let do_2_comments = CD["do_2_comments"];
        let ph_1 = CD["ph1"];						// Needs Validation PH
        let ph_1_comments = CD["ph_1_comments"];
        let ph_2 = CD["ph2"];						// Needs Validation PH
        let ph_2_comments = CD["ph_2_comments"];

        /* Nitrogen Page */
		let n_comments = CD["N_comments"]; // RLP fixes 6-21-18
        let nitrate_1 = CD["nitrateTest1"];				// Needs Validation
        let nitrate_1_comments = CD["nitrate_1_comments"];        
        let nitrate_2 = CD["nitrateTest2"];				// Needs Validation
        let nitrate_2_comments = CD["nitrate_2_comments"];
		
        let nitrite_1 = CD["nitriteTest1"];				// Needs Validation
        let nitrite_1_comments = CD["nitrite_1_comments"];
        let nitrite_2 = CD["nitriteTest2"];				// Needs Validation
        let nitrite_2_comments = CD["nitrite_2_comments"];
		
        let ammonia_blank = " ";
        let ammonia_blank_comments = " ";
        let ammonia_1 = CD["ammoniaNTest1"];					// Needs Validation
        let ammonia_1_comments = CD["ammonia_1_comments"];
        let ammonia_2 = CD["ammoniaNTest2"];					// Needs Validation
        let ammonia_2_comments = CD["ammonia_2_comments"];
		
        /* Phosphorus and Chloride Page*/
        let op_blank = CD["orthoBlankPhosphorus"];					// Needs Validation?
        let op_blank_comments = CD["op_blank_comments"];

        let p_cl_comments = CD["P_Cl_comments"]; // RLP fixes 6-21-18

        let op_1 = CD["orthoPHTest1"];							// Needs Validation
        let op_1_comments = CD["op_1_comments"];
        let op_2 = CD["orthoPHTest2"];							// Needs Validation
        let op_2_comments = CD["op_2_comments"];
        let chloride_blank = CD["chloride_blank"];		// Needs Validation?
        let chloride_blank_comments = CD["chloride_blank_comments"];
        let chloride_1 = CD["chlorideTest1"];				// Needs Validation
        let chloride_1_comments = CD["chloride_1_comments"];
        let chloride_2 = CD["chlorideTest2"];				// Needs Validation
        let chloride_2_comments = CD["chloride_2_comments"];
		
		
        var volunteerCSV = await getVolunteerCSV(key, CD);
       
		//
        // Fix the comments so that they can have quotes and comma in them. // RLP fixes 6-21-18
		/*
        obs_comments 	= fixComments(obs_comments);

        do_ph_comments 	= fixComments(do_ph_comments);
        n_comments 		= fixComments(n_comments);

        p_cl_comments 	= fixComments(p_cl_comments);

        site_name 		= fixComments(site_name);
        sampler_1 		= fixComments(sampler_1);
        sampler_2 		= fixComments(sampler_2);
        wbid 			= fixComments(wbid);
        legal 			= fixComments(legal);
        county 			= fixComments(county);
		*/
		// Create CSV as one does...
        changeToZeroIfNull(air_temp);
		CSV =   site_name 		+v+ wbid				+v+ legal				+v+ county				+v+ date					+v+
				latitude		+v+ longitude			+v+ site_time			+v+ sampler_1			+v+ sampler_2				+v+
				weather			+v+ wind_spd			+v+ wind_dir			+v+ stage				+v+ stage_qual				+v+
				secchi_depth	+v+ secchi_vis			+v+ site_obs_none		+v+ clean				+v+ manure					+v+
				unsightly		+v+ foam				+v+ detritus			+v+ trash				+v+ sig_algae				+v+ 
				fish_kill		+v+ dead_animals		+v+ iron_precip			+v+ siltation			+v+ flow_alter				+v+ 
				habitat_alter	+v+ oil_film			+v+ odor				+v+ exotic_spp			+v+ other_obs				+v+
				cattle			+v+ obs_comments		+v+ air_temp			+v+ air_temp_comments	+v+ water_temp				+v+
				water_temp_comments	+v+ do_1			+v+ do_1_comments		+v+ do_2				+v+ do_2_comments			+v+
				ph_1			+v+ ph_1_comments		+v+ ph_2				+v+ ph_2_comments		+v+ do_ph_comments			+v+ 
				nitrate_1		+v+ nitrate_1_comments	+v+ nitrate_2			+v+ nitrate_2_comments	+v+ nitrite_1				+v+
				nitrite_1_comments	+v+ nitrite_2		+v+ nitrite_2_comments	+v+ ammonia_blank		+v+ ammonia_blank_comments	+v+
				ammonia_1		+v+ ammonia_1_comments	+v+ ammonia_2			+v+ ammonia_2_comments	+v+ n_comments				+v+
				op_blank		+v+ op_blank_comments	+v+ op_1				+v+ op_1_comments		+v+ op_2					+v+ 
				op_2_comments	+v+ chloride_blank		+v+ chloride_blank_comments	+v+ chloride_1		+v+ chloride_1_comments		+v+
				chloride_2		+v+ chloride_2_comments	+v+ p_cl_comments		+v+ volunteerCSV;

	CSV = "[" + CSV.toString() + "]";
	console.log("\nCSV:\n"+CSV+"\n");
    return CSV;
	//}); // Promise end
}

























