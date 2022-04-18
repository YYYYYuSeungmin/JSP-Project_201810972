<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승민 게시판</title>
</head>
<body>
<%
	String id=(String)request.getAttribute("id");
	String pw=(String)request.getAttribute("pw");
	
	//id=request.getParameter("id");
	//pw=request.getParameter("pw");
%>
<h1>입력받은 ID :<%=id %> <br>
	입력받은 PW :<%=pw %>
</h1>
<hr>
<b>메인 화면은 구성중입니다.</b>
</body>
</html>