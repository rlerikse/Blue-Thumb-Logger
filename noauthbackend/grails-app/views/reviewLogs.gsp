<!doctype html>

<html>
    <head>
        %{--<meta charset="utf-8">--}%
        %{--<meta http-equiv="x-ua-compatible" content="ie=edge">--}%
        %{--<title></title>--}%
        %{--<meta name="description" content="">--}%
        %{--<meta name="viewport" content="width=device-width, initial-scale=1">--}%
		<asset:stylesheet src="fontawesome/css/all.css"></asset:stylesheet>
		<asset:stylesheet src="index.css"></asset:stylesheet>
		<asset:stylesheet src="reviewLogs.css"></asset:stylesheet>
		<asset:stylesheet src="jquery-ui.css"></asset:stylesheet>
    </head>

    <body>
    	<div class="modals">
    		<div class="reviewMenu">
			    <div class="logList modal" target="1">
			    	<div class="modalTitle">Log List</div>
			    	<div class="dateFilter">
			    	<table id="dateFilterTable" cellspacing="5" cellpadding="5">
				        <tbody>
				            <tr>
				                <td>Minimum Date:</td>
				                <td><input name="min" id="min" type="text"></td>
				            </tr>
				            <tr>
				                <td>Maximum Date:</td>
				                <td><input name="max" id="max" type="text"></td>
				            </tr>
				        </tbody>
				    </table>
				    </div>
			    	<div class="logTable">
				    	<table id="logsDatatable" class="display">
						    <thead>
						    </thead>
						    <tbody>
						    </tbody>
						</table>
			        </div>
			    </div>
			    <div class="finalModal modal" style="display:none;" target="2" id="log">
	                <div class="modalTitle">Review</div>
	                <div class="fieldName">Site Name</div>
	                <input class="inputField noInput siteName">
	                <div class="fieldName">WBID Number</div>
	               	<input class="inputField noInput wbid">
	                <div class="fieldName">Legal</div>
	                <input class="inputField noInput legal">
	                <div class="fieldName">County</div>
	                <input class="inputField noInput county">
	                <div class="fieldName">Date</div>
	                <input class="inputField noInput timestamp">
	                <div class="fieldName">Lat</div>
	                <input class="inputField noInput lat">
	                <div class="fieldName">Long</div>
	                <input class="inputField noInput lng">
	                <div class="fieldName">Time</div>
	                <input class="inputField noInput date">
	                <div class="fieldName">Sampler 1</div>
	                <input class="inputField noInput sampler1">
	                <div class="fieldName">Samper 2</div>
	                <input class="inputField noInput sampler2">
	                <div class="fieldName">Weather</div>
	                <input class="inputField noInput weather">
	                <div class="fieldName">Wind Speed</div>
	                <input class="inputField noInput windSpeed">
	                <div class="fieldName">Wind Dir</div>
	                <input class="inputField noInput windDir">
	                <div class="fieldName">Stream Stage</div>
	                <input class="inputField noInput streamStage">
	                <div class="fieldName">Stage Qualifier</div>
	                <input class="inputField noInput stageQualifier">
	                <div class="fieldName">Secchi Depth</div>
	                <input class="inputField noInput secciDepth">
	                <div class="fieldName">Secchi Saw on Creek Bottom</div>
	                <input class="inputField noInput secciCheck", type="checkbox">
	                <div class="fieldName">Air Temp</div>
	                <input class="inputField noInput airTemp">
	                <div class="fieldName">Water Temp</div>
	                <input class="inputField noInput waterTemp">
	                <div class="fieldName">Clean</div>
	                <input class="inputField noInput clean", type="checkbox">
	                <div class="fieldName">Manure In Stream</div>
	                <input class="inputField noInput manureInStream", type="checkbox">
	                <div class="fieldName">Unsightly Color</div>
	                <input class="inputField noInput unsightlyColor", type="checkbox">
	                <div class="fieldName">Foam/Scum</div>
	                <input class="inputField noInput foamSlashScum", type="checkbox">
	                <div class="fieldName">Floating Detritus</div>
	                <input class="inputField noInput floatingDetritus", type="checkbox">
	                <div class="fieldName">Trash</div>
	                <input class="inputField noInput trash", type="checkbox">
	                <div class="fieldName">Signifcant Algae</div>
	                <input class="inputField noInput significantAlgae", type="checkbox">
	                <div class="fieldName">Fish Kill</div>
	                <input class="inputField noInput fishKill", type="checkbox">
	                <div class="fieldName">Dead Animal</div>
	                <input class="inputField noInput deadAnimal", type="checkbox">
	                <div class="fieldName">Iron Percipitates</div>
	                <input class="inputField noInput ironPercipitates", type="checkbox">
	                <div class="fieldName">Siltation</div>
	                <input class="inputField noInput siltation", type="checkbox">
	                <div class="fieldName">Flow Alteration</div>
	                <input class="inputField noInput flowAlteration", type="checkbox">
	                <div class="fieldName">Habitat Alteration</div>
	                <input class="inputField noInput habitatAlteration", type="checkbox">
	                <div class="fieldName">Oily Film/Grease</div>
	                <input class="inputField noInput oilyFilmGrease", type="checkbox">
	                <div class="fieldName">Exotic SPP</div>
	                <input class="inputField noInput exoticSPP", type="checkbox">
	                <div class="fieldName">Recent Cattle Activity</div>
	                <input class="inputField noInput recentCattleActivity", type="checkbox">
	                <div class="fieldName">Sample Volume</div>
	                <input class="inputField noInput sampleVolume">
	                <div class="modalSubTitle">Dish 1</div>
	                <div class="fieldName">E.coli Violet Count</div>
	                <input class="inputField noInput eColiViolet1">
	                <div class="fieldName">Pink and Violet Count</div>
	                <input class="inputField noInput pinkAndViolet1">
	                <div class="modalSubTitle">Dish 2</div>
	                <div class="fieldName">E.coli Violet Count</div>
	                <input class="inputField noInput eColiViolet2">
	                <div class="fieldName">Pink and Violet Count</div>
	                <input class="inputField noInput pinkAndViolet2">
	                <div class="modalSubTitle">Dish 3</div>
	                <div class="fieldName">E.coli Violet Count</div>
	                <input class="inputField noInput eColiViolet3">
	                <div class="fieldName">Pink and Violet Count</div>
	                <input class="inputField noInput pinkAndViolet3">
	                <div class="modalSubTitle noTitle"></div>
	                <div class="fieldName">DO Test 1</div>
	                <input class="inputField noInput do1">
	                <div class="fieldName">DO Test 2</div>
	                <input class="inputField noInput do2">
	                <div class="fieldName">pH Test 1</div>
	                <input class="inputField noInput ph1">
	                <div class="fieldName">pH Test 2</div>
	                <input class="inputField noInput ph2">
	                <div class="fieldName">Nitrate Nitrogen Test 1</div>
	                <input class="inputField noInput nitrateTest1">
	                <div class="fieldName">Nitrate Nitrogen Test 2</div>
	                <input class="inputField noInput nitrateTest2">
	                <div class="fieldName">Nitrite Nitrogen Test 1</div>
	                <input class="inputField noInput nitriteTest1">
	                <div class="fieldName">Nitrite Nitrogen Test 2</div>
	                <input class="inputField noInput nitriteTest2">
	                <div class="fieldName">Ammonia Nitrogen Blank</div>
	                <input class="inputField noInput ammoniaBlank">
	                <div class="fieldName">Ammonia Nitrogen Test 1</div>
	                <input class="inputField noInput ammoniaNTest1">
	                <div class="fieldName">Ammonia Nitrogen Test 2</div>
	                <input class="inputField noInput ammoniaNTest2">
	                <div class="fieldName">Orthophosphate Phosphorus Blank</div>
	                <input class="inputField noInput orthoBlankPhosphorus">
	                <div class="fieldName">Orthophosphate Phosphorus Test 1</div>
	                <input class="inputField noInput orthoPHTest1">
	                <div class="fieldName">Orthophosphate Phosphorus Test 2</div>
	                <input class="inputField noInput orthoPHTest2">
	                <div class="fieldName">Chloride Blank</div>
	                <input class="inputField noInput chlorideBlank">
	                <div class="fieldName">Chloride Test 1</div>
	                <input class="inputField noInput chlorideTest1">
	                <div class="fieldName">Chlordie Test 2</div>
	                <input class="inputField noInput chlorideTest2">
	                <div class="approvalBtns">
	                	<div class="approveBtn" id="approve",type="checkbox">Approve</div>
	                	<div class="denyBtn" id="deny">Deny</div>
	                	<div class="submitBtn" id="submit">Submit</div>
	                </div>
	                <div class="backReview">
                    	<i class="fas fa-arrow-left"></i>
                	</div>
            	</div>
		   	</div>
		</div>

		<asset:javascript src="jquery.min.js"></asset:javascript>
		<asset:javascript src="jquery-1.12.4.js"></asset:javascript>
		<asset:javascript src="jquery.dataTables.js"></asset:javascript>
		<asset:javascript src="jquery-ui.js"></asset:javascript>
        <asset:javascript src="localforage.js"></asset:javascript>
        <asset:javascript src="animations.js"></asset:javascript>
        <asset:javascript src="logManagment.js"></asset:javascript>
        <asset:javascript src="eventListeners.js"></asset:javascript>
        <asset:javascript src="index.js"></asset:javascript>
        <asset:javascript src="reviewLogs.js"></asset:javascript>
        <asset:javascript src="page_validation.js"></asset:javascript>


    </body>

</html>
