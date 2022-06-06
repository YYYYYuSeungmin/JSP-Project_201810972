<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../DB/dbConn.jsp" %>

<!DOCTYPE html>	
<%
	String LoginId = request.getParameter("LoginId");
	String LoginPw = request.getParameter("LoginPw");
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT id, passwd, manager, name FROM members WHERE id like '"+ LoginId +"'");
	
	if(rs.next()){
		if (LoginPw.equals(rs.getString("passwd"))){	
			//세션 생성
			//manager == 1 : 관리자 , 0 : 사용자
			if(rs.getBoolean("manager") == true){
				session.setAttribute("ID", rs.getString("id"));
				session.setAttribute("NAME", rs.getString("name"));
				session.setAttribute("MG", true);
			}
			else {
				session.setAttribute("ID", rs.getString("id"));
				session.setAttribute("NAME", rs.getString("name"));
				session.setAttribute("MG", false);
			}
			%>
			<script>	
			alert("로그인 성공.");
			location.href="../MainScreen/MainScreen.jsp";
			</script>
			<%
		}
		else {
			%>
			<script>
			alert("로그인 실패.");
			location.href="Main.jsp";
			</script>
			<%
		}		
	}
	
	rs.close();
	sm.close();
	conn.close();
%>
