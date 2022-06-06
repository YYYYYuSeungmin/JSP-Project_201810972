<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<div align="center">
	<h1>게시글 작성하기</h1>
	<hr>
	<fieldset style="width:550px; height:650px">
		<form action="Posting.jsp" method="post">
			글 제목 : <input type="text" name="title" style="width:300px"><br><br>
			<textarea rows="37" cols="70" name="content">글을 작성해주세요.</textarea>
			<div align="Right">
			<br>
				<input type="button" value="취소" onclick="location='../MainScreen.jsp'">&nbsp;
				<input type="submit" value="작성하기">
			</div>
		</form>
	</fieldset>
	</div>
	
</body>
</html>