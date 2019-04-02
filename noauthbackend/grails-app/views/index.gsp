<!doctype html>

<!-- Blue Thumb Single Page Application -->
<html>
	<head>
		<title>Blue Thumb Logger</title>
		%{--<meta charset="utf-8">--}%
	    %{--<meta http-equiv="x-ua-compatible" content="ie=edge">--}%
	    %{--<meta name="viewport" content="width=device-width, initial-scale=1">--}%
        <asset:stylesheet src="application.css"></asset:stylesheet>
        <asset:stylesheet src="fontawesome/css/all.css"></asset:stylesheet>
        <asset:stylesheet src="index.css"></asset:stylesheet>
		<!-- Latest compiled and minified CSS -->
        <asset:stylesheet src="bootstrap.min.css"></asset:stylesheet>

		<!-- jQuery library -->
		<asset:javascript src="jquery.min.js"></asset:javascript>

		<!-- Popper JS -->
		<asset:javascript src="popper.min.js"></asset:javascript>

		<!-- Latest compiled JavaScript -->
		<asset:javascript src="bootstrap.min.js"></asset:javascript>
        <asset:javascript src="localforage.js"></asset:javascript>
        <asset:javascript src="animations.js"></asset:javascript>
        <asset:javascript src="logManagment.js"></asset:javascript>
        <asset:javascript src="logUpload.js"></asset:javascript>
        <asset:javascript src="eventListeners.js"></asset:javascript>
        <asset:javascript src="index.js"></asset:javascript>
        <asset:javascript src="page_validation.js"></asset:javascript>
	</head>
	<body>

        <!-- Jumbotron that sits atop screen -->
        <div class="jumbotron collapse show noNav">
            <div class="text-center">
                <asset:image src="logo.png" alt="Logo"></asset:image>
            </div>
        </div>

        <div class="jumbotron collapse withNav">
            <div class="logo text-center">
                <asset:image src="logo.png" alt="Logo"></asset:image>
            </div>
        </div>

        <!-- The overlay -->
        <div id="myNav" class="overlay">

            <!-- Button to close the overlay navigation -->
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

            <!-- Overlay content -->
            <div class="overlay-content">
                <a href="javascript:void(0)" onclick="window.location.reload(false);">Home</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(1)">Initial</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(2)">Site Conditions</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(3)">Observations</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(4)">Bacteria Data</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(5)">DO & pH</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(6)">Nitrogen</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(7)">Phosphorus and Chloride</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(8)">Volunteers</a>
                <a href="javascript:void(0)" onclick="changePageFromMenu(9)">Review</a>
            </div>
        </div>

        <!-- Main Page Container, hidden when in form -->
        <div class="container startPage collapse show">

            <div class="row">
                <div class="col text-center">
                    <div class="previousLogs">
                        <div class="noLogsAvilable">No Logs Stored!</div>
                    </div>
                </div>
            </div>

            <div class="uploadModal" style="display: none;">
                <div class="uploadModalTitle center">Are you sure you want to upload this log to Blue Thumb?</div>
                <div class="yesBtn center">yes</div>
                <div class="noBtn center">no</div>
                <div class="center uloading" style="display: none;">Uploading...</div>
            </div>

            <!-- Submit Modal -->
            <div class="modal submitModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title text-center">Submit</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <!-- Modal body -->
                      <div class="modal-body">
                        <div class="row">
                            <div class="col text-center">
                                Do you want to submit this log?
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <button type="button" class="yesBtn" data-dismiss="modal">Yes</button>
                            </div>
                            <div class="col text-center">
                                <button type="button" class="noBtn" data-dismiss="modal">No</button>
                            </div>
                        </div>
                      </div>

                    </div>
                </div>
            </div>

            <!-- Delete Modal -->
            <div class="modal deleteModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title text-center">Delete</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <!-- Modal body -->
                      <div class="modal-body">
                        <div class="row">
                            <div class="col text-center">
                                Are you sure you want to delete this log?
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <button type="button" class="yesBtn" data-dismiss="modal">Yes</button>
                            </div>
                            <div class="col text-center">
                                <button type="button" class="noBtn" data-dismiss="modal">No</button>
                            </div>
                        </div>
                      </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col text-center">
                    <button type="button" class="unsubmitted toggleBtn selected">Unsubmitted</button>
                </div>
                <div class="col text-center">
                    <button type="button" class="submitted toggleBtn">Submitted</button>
                </div>
            </div>
            <div class="row">
                <div class="col text-center">
                    <button type="button" class="logBtn">Create Log</button>
                </div>
            </div>
        <div class="col text-center">
            <div class="back"></div>
        </div>
        <div class="col text-center">
            <div class="forward">
                <i class="fas fa-arrow-right"></i>
            </div>
        </div>

        </div>

		<!-- Container that holds each "page", hidden when on main page -->
		<div class="container pages collapse">

			<!-- Inital Page -->
			<div class="initialModal page collapse page1 show">
				<div class="row">
                    <div class="col text-center">
                	   <h1>Initial</h1>
                    </div>
                </div>
                <div class="row">
                	<div class="col text-center">
                    	<div class="fieldName">Site Name</div>
                	</div>
                    <div class="col text-center">
						<label>
							<input class="inputField siteName" type="text">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">WBID Number</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input class="inputField wbid" type="text" inputmode="numeric">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">County</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input class="inputField county" type="text">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Date</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input type="date" class="inputField date">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Latitude</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input class="inputField lat" type="text" inputmode="numeric">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Longitude</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input class="inputField lng" type="text" inputmode="numeric">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Time</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input type="time" class="inputField time">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Sampler 1</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input type="text" class="inputField sampler1" inputmode="numeric">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
                		<div class="fieldName">Sampler 2</div>
                	</div>
                	<div class="col text-center">
						<label>
							<input type="text" class="inputField sampler2" inputmode="numeric">
						</label>
					</div>
                </div>
                <div class="row">
                	<div class="col text-center">
	                	<div class="back"></div>
	            	</div>
		            <div class="col text-center">
		                <div class="forward">
		                	<i class="fas fa-arrow-right"></i>
		            	</div>
	            	</div>
            	</div>
        	</div>

        	<!-- Site Conditions -->
        	<div class="siteModal page collapse page2">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Site Conditions</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
						<div class="fieldName">Weather</div>
        			</div>
        			<div class="col text-center">
						<label>
							<select class="inputField weather">
								<option value="fair skies">Fair Skies</option>
								<option value="overcast">Overcast</option>
								<option value="haze">Haze</option>
								<option value="fog">Fog</option>
								<option value="drizzle">Drizzle</option>
								<option value="intermitten rain">Intermitten Rain</option>
								<option value="moderate rain">Moderate Rain</option>
								<option value="heavy rain">Heavy Rain</option>
								<option value="snow/sleet/rain">Snow/Sleet/Rain</option>
							</select>
						</label>
					</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Wind Speed</div>
        			</div>
        			<div class="col text-center">
						<label>
							<select class="inputField windSpeed">
								<option value="calm">Calm</option>
								<option value="light air">Light Air</option>
								<option value="light breeze">Light Breeze</option>
								<option value="leave/twigs Move">Leave/ Twigs Move</option>
								<option value="branches move">Branches Move</option>
								<option value="small trees sway">Small Trees Sway</option>
								<option value="large branches sway">Large Branches Sway</option>
								<option value="hard to walk">Hard To Walk</option>
								<option value="other (high wind)">Other (High Wind)</option>
							</select>
						</label>
					</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Wind Dir
                    	</div>
        			</div>
        			<div class="col text-center">
						<label>
							<select class="inputField windDir">
								<option value="north">North</option>
								<option value="northeast">Northeast</option>
								<option value="east">East</option>
								<option value="southeast">Southeast</option>
								<option value="south">South</option>
								<option value="southwest">Southwest</option>
								<option value="west">West</option>
								<option value="northwest">Northwest</option>
							</select>
						</label>
					</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
						<div class="fieldName">Stream Stage</div>
        			</div>
        			<div class="col text-center">
        				<select class="inputField streamStage">
	                        <option value="dry">Dry</option>
	                        <option value="no flow">No Flow</option>
	                        <option value="trace">Trace</option>
	                        <option value="low flow">Low Flow</option>
	                        <option value="base flow">Base Flow</option>
	                        <option value="slightly elevated">Slightly Elevated</option>
	                        <option value="elevated">Elevated</option>
	                        <option value="elevated/no flow">Elevated and No Flow</option>
	                        <option value="high" flow="">High Flow</option>
                    	</select>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Stage Qualifier</div>
        			</div>
        			<div class="col text-center">
        				<select name="" id="" class="inputField stageQualifier">
	                        <option value="stable">Stable</option>
	                        <option value="rising">Rising</option>
	                        <option value="falling">Falling</option>
	                        <option value="unknown">Unknown</option>
                    	</select>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Secchi Depth
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="meters" class="inputField secciDepth" pattern="(([0-9]|[\.])([0-9]|[\.])*)" inputmode="numeric">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Saw on Creek Bottom</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField"><input type="checkbox" val="SecciCheck"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Air Temp.
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeHolder="Celcius" class="inputField airTemp" inputmode="numeric" pattern="(([0-9]|[\.]|[-])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Water Temp.
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeHolder="Celcius" class="inputField waterTemp" inputmode="numeric" pattern="(([0-9]|[\.]|[-])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                         <i class="fas fa-arrow-left"></i>
                    </div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                         <i class="fas fa-arrow-right"></i>
                     </div>
        			</div>
        		</div>
        	</div>

        	<!-- Observations Page -->
        	<div class="observations page collapse page3">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Observations</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Clean</div>
        			</div>
        			<div class="col text-center">
        				 <div class="inputField"><input type="checkbox" val="clean"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Manure In Stream</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField"><input type="checkbox" val="manureInStream"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Unsightly Color</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField"><input type="checkbox" val="unsightlyColor"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Foam/Scum</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField"><input type="checkbox" val="foamSlashScum"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Floating Detritus</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField"><input type="checkbox" val="floatingDetritus"></div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Trash</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="trash">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Signifcant Algae</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="significantAlgae"></input>
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Fish Kill</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="fishKill">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Dead Animal(s)</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="deadAnimal">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Iron Percipitates</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="ironPercipitates">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Siltation</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="siltation">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Flow Alteration</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="flowAlteration">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Habitat Alteration</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="habitatAlteration">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Oily Film/Grease</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="oilyFilmGrease">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Offensive Odor</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="offensiveOdor">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Exotic SPP</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="exoticSPP">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Recent Cattle Activity</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField">
                        	<input type="checkbox" val="recentCattleActivity">
                    	</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Comments</div>
        			</div>
        			<div class="col text-center">
        				<textarea rows="3" class="observationComments inputField" maxlength="300"></textarea>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                         	<i class="fas fa-arrow-left"></i>
                    	</div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                         	<i class="fas fa-arrow-right"></i>
                     	</div>
        			</div>
        		</div>
        	</div>

        	<!-- Bacteria Page -->
        	<div class="bacteriaData page collapse page4">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Bacteria Data</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Sample Volume</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mL" class='inputField sampleVolume' inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
                    <div class="col text-center">
                        <h2>Dish 1</h2>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField eColiViolet1 dish1" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField pinkAndViolet1 dish1" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <h2>Dish 2</h2>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField eColiViolet2 dish2" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField pinkAndViolet2 dish2" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <h2>Dish 3</h2>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField eColiViolet3 dish3" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<input type="text" class="inputField pinkAndViolet3 dish3" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                        	<i class="fas fa-arrow-left"></i>
                    	</div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                        	<i class="fas fa-arrow-right"></i>
                     	</div>
        			</div>
        		</div>
        	</div>

        	<!-- DO & pH Page -->
        	<div class=" doAndPH page collapse page5">
        		<div class="row">
                    <div class="col text-center">
                        <h1>DO & pH</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
						<div class="fieldName">DO Test 1</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L DO" class="inputField do1" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">DO Test 2</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L DO" class="inputField do2" inputmode="numeric" pattern="(([0-9]|[\.])([0-9]|[\.])*)">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">DO Percentage</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField doPercent">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">pH Test 1
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="SU" class="inputField ph1" inputmode="numeric" min="0" max = "14">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">pH Test 2
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="SU" class="inputField ph2" inputmode="numeric" min = "0" max = "14">
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Comments</div>
        			</div>
        			<div class="col text-center">
        				<textarea rows="3" class="phComments inputField" maxlength="300"></textarea>
        			</div>
        		</div>
        		<div class="row">
                    <div class="col text-center">
                        <div class="back">
                            <i class="fas fa-arrow-left"></i>
                        </div>
                    </div>
                    <div class="col text-center">
                        <div class="forward">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </div>
        	</div>

        	<!-- Nitrogen Page -->
        	<div class="nitrogen page collapse page6">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Nitrogen</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Nitrate Nitrogen Test 1
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField nitrateTest1" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Nitrate Nitrogen Test 2
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField nitrateTest2" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Nitrite Nitrogen Test 1
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField nitriteTest1" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Nitrite Nitrogen Test 2
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField nitriteTest2" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Ammonia Nitrogen Blank
                    	</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField ammoniaBlank" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Ammonia Nitrogen Test 1</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField ammoniaNTest1" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Ammonia Nitrogen Test 2</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField ammoniaNTest2" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Comments</div>
        			</div>
        			<div class="col text-center">
        				<textarea rows="3" class="nitroComments inputField" maxlength="300"></textarea>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                        	<i class="fas fa-arrow-left"></i>
                    	</div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                        	<i class="fas fa-arrow-right"></i>
                     	</div>
        			</div>
        		</div>
        	</div>

        	<!-- Phosphorus Page -->
        	<div class="Phosphorus page collapse page7">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Phosphorus and Chloride</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">

        			</div>
        			<div class="col text-center">

        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Orthophosphate Phosphorus Blank</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField orthoBlankPhosphorus" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Orthophosphate Phosphorus Test 1</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField orthoPHTest1" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Orthophosphate Phosphorus Test 2</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField orthoPHTest2" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Chloride Blank</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="chlorideBlank inputField" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Chloride Test 1</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField chlorideTest1" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Chloride Test 2</div>
        			</div>
        			<div class="col text-center">
        				<input type="number" placeholder="mg/L" class="inputField chlorideTest2" inputmode="numeric" pattern=(([0-9]|[\.])([0-9]|[\.])*)>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Comments</div>
        			</div>
        			<div class="col text-center">
        				<textarea rows="3" class="phComments inputField" maxlength="300"></textarea>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                        	<i class="fas fa-arrow-left"></i>
                    	</div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                        	<i class="fas fa-arrow-right"></i>
                    	</div>
        			</div>
        		</div>
        	</div>

        	<!-- Volunteers Page -->
        	<div class="volunteer page collapse page8">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Volunteers</h1>
                    </div>
        		</div>
        		<div class="volunteerHolder">
                    <div class="row">
                        <div class="col text-center">
                            <h2>Volunteer 1</h2>
                        </div>
                    </div>
	        		<div class="row">
	        			<div class="col text-center">
	        				<div class="fieldName employee0">Name</div>
	        			</div>
	        			<div class="col text-center">
	        				<input type="text" class="inputField volunteerName0 volunteerName employee0">
	        			</div>
	        		</div>
	        		<div class="row">
	        			<div class="col text-center">
	        				<div class="fieldName employee0">Date</div>
	        			</div>
	        			<div class="col text-center">
	        				<input type="date" class="inputField date0 employee0">
	        			</div>
	        		</div>
	        		<div class="row">
	        			<div class="col text-center">
	        				<div class="fieldName employee0">Activity</div>
	        			</div>
	        			<div class="col text-center">
	        				<input type="text" class="inputField volunteerActivity0 employee0">
	        			</div>
	        		</div>
	        		<div class="row">
	        			<div class="col text-center">
	        				<div class="fieldName employee0 bottomEmp">Hours</div>
	        			</div>
	        			<div class="col text-center">
	        				<input type="number" class="inputField volunteerHours0 employee0 bottomEmp" inputmode="numeric">
	        			</div>
	        		</div>
                </div>
        		<div class="row volunteerWrapper">
        			<div class="col text-center">
        				<button type="button" class="remove volunteerBtn" id="removeVolunteer">Remove Volunteer</button>
        			</div>
                    <div class="col text-center">
                        <button type="button" class="add volunteerBtn" id="addVolunteer">Add Volunteer</button>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="back">
                			<i class="fas fa-arrow-left"></i>
            			</div>
        			</div>
        			<div class="col text-center">
        				<div class="forward">
                			<i class="fas fa-arrow-right"></i>
            			</div>
        			</div>
        		</div>
        	</div>

        	<!-- Review Page -->
        	<div class="finalModal page collapse page9">
        		<div class="row">
                    <div class="col text-center">
                        <h1>Review</h1>
                    </div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Site Name</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput siteNameFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">WBID Number</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput wbidFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">County</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput countyFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Date</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput dateFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Latitude</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput latFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Longitude</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput lngFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Time</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput timeFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Sampler 1</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput sampler1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Sampler 2</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput sampler2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Weather</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput weatherFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Wind Speed</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput windSpeedFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Wind Dir</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput windDirFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Stream Stage</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput streamStageFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Stage Qualifier</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput stageQualifierFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Secchi Depth</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput secciDepthFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Secchi Saw on Creek Bottom</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput SecciCheck">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Water Temp</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput waterTempFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Clean</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput cleanFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Manure In Stream</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput manureInStreamFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Unsightly Color</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput unsightlyColorFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Foam/Scum</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput foamSlashScumFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Floating Detritus</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput floatingDetritusFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Trash</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput trashFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Signifcant Algae</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput significantAlgaeFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Fish Kill</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput fishKillFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Dead Animal</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput deadAnimalFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Iron Percipitates</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput ironPercipitatesFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Siltation</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput siltationFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Flow Alteration</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput flowAlterationFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Habitat Alteration</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput habitatAlterationFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Oily Film/Grease</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput oilyFilmGreaseFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Exotic SPP</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput exoticSPPFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Recent Cattle Activity</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput recentCattleActivityFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Sample Volume</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput sampleVolumeFinal">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<h2>Dish 1</h2>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput eColiViolet1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput pinkAndViolet1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<h2>Dish 2</h2>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput eColiViolet2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput pinkAndViolet2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<h2>Dish 3</h2>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">E.coli Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput eColiViolet3Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
        				<div class="fieldName">Pink and Violet Count</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput pinkAndViolet3Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">DO Test 1</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput do1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">DO Test 2</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput do2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">pH Test 1</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput ph1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">pH Test 2</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput ph2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">Nitrate Nitrogen Test 1</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput nitrateTest1Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">Nitrate Nitrogen Test 2</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput nitrateTest2Final">-</div>
        			</div>
        		</div>
        		<div class="row">
        			<div class="col text-center">
                        <div class="fieldName">Nitrite Nitrogen Test 1</div>
        			</div>
        			<div class="col text-center">
        				<div class="inputField noInput nitriteTest1Final">-</div>
        			</div>
        		</div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Nitrite Nitrogen Test 2</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput nitriteTest2Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Ammonia Nitrogen Blank</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput ammoniaBlankFinal">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Ammonia Nitrogen Test 1</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput ammoniaNTest1Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Ammonia Nitrogen Test 2</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput ammoniaNTest2Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Orthophosphate Phosphorus Blank</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput orthoBlankPhosphorusFinal">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Orthophosphate Phosphorus Test 1</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput orthoPHTest1Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Orthophosphate Phosphorus Test 2</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput orthoPHTest2Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Chloride Blank</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput chlorideBlankFinal">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Cloride Test 1</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput chlorideTest1Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="fieldName">Chloride Test 2</div>
                    </div>
                    <div class="col text-center">
                        <div class="inputField noInput chlorideTest2Final">-</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="back">
                            <i class="fas fa-arrow-left"></i>
                        </div>
                    </div>
                    <div class="col text-center">

                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <button type="button" class="submitBtnFinal">Submit</button>
                    </div>
                </div>

        	</div>
		</div>
	<!-- JavaScript -->
	%{--<asset:javascript src="localforage.js"></asset:javascript>--}%
	%{--<asset:javascript src="animations.js"></asset:javascript>--}%
	%{--<asset:javascript src="logManagment.js"></asset:javascript>--}%
	%{--<asset:javascript src="logUpload.js"></asset:javascript>--}%
	%{--<asset:javascript src="eventListeners.js"></asset:javascript>--}%
	%{--<asset:javascript src="index.js"></asset:javascript>--}%
	%{--<asset:javascript src="page_validation.js"></asset:javascript>--}%
	</body>
</html>
