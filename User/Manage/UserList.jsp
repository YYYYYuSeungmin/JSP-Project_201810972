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
		//관리자만 접근
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
		//---------------------------------
		
		//검색 키 값 설정
		String Search_Key = null;
		if(request.getParameter("Key") != null){
			Search_Key = request.getParameter("Key");
		}
		String Search_type = "userID";
		if(request.getParameter("search_type") != "userID"){
			Search_type = request.getParameter("search_type");
		}
		//----------------------------------------
		
		//페이징 처리 할 변수 선언
		int firstPage = 1;
		int lastPage = 0;
		int pageNum;
		int pagecount = 0;
		
		Statement sm = conn.createStatement();
		ResultSet rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members");
		
		//모든 멤버 불러오기
		if (Search_Key == null){
			rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members");
			while(rs.next()){
				pagecount++;
			}
			lastPage = (pagecount / 5) + 1;
			rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members");
		}
		
		//이름을 검색하였을 때 불러올 목록 리스트
		else {
	         if (Search_type.equals("id")){
	             rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE id like '%" + Search_Key + "%'");
	             while(rs.next()){
	 				pagecount++;
		 		}
		 		lastPage = (pagecount / 5) + 1;
		 		rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE id like '%" + Search_Key + "%'");
	          }
	          //이름으로 검색, Search_type == userName;
	          else if (Search_type.equals("name")){
	             rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE name like '%" + Search_Key + "%'");
	             while(rs.next()){
	 				pagecount++;
		 		}
	             lastPage = (pagecount / 5) + 1;
	             rs = sm.executeQuery("SELECT id, passwd, name, manager FROM members WHERE name like '%" + Search_Key + "%'");
	          }
		}
		

		if (request.getParameter("pageNum") != null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			if(pageNum < 1){
				pageNum = 1;
			}
			if (pageNum > lastPage){
				pageNum = lastPage;
			}
			}
			else {
			pageNum = 1;
		}
		for (int i = 0; i < (pageNum-1) * 5; i++){
			rs.next();
		}
	%>
</head>
<body>
	Home > 등록 회원 관리
	<hr>
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
		for (int i = 0; i < 5; i++){
			if (rs.next()){
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
		}

		rs.close();
		sm.close();
		conn.close();
		%>
		</table>
		<input type="button" value="완료" onclick="location='../../MainScreen/MainScreen.jsp'">
		&nbsp;<input type="button" value="전체 목록" onclick="location='UserList.jsp'"><br>
		
		<form action="UserList.jsp" method="post">
		항목 : 
		<input type="radio" name="search_type" value="id" checked="checked">ID
		 <input type="radio" name="search_type" value="name">이름
		 <br>
		<input type="text" name="Key">&nbsp; <input type="submit" value="검색">
		<br>
		<A href="UserList.jsp?pageNum=<%=firstPage%>" style="color:black; text-decoration:none">[처음]</A>
		<A href="UserList.jsp?pageNum=<%=pageNum-1%>" style="color:black; text-decoration:none">[이전]</A>
		<A href="UserList.jsp?pageNum=<%=pageNum+1%>" style="color:black; text-decoration:none">[다음]</A>
		<A href="UserList.jsp?pageNum=<%=lastPage%>" style="color:black; text-decoration:none">[마지막]</A>
		</form>
</body>
</html>
