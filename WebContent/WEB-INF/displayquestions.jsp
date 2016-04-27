
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>SOLVE question bitch !!</h1>
<!-- <form action="/gdgmcq/QuestionController.html" method="post"> -->
<c:forEach var="questionlist" items="${ques}">
<h2>${questionlist.question}</h2>
<h4><input type="radio" value="a"> ${questionlist.option1}</h4> 
<h4><input type="radio" value="b"> ${questionlist.option2}</h4> 
<h4><input type="radio" value="c"> ${questionlist.option3}</h4> 
<h4><input type="radio" value="d"> ${questionlist.option4}</h4> 
</c:forEach>
<input type="submit" value="SUBMIT SOLUTIONS">
 
</body>
</html>