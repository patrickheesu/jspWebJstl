<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainForm.jsp</title>
<script>
	function logoutProc(){
		location.href="login/logoutProc.jsp";
	}
</script>
</head>
<body>
<h3>MainForm.jsp</h3>

<b><font size="3" color="skyblue">메인화면입니다.</font></b>

<%
if(session.getAttribute("sessionID") == null){
	
} else {
%>
	<h3>
		<font color="blue"><%=session.getAttribute("sessionID") %></font>님 안녕하세요!
	</h3>
	<br /><br />
	<input type="button" value="logout" onclick="logoutProc()" />
<%
}
%>	
</body>
</html>