
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>jquery countDownTimer Demo reverse countdown clock</title>
        <meta name="description" content="reverse clock plugin for jQuery.">
            <meta name="keywords" content="jQuery, plugin, count down">
                <meta name="viewport" content="width=device-width,initial-scale=1">
                    <script type="text/javascript" src="static/js/jquery-2.0.3.js"></script>
                    <script type="text/javascript" src="static/js/jquery.countdownTimer.js"></script>
                    <link rel="stylesheet" type="text/css" href="static/css/jquery.countdownTimer.css" />
                    <script src="static/js/style.js"></script>
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
</br>
</br>
<button>
SUBMIT TEST
</button>
<!-- <input type="submit" value="SUBMIT SOLUTIONS"> -->
 <div id="main">
                         
			                               <h3><u>Reverse countdown to zero from time set to hours, minutes & seconds.</u></h3>
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
                          <!--   <script>
                               
                            </script> -->
                            </div>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> -->

</body>
</html>