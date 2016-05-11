$(document).ready(function(){
    $(".divs div").each(function(e) {
        if (e != 0)
            $(this).hide();
    });
    
    $("#next").click(function(){
        if ($(".divs div:visible").next().length != 0)
            $(".divs div:visible").next().show().prev().hide();
        else {
            $(".divs div:visible").hide();
            $(".divs div:first").show();
        }
        return false;
    });

    $("#prev").click(function(){
        if ($(".divs div:visible").prev().length != 0)
            $(".divs div:visible").prev().show().next().hide();
        else {
            $(".divs div:visible").hide();
            $(".divs div:last").show();
        }
        return false;
    });
});


$(function(){
    $('#hms_timer').countdowntimer({
        hours : 0,
        minutes :1,
        seconds : 0,
        size : "lg",
    });
});

/*under observation*/
function submitConfirm()
{
	if(confirm('READY TO SUBMIT'))
		return true;
	else
		return false;
	
}


