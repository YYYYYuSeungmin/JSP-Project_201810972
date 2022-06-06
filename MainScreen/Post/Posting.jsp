<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>
<!DOCTYPE html>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT max(postID) as MAX FROM post");
	rs.next();
	int COUNT = rs.getInt("max") + 1;
	String NAME = session.getAttribute("ID").toString();
	String sql = "INSERT INTO post(postID, title, contents, writerID) VALUES";
	sql += "('"+ COUNT +"','" + title +"','" + content + "','" + NAME + "')";
	
	
	int count = sm.executeUpdate(sql);
	if (count == 1){
		%>
		<script>
		alert("글 작성 완료!");
		location.href="../MainScreen.jsp";
		</script>
		<%
	}
	else{
		out.println("글 작성 실패");
	}
	rs.close();
	sm.close();
	conn.close();
%>