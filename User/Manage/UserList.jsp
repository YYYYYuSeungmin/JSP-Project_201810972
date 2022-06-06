<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
	<%
		String Search_Key = null;
		if(request.getParameter("Key") != null){
			Search_Key = request.getParameter("Key");
		}
		
		Enumeration en = session.getAttributeNames();
		String name = null;
		String u_name = null;
		boolean u_mg = false;
		if(en.hasMoreElements()){
			name = en.nextElement().toString();
			u_name = session.getAttribute("NAME").toString();
			u_mg = (boolean)session.getAttribute("MG");
		}
		if(u_mg == false){
			out.println("<script>alert('관리자가 아닙니다.');</script>");
			response.sendRedirect("../MainScreen.jsp");
		}
	%>
</head>
<body>
	Home > 등록 회원 관리
	<hr>
	<% 	
		Statement sm = conn.createStatement();
		ResultSet rs;
	
		//모든 멤버 불러오기
		if (Search_Key == null){
			rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members");
		}
		//이름을 검색하였을 때 불러올 목록 리스트
		else {
			rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE name like '%" + Search_Key + "%'");
		}
		%>
		<table border="2">
		<tr>
		<th>Number</th>
		<th>ID</th>
		<th>Passwd</th>
		<th>Name</th>
		<th>관리자</th>
		<TH colspan="2">비고</TH>		
		</tr>
		<%
		int count = 1;
		while(rs.next()){
		%>
			<tr>
			<td><%=count %></td>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("passwd")%></td>
			<td><%=rs.getString("name") %></td>
			<td><% if(rs.getBoolean("manager") == true) { %> O <% } else { %> X <% }%> </td>
			<TD><A href="InfoUpdate.jsp?id=<%=rs.getString("id")%>">수정</A></TD>
			<TD><A href="delete_do.jsp?id=<%=rs.getString("id")%>">X</A></TD>
			</tr>
			<%
			count++;
		}
		rs.close();
		sm.close();
		conn.close();
		%>
		</table>
		<input type="button" value="완료" onclick="location='../../MainScreen/MainScreen.jsp'">
		&nbsp;<input type="button" value="전체 목록" onclick="location='UserList.jsp'"><br>
		
		<form action="UserList.jsp" method="post">
		<input type="text" name="Key">&nbsp; <input type="submit" value="검색">
		</form>
</body>
</html>