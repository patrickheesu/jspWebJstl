<%@ page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jst7_choose</h3>
<%
int ranNum = (int)(Math.random()*10);
String grade = "a" + ranNum;
out.println("grade : " + grade);
%>
<h3>choose</h3>
<c:set value="<%=grade %>" var="grade"/>
<c:choose>
	<c:when test="${grade=='a1' }">
	당신의 등급은 : A1
	</c:when>
	<c:when test="${grade=='a2' }">
	당신의 등급은 : A2
	</c:when>
	<c:when test="${grade=='a3' }">
	당신의 등급은 : A3
	</c:when>
	
	
</c:choose>


</body>
</html>