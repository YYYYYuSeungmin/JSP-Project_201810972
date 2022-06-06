<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
</head>
<body>
<script>
	function Register(){
		var f = document.user_info;
		
		// ID 유효성 검사, (영어 OR 숫자)
		for(count = 0; count < f.id.value.length; count++){
			var ch = f.id.value.charAt(count);
			if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= 0 && ch <= 9) || (ch == ""))){
				alert("아이디는 영어나 숫자로만 입력해주세요.");
				f.id.focus();
				return false;
			}
		}
		// PW 유효성 검사, (영어 or 숫자)
		for(count = 0; count < f.pw.value.length; count++){
			var ch = f.pw.value.charAt(count);
			if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= 0 && ch <= 9) || (ch == ""))){
				alert("비밀번호는 영어나 숫자로만 입력해주세요.");
				f.pw.focus();
				return false;
			}
		}
		alert("회원가입 완료 \n ID : "+ f.id.value + "\n PW : " + f.pw.value);
	}
</script>

<div align="Center">
<h1> 회원 가입 </h1>
<hr>
	<form action="Register_process.jsp" method="post" name="user_info" onsubmit="return Register()">
		<fieldset style="width:300px">
			<div align="LEFT">
				<legend> 회원 정보 입력</legend>
				ID :
				<div align="RIGHT" style="display:inline">
				<input type="text" name="id"><br>
				</div>
				PW :
				<div align="RIGHT" style="display:inline">
				<input type="password" name="pw"><br>
				</div>
				이름 :
				<div align="RIGHT" style="display:inline">
				<input type="text" name="name"><br><br>
				</div>
				<input type="submit" value="가입하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시작성">
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>