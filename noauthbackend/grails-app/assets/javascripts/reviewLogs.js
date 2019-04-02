function getData(){
	localforage.iterate(function(value, key, iterationNumber) {
    // Resulting key/value pair -- this callback
    // will be executed for every item in the
    // database.
    console.log([key, value]);
	}).then(function() {
	    console.log('Iteration has completed');
	}).catch(function(err) {
	    // This code runs if there were any errors
	    console.log(err);
	});
}

function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key))
            return false;
    }
    return true;
}

$(document).ready ( function () {
    $('#min, #max').keyup( function() {
        table.draw();
    } );

    $("#min").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
    $("#max").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });

    var table = $('#logsDatatable').DataTable({
        "ajax":{
            url: 'https://hci-dev.cs.mtu.edu:8127/noauthbackend/sample',
            method: "GET",
            Accept: "application/json",
            dataSrc: ""
        },
        "rowId": 'timestamp',
        "columns": [
            { data: "wbid", title: "wbid" },
            { data: "timestamp", title: "Date Recorded", type: "date" },
            //{ data: "county", title: "County" },
            { data: "siteName", title: "Site Name" },
            { data: "status", title: "Status", defaultContent: "Needs Review" },
        ],
    });

    //Gets the form data from selected row wbid
    function fillForm(timestamp){
        var formData = {};
        var filtered = {};
        $.ajax({
            url:'https://hci-dev.cs.mtu.edu:8127/noauthbackend/sample', //'noauthbackend' is just the name of the backend, may need to change. Was previously 'btbackend'
            method:"GET",
            Accept: "application/json",
            dataSrc: "",
            dataType: 'json',
            success: function(data){
                filtered = data.filter(function(data){
                    return data.timestamp === timestamp;
                });
                formData = JSON.stringify(filtered);

                var obj = JSON.parse(formData);
                console.log(formData);
                $.each(obj[0], function(k,  value){
                    // alert(k);
                    if($("." + k)[0]){
                        // alert(k);
                        // alert(value);
                        if(value == true){
                            document.getElementsByClassName(k)[0].checked = true;
                        }else if (value == false){
                            document.getElementsByClassName(k)[0].checked = false;
                        }else{
                            document.getElementsByClassName(k)[0].defaultValue = obj[0][k];
                        }
                    }
                })

                //alert(JSON.stringify(filtered));
            },
        });

        return formData;
    }

    $('#logsDatatable tbody').on('click', 'tr', function () {
        var timestamp = table.row( this ).id();

        var info = fillForm(timestamp);  //Contains all form info
				reviewChangePage(Number(2));
        //Probably change pg # after entries have been filled
        //if(isEmpty(info)){
        //    console.log(info);
        //}
        //else{

        //}
    } );

} );



$.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var min = $('#min').datepicker("getDate");
            var max = $('#max').datepicker("getDate");
            var startDate = new Date(data[1]);
            if (min == null && max == null) { return true; }
            if (min == null && startDate <= max) { return true;}
            if(max == null && startDate >= min) {return true;}
            if (startDate <= max && startDate >= min) { return true; }
            return false;
});

$('.loadLogs').on('click touch', function(){
	getData();
});
//Sets approved status and goes back to loglist
$('.approveBtn').on('click touch', function(){
	//var approve = confirmApproval();
    $(this).toggleClass("down");
    if($('.denyBtn').hasClass("down")){
        $('.denyBtn').removeClass("down");
    }
	// if(approve){
	// 	changePage(Number(1));
	// }
});

//Sets denied status and goes back to loglist
$('.denyBtn').on('click touch', function(){
	//var deny = confirmDenial();
    //$(this).toggleClass("down");
    $(this).toggleClass("down");
    if($('.approveBtn').hasClass("down")){
        $('.approveBtn').removeClass("down");
    }
	// if(deny){
	// 	changePage(Number(1));
	// }
});

//Sets approved status and goes back to loglist
$('.submitBtn').on('click touch', function(){
    var submit = confirmSubmit();
    saveLog(submit);
});

function saveLog(submit){
    var jsonObj = logData();

    if(submit){
         //Post
        $.ajax({
            type:"POST",
            contentType: "application/json; charset=utf-8",
            url:'https://hci-dev.cs.mtu.edu:8127/noauthbackend/sample', //'noauthbackend' is just the name of the backend, may need to change. Was previously 'btbackend'
            //dataSrc: "",
            dataType: 'json',
            data: JSON.stringify(jsonObj),
        });
        $('.approveBtn').removeClass("down");
        $('.denyBtn').removeClass("down");
        changePage(Number(1));
    }
}

function logData(){
    var jsonObj = {};
    $('#log input').each(function () {
        var k = $( this ).attr ( 'class' ).split ( ' ' );
        jsonObj[k[2]] = this.value;
    });
    if($('.approveBtn').hasClass("down")){
        jsonObj["status"] = "Approved";
    }else if($('.denyBtn').hasClass("down")){
        jsonObj["status"] = "Denied";
    }
    //alert(JSON.stringify(jsonObj));
    return jsonObj;
}

function confirmSubmit(){
    var retVal = confirm("Submit form?");
    if( retVal == true ){
        return true;
    }
    else{
        return false;
    }
}

function confirmApproval(){
    var retVal = confirm("Confirm Approval");
    if( retVal == true ){
        return true;
    }
    else{
        return false;
    }
}

function confirmDenial(){
    var retVal = confirm("Confirm Denial");
    if( retVal == true ){
        return true;
    }
    else{
        return false;
    }
}
/*
$('.dataTable').on('click', 'tbody tr', function() {
  var data = table.row(this).data().map(function(item, index) {
     var r = {}; r['col'+index]=item; return r;
  })
  //now use AJAX with data, which is on the form [ { col1 : value, col2: value ..}]
  $.ajax({
    data: data,
    url: url,
    success: function(response) {
    }
});
*/

/*
curl -i -X POST -H "Content-Type: application/json" -d '{"wbid":"10", "volunteers":[{"name":"1asaf"}]}' https://hci-dev.cs.mtu.edu:8127/btbackend/sample
curl -i -H "Accept: application/json" https://hci-dev.cs.mtu.edu:8127/btbackend/sample
*/
