<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutProc.jsp</title>
</head>
<body>
	<h3>logoutProc.jsp</h3>
	<%
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
	%>
</body>
</html>