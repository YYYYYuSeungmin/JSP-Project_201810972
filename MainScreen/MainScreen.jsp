<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../DB/dbConn.jsp" %>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<% 
Enumeration en = session.getAttributeNames();
String name = null;
String u_id = null;
String u_name = null;
Boolean u_mg = null;
	if(en.hasMoreElements()){
		name = en.nextElement().toString();
		u_id = session.getAttribute("ID").toString();
		u_name = session.getAttribute("NAME").toString();
		u_mg = (boolean)session.getAttribute("MG");
} %>

<meta charset="UTF-8">
<title>승민 게시판</title>
</head>
<body>

<div align="center">
	환영합니다. <%= u_name %> 님.
	<input type="button" value="로그아웃" onclick="location.href='../User/Logout.jsp?id=<%=u_id %>'">
	<% // 관리자 전용 버튼들.
	if (u_mg == true){
		%>
		<input type="button" value="회원리스트" onclick="location='../User/Manage/UserList.jsp'">
		<%
	}
	%>
	<hr>
	<h1>게시글 목록 <br>
	</h1>
	<hr>
		<%
		Statement sm = conn.createStatement();
		ResultSet rs = sm.executeQuery("SELECT * FROM post ORDER BY postID DESC");
		%>
	<fieldset style="width:520px">
		<table border="1" style="row:30">
			<tr>
				<th>번호</th>
				<th style="width:300px">제목</th>
				<th style="width:100px">작성자</th>
				<th style="width:100px">작성일</th>
			</tr>
		<% while(rs.next()){ %>
			<tr>
				<td><%=rs.getInt("postID") %></td>
				<td><A href="Post/ViewPost.jsp?postID=<%=rs.getString("postID")%>" style="color:black; text-decoration:none"><%=rs.getString("title") %></A></td>
				<td><%=rs.getString("writerID") %></td>
				<td><%=rs.getDate("signuptime") %></td>
			</tr>
		<% } %>
		</table>
		<div align="right">
			<input type="button" value="글 작성" onclick="location='Post/CreatePost.jsp'">
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