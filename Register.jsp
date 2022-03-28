<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<h1> 회원 가입 </h1>
<hr>
	<form action="#" method="get">
		<fieldset style="width:200px">
			<legend> 회원 정보 입력</legend>
			ID : <br>
			<input type="text" name="id"><br>
			PW : <br>
			<input type="password" name="pw"><br><br>
			<input type="radio" name="gender" value="남성">남
			<input type="radio" name="gender" value="여성">여 <br><br>
			<input type="button" value="회원등록" onclick="location='Main.jsp'">
	
	</form>
</body>
</html>
