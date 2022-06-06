<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	//폼으로 받은 데이터
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String name = request.getParameter("name");
	String manager = request.getParameter("manager");
	boolean isManager;
	
	if (manager.equals("관리자")){
		isManager = true;
	}
	else {
		isManager = false;
	}
	
	String sql="update members set passwd=?, name=?, manager=? where id=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, pw);
	pstmt.setString(2, name);
	pstmt.setBoolean(3, isManager);
	pstmt.setString(4, id);
	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
%>
<script>
	alert("수정 완료");
	location.href="UserList.jsp";
</script>