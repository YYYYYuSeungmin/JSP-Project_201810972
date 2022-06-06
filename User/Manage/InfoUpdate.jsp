<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<%
	boolean checkMg = (boolean)session.getAttribute("MG");
	if (checkMg == false){
		out.println("<script>alert('관리자가 아닙니다.');</script>");
		response.sendRedirect("../MainScreen.jsp");
	}
	String id = request.getParameter("id");
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE id='" + id + "';");
	rs.next();
%>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<div align="center">
	<form action="Update_do.jsp" method="post" name="user_info">
	<fieldset style="width:250px">
		<legend>회원 정보 수정</legend>
		<div align="left">
			ID : <input type="text" name="id" value="<%= id%>" readonly/><br>
			PW : <input type="text" name="passwd" value="<%= rs.getString("passwd")%>"><br>
			이름 : <input type="text" name="name" value=<%= rs.getString("name")%>><br>
			관리자 여부<br>
			<%
			if(rs.getBoolean("manager") == true) { 
			%>
			<input type='radio' name='manager' value='사용자' />사용자
			<input type='radio' name='manager' value='관리자' checked/>관리자
			<%
			} 
			else {
			%>
			<input type='radio' name='manager' value='사용자' checked/>사용자
			<input type='radio' name='manager' value='관리자' />관리자
			<% } %>
		</div>
	</fieldset>
	<input type="button" value="취소" onclick="location='UserList.jsp'">
	<input type="submit" value="수정">
	</form>
</div>
<%
rs.close();
sm.close();
conn.close();
%>
</body>
</html>