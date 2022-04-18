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
		
		var f = document.input_data;
		
		// ID 유효성 검사, (영어 OR 숫자)
		for(count = 0; count < f.id.value.length; count++){
			var ch = f.id.value.charAt(count);
			if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= 0 && ch <= 9))){// 영어 소문자 or 대문자 or 숫자
				alert("아이디는 영어나 숫자로만 입력해주세요.");
				f.id.focus();
				return false;
			}
		}
		
		// PW 유효성 검사, (영어 or 숫자)
		for(count = 0; count < f.pw.value.length; count++){
			var ch = f.pw.value.charAt(count);
			if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= 0 && ch <= 9))){// 영어 소문자 or 대문자 or 숫자
				alert("비밀번호는 영어나 숫자로만 입력해주세요.");
				f.pw.focus();
				return false;
			}
		}
		
		var id = f.id.value;
		var pw = f.pw.value;
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