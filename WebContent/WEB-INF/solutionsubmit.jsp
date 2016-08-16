<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Thanks ${sessionName}</h3>
<h1>SUBMITTED SUCCESSFULLY and session is over</h1>
<h4>Click here to return to home page</h4>
<form action="/gdgmcq/index" method="get">
<input type="submit" name="HOME PAGE" value="HOME PAGE" />
</form>
</body>
</html>