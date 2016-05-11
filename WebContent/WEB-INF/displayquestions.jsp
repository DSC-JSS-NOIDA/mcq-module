
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="description" content="reverse clock plugin for jQuery.">
            <meta name="keywords" content="jQuery, plugin, count down">
<script type="text/javascript" src="static/js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="static/js/jquery.countdownTimer.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/jquery.countdownTimer.css" />
<title>Insert title here</title>
</head>
<body>
<h1>you better SOLVE question !!</h1>
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
 <table style="border:0px;">
                                <tr>
                                    <td style="width:70px;text-align:center;">Hours</td>
                                    <td style="width:60px;text-align:center;">Minutes</td>
                                    <td style="width:70px;text-align:center;">Seconds</td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span id="hms_timer"></span></td><td>&nbsp;&nbsp;<button id="pauseBtnhms">Pause</button></td><td>&nbsp;&nbsp;<button id="stopBtnhms">Stop</button></td>
                                </tr>
                            </table>
                            <script>
                                $(function(){
                                    $('#hms_timer').countdowntimer({
                                        hours : 3,
                                        minutes :10,
                                        seconds : 10,
                                        size : "lg",
					pauseButton : "pauseBtnhms",
					stopButton : "stopBtnhms"
                                    });
                                });
                            </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="static/js/style.js"></script>
</body>
</html>