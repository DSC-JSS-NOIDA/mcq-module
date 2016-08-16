
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>jquery countDownTimer Demo reverse countdown clock</title>
<meta name="description" content="reverse clock plugin for jQuery.">
<meta name="keywords" content="jQuery, plugin, count down">
<meta name="viewport" content="width=device-width,initial-scale=1">

<!--CSS FOR THE PAGE  -->

<!-- materialize.css is mutilated, and does not support materialize-CSS radio input tag. @author Tilhari-->
<link rel="stylesheet" href="static/css/materialize.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="static/css/style.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" type="text/css"
	href="static/css/jquery.countdownTimer.css" />
<link rel="stylesheet" href="static/css/tabs.css" type="text/css"
	media="screen, projection" />

<!--JS FOR TIMER -->
<!-- <script type="text/javascript" src="static/js/jquery-2.0.3.js"></script> -->
	<script type="text/javascript" src="static/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="static/js/jquery.countdownTimer.js"></script>
<script src="static/js/style.js"></script>



<!--JS FOR QUESTON NAVIGATOR  -->
	

<script type="text/javascript"
	src="static/js/jquery-ui-1.7.custom.min.js"></script>

<script type="text/javascript">
	$(function() {

		var $tabs = $('#tabs').tabs();

		$(".ui-tabs-panel")
				.each(
						function(i) {

							var totalSize = $(".ui-tabs-panel").size() - 1;

							if (i != totalSize) {
								next = i + 2;
								$(this)
										.append(
												"<a href='#' id='mover-btn' class='next-tab mover btn blue-grey darken-3' rel='" + next + "'>Next &#187;</a>");
							}

							if (i != 0) {
								prev = i;
								$(this)
										.append(
												"<a href='#' id='mover-btn' class='prev-tab mover btn blue-grey darken-3' rel='" + prev + "'>Prev</a>");
							}

						});

		$('.next-tab, .prev-tab').click(function() {
			$tabs.tabs('select', $(this).attr("rel"));
			return false;
		});

	});
</script>

</head>
<body background="static/images/quesbg.jpg">
	<div style="height: 90px" id="header_footer">
		<img src="static/images/gdgjsslogoblue.png" class="left">
		<div id="main" class="right">
		<table style="border: 0px;	margin-top: 20px;" class="blue-grey darken-3">
			<!-- <tr>
				<td style="width: 70px; text-align: center;">Hours</td>
				<td style="width: 60px; text-align: center;">Minutes</td>
				<td style="width: 70px; text-align: center;">Seconds</td>
			</tr> -->
			<tr>
				<td colspan="4"><span id="hms_timer" class="size_md"></span></td>
			</tr>
		</table>
	</div> 
	</div>


	<%
		int i = 1;
	%>
	<form action="/gdgmcq/SubmitSolution" method="post"
		onsubmit="return submitConfirm();">
		<div id="page-wrap">
			<div id="tabs">
				<!-- <div class="divs"> -->
				<c:forEach var="questionlist" items="${ques}">
					<%
						String nameid = "ques" + Integer.toString(i);
							request.setAttribute("nameid", nameid);
							String fragmentid = "fragment-" + Integer.toString(i);
							request.setAttribute("fragmentid", fragmentid);
							i++;
					%>
					<c:choose>
						<c:when test="${fragmentid=='fragment-1'}">
							<div id=${fragmentid } class="ui-tabs-panel">
						</c:when>
						<c:otherwise>
							<div id=${fragmentid } class="ui-tabs-panel ui-tabs-hide">
						</c:otherwise>
					</c:choose>

					<h5>${questionlist.question}</h5>
					<h6>
						<input type="radio" value="A" name=${nameid}>
						${questionlist.optionA}
					</h6>
					<h6>
						<input type="radio" value="B" name=${nameid}>
						${questionlist.optionB}
					</h6>
					<h6>
						<input type="radio" value="C" name=${nameid}>
						${questionlist.optionC}
					</h6>
					<h6>
						<input type="radio" value="D" name=${nameid}>
						${questionlist.optionD}
					</h6>
			</div>
			</c:forEach>
			<!-- </div> -->

			<div>
				<h5 style="color: grey">Question Navigator</h5>
			</div>
			<ul id="ques_nav_bar">
				<li><a href="#fragment-1">01</a></li>
				<li><a href="#fragment-2">02</a></li>
				<li><a href="#fragment-3">03</a></li>
				<li><a href="#fragment-4">04</a></li>
			</ul>


		</div>

		</div>


		<div style="height: 60px;" id="header_footer">
			<h6 class="left">Logged in as ${sessionName}</h6>
			<input type="submit" class=" right btn blue-grey darken-3" />
		</div>
	</form>






	<!-- <div id="main">

		<table style="border: 0px;">
			<tr>
				<td style="width: 70px; text-align: center;">Hours</td>
				<td style="width: 60px; text-align: center;">Minutes</td>
				<td style="width: 70px; text-align: center;">Seconds</td>
			</tr>
			<tr>
				<td colspan="4"><span id="hms_timer"></span></td>
			</tr>
		</table>
	</div> 
 -->	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> -->
</body>
</html>