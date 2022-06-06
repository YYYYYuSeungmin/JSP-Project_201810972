<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ include file = "../../DB/dbConn.jsp" %>

<%
	//관리자가 아닐시 
	boolean isManager;
	isManager = (boolean)session.getAttribute("MG");
	
	if (isManager == false){
		%>
		<script>
			alert("관리자가 아닐 시 접근이 불가능합니다.");
			location.href="../MainScreen.jsp";
		</script>
		<%
	}

	//변경된 내용 가져오기
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	int postID =  Integer.parseInt(request.getParameter("postID"));
	
	//업데이트 문
	
	String sql = "UPDATE post SET title=?, contents=? WHERE postID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, contents);
	pstmt.setInt(3, postID);

	pstmt.executeUpdate(); 
	
	pstmt.close();
	conn.close();
%>
<script>
	alert("수정 완료");
	location.href="ViewPost.jsp?postID=<%=postID %>";
</script>
