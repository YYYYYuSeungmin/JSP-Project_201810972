<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201810972 유승민 JSP 프로젝트 게시판</title>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<form action="Login.jsp" method="get">
		<fieldset style="width:180px">
			ID : <br>
			<input type="text" name="id"><br><br>
			PASSWORD : <br>
			<input type="password" name="passwd"><br><br>
			&nbsp; <input type="submit" value=" Login "> &nbsp;
			<input type="button" value="Register" onclick="location='Register.jsp'">
		</fieldset>
	</form>
</body>
</html>
