/*$(document).ready(function(){
    $(".divs div").each(function(e) {
        if (e)
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
*/


/*under observation*/
function submitConfirm()
{
	if(confirm('Are you sure you want to submit your soutions and end the session...!'))
		return true;
	else
		return false;
	
}




