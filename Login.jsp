<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("passwd");
	
	request.setAttribute("id",id);
	request.setAttribute("pw",pw);
	
	//redirect방식, 값 전송 X
	//response.sendRedirect("MainScreen.jsp");
	pageContext.forward("MainScreen.jsp");
%>
</body>
</html>