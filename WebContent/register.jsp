<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Register</h1>
<form action="/gdgmcq/RegistrationController.html" method="post">
Name : <input type="text" name="name" />
<br>
College : <input type="text" name="college" />
<br>
Branch : <input type="text" name="branch" />
<br>
Email : <input type="text" name="email">
<br>
Roll No : <input type="text" name="rollno">
<br>
Lab No. : <input type="text" name="labno">
<br>
Contact : <input type="text" name="contact">
<br>
Password : <input type="password" name="password">
<br>
<!-- Re-Password : <input type="text" name="repassword"> -->
<br>
<input type="submit" value="SUBMIT">
</form>

</body>
</html>