<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>

<%
	int postID =  Integer.parseInt(request.getParameter("postID"));
	
	String sql = "DELETE FROM post WHERE postID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, postID);
	
	pstmt.executeUpdate(); 
	
	pstmt.close();
	conn.close();
%>

<script>
	alert("삭제 완료");
	location.href="../MainScreen.jsp";
</script>