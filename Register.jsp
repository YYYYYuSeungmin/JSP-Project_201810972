<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<script type="text/javascript">
	function Register()
	{
		alert("회원 가입 완료.\n ID : " + document.input_data.id.value + "\n PW : " + document.input_data.pw.value);
		location.href="Main.jsp";
	}
	</script>
</head>
<body>
<h1> 회원 가입 </h1>
<hr>
	<form action="#" method="get" name="input_data">
		<fieldset style="width:200px">
			<legend> 회원 정보 입력</legend>
			ID : <br>
			<input type="text" name="id"><br>
			PW : <br>
			<input type="password" name="pw"><br><br>
			<input type="radio" name="gender" value="남성">남
			<input type="radio" name="gender" value="여성">여 <br><br>
			<input type="button" value="회원등록" onclick="Register()">
	</form>
</body>
</html>
