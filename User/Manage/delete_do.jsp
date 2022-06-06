<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "/DB/dbConn.jsp" %>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	
	PreparedStatement pstmt = conn.prepareStatement("delete from members where id=?");
	pstmt.setString(1, id);
	
	pstmt.executeUpdate();
%>
<script>
	alert("삭제완료");
	location.href="UserList.jsp";
</script>