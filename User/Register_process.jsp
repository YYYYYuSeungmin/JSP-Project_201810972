<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../DB/dbConn.jsp" %>
<%
	String u_id = request.getParameter("id");
	String u_pw = request.getParameter("pw");
	String u_name = request.getParameter("name");
	
	String sql = "INSERT INTO members(id, passwd, name) VALUES";
	sql += "('" + u_id +"','" + u_pw + "','" + u_name + "')";

	Statement sm = conn.createStatement();
	
	int count = sm.executeUpdate(sql);
	if (count == 1){
		response.sendRedirect("./Main.jsp");
	}
	else{
		out.println("회원 가입 실패");
	}
	sm.close();
	conn.close();
%>