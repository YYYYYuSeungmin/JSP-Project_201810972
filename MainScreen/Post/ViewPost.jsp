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
	String sessionID = session.getAttribute("ID").toString();
	Boolean flag = (boolean)session.getAttribute("MG");
	String postID = request.getParameter("postID");
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT * FROM post WHERE postID='" + postID + "';");
	
	rs.next();
	
%>
</head>
<body>
<div align="center">
	<h1>게시글</h1>
	<hr>
	<fieldset style="width:550px; height:650px">
		제목 : <%=rs.getString("title") %>
		<div align="right">
		<%
		if (sessionID.equals(rs.getString("writerID")) || flag == true) {%>
			<A href="DeletePost.jsp?postID=<%=rs.getString("postID")%>" style="color:black; text-decoration:none">삭제</A>
			|
			<A href="UpdatePost.jsp?postID=<%=rs.getString("postID")%>" style="color:black; text-decoration:none">수정</A>
		<%}%>
		</div>
		<hr>
		<textarea rows="35" cols="70" name="content" readonly><%=rs.getString("contents") %></textarea>
		<div align="right">
			<input type="button" value="글목록" onclick="location='../MainScreen.jsp'">
		</div>
	</fieldset>
</div>
<%
rs.close();
sm.close();
conn.close();
%>
</body>
</html>