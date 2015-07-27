/*!
 * jQuery UI Weekly report component
 * @requires: jquery, jquery-ui, datatables javascript libraries
 */
var weeklyreport = $.widget( "rpms.weeklyreport", {
	version: "1.0",
	options: {
		data: {name: 'Hariprasad'}
	},

	_create: function() {
	    if(this.options.data == null) {alert("Empty data")};

	    var _reportData = this.options.data;

    	this.valueDiv = $( "<div class=''>" + _reportData.name + "</div>" )
			.appendTo( this.element );
	}

});


function submitWeeklyReport() {

    var jsonData = $('#weeklyreportform').serializeJSON();
    if (this.validatePage(jsonData)){
        $.ajax({
            url: 'submitweeklyreport',
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: jsonData, //Stringified Json Object
            async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
            cache: false,    //This will force requested pages not to be cached by the browser
            processData: false, //To avoid making query String instead of JSON
            success: function (resposeJsonObject) {
                alert("Report saved successfully!")
                window.location.href = "viewweeklyreports";
            }
        });
    }

}

function chooseRevenueConfirmation() {
    $('#revenueconfirmationtotal').html('<strong>ACCURATE<strong>');
    $.each($('select option:selected'), function( index, value ) {
        if($(value).text() == 'NEED MODIFICATION') {
            $('#revenueconfirmationtotal').html('<strong>NEED MODIFICATION<strong>');
            return false;
        }
    });
    $.each($('td#revenueconfirmation'), function( index, value ) {
            if($(value).text() == 'NEED MODIFICATION') {
                $('#revenueconfirmationtotal').html('<strong>NEED MODIFICATION<strong>');
                return false;
            }
    });
}

function validatePage(jData) {

    var obj = JSON.parse(jData);

    if ($.trim(obj.effortSpent.faceTime) == "" || $.trim(obj.effortSpent.callTime) == "" || $.trim(obj.effortSpent.proposalTime) == ""
        || $.trim(obj.effortSpent.otherTime) == "" || $.trim(obj.effortSpent.deliveryTime) == "") {
        alert("Time entries should not be empty");
        return false;
    }
    var checkValue = /^\+?(0*|[a-z]\d*)$/.test($.trim(obj.effortSpent.otherTime));
    if (!checkValue && $.trim(obj.otherTimeComments) === "") {
        alert("Please provide your comments for Other Time Comments");
        return false;
    }

    if (typeof(obj.rfsDetails) != "undefined") {
        for (i = 0; i < obj.rfsDetails.length; i++) {
            if ($.trim(obj.rfsDetails[i].revenueConfirmation) === "NEED MODIFICATION" && $.trim(obj.rfsDetails[i].comments) === "") {
                alert("Please provide your comments for 'NEED MODIFICATION' revenue confirmation");
                return false;
            }
        }
    }

    if($.trim(obj.keyPriorities) === ""){
        alert("Please provide your comments for 'Key Priorities / Activities'");
        return false;
    }

    if($.trim(obj.upcomingCXOMeetings) === ""){
        alert("Please provide your comments for 'Upcoming CXO Meetings'");
        return false;
    }
    return true;

}