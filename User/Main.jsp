<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>201810972 유승민 JSP 프로젝트 게시판</title>
</head>
<body>
<div align="Center">
	<h1>로그인</h1>
	<hr>	
	<form action="Login.jsp" method="post">
		<fieldset style="width:180px">
		<div align="LEFT">
			아이디 : <br>
			<input type="text" name="LoginId"><br><br>
			비밀번호 : <br>
			<input type="password" name="LoginPw"><br><br>
			&nbsp; <input type="submit" value="로그인"> &nbsp;
			<input type="button" value="회원가입" onclick="location='Register.jsp'">
		</div>
		</fieldset>
	</form>
</div>
</body>
</html>