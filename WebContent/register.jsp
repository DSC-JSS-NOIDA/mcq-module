<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function formValidation()
{
	var pass1 = document.getElementById("pass1").value;
	var pass2 = document.getElementById("pass2").value;
	
	if(pass1 != pass2)
	{
		
		alert('password not match');
		return false
	}
	alert('success');
	return true;
}
</script>
</head>
<body>
<h1>Register</h1>
<form action="/gdgmcq/RegistrationController.html" method="post" onsubmit="return formValidation();">
Name : <input type="text" name="name"  required />
<br>
College : <input type="text" name="college" required />
<br>
Branch : <input type="text" name="branch" required />
<br>
Email : <input type="email" name="email" required  />
<br>
Roll No : <input type="text" name="rollno" required />
<br>
Lab No. : <input type="text" name="labno" required />
<br>
Contact : <input type="text" name="contact" required />
<br>
Password : <input type="password" name="password" id="pass1" required />
<br>
Re-Password : <input type="password" name="repassword" id="pass2" required />
<br>
<input type="submit" value="SUBMIT" name="submit">
</form>

<p id="demo"></p>

</body>
</html>