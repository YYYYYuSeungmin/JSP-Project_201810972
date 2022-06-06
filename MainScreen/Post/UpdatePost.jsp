<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승민 게시판</title>
<%
	String postID = request.getParameter("postID");

	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT * FROM post WHERE postID='" + postID + "';");
	
	rs.next();
%>
</head>
<body>
<div align="center">
	<h1>게시글 수정하기</h1>
	<hr>
	<fieldset style="width:550px; height:650px">
		<form action="Update_do.jsp" method="post"> 
			<div align="left" style="display:inline">
				글 번호 : <input type="text" name="postID" value="<%=postID %>" style="width:8px" readonly> <br>
			</div>
				제목 : <input type="text" name="title" value="<%=rs.getString("title") %>">
			<hr>
				<textarea rows="35" cols="65" name="contents"><%=rs.getString("contents") %></textarea>
			<div align="right">
				<br>
				<input type="submit" name="수정 완료">
				<A href="ViewPost.jsp?postID=<%=postID %>" style="color:black; text-decoration:none">취소</A>
			</div>
		</form>
	</fieldset>
</div>
<%
rs.close();
sm.close();
conn.close();
%>
</body>
</html>