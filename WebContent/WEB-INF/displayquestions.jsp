
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
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
</script>
</head>
<body>
<h1>SOLVE question bitch !!</h1>
<%int i=1; %>
<!-- <form action="/gdgmcq/QuestionController.html" method="post"> -->
<div class="divs">
<c:forEach var="questionlist" items="${ques}">
<% String nameid="ques"+Integer.toString(i);request.setAttribute("nameid", nameid);i++; %>
<div>
<h2>${questionlist.question}</h2>
<h4><input type="radio" value="a" name=${nameid}> ${questionlist.option1}</h4> 
<h4><input type="radio" value="b" name=${nameid}> ${questionlist.option2}</h4> 
<h4><input type="radio" value="c" name=${nameid}> ${questionlist.option3}</h4> 
<h4><input type="radio" value="d" name=${nameid}> ${questionlist.option4}</h4>
</div>
</c:forEach>
</div>
<button>
<a id="prev">prev</a>
</button>
<button>
<a id="next">next</a>
</button>
<input type="submit" value="SUBMIT SOLUTIONS">
 
</body>
</html>